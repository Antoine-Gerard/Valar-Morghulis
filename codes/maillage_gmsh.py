# -*- coding: utf-8 -*-
#from __future__ import division
import numpy as np
#import matplotlib.pyplot as plt
import sys

# Construction des maillages pour 2 domaines:
# domaine Omega_0 := une oreillette, plane 2D, rectangulaire (0,Lx) x (0,Ly)
# domaine Omega_B := le faisceau de Bachman, plan 2D, (0,LB) x (0,L)

#Dans ce code on va doubler les noeuds présents au niveau de l'insertion du faisceau de Bachmann
#Pour cela on a besoin en entrée d'un fichier .msh qui contient le maillage
#avec les noeuds non doublés.


if len(sys.argv) < 2 :
    print "Attention pas de fichier d'entrée" 

else :
    keywords = "$Nodes\n"
    f = open(sys.argv[1], 'r')
    maillage = open("../maillages/domaine2.msh", 'w')
    ligne = ""

    #On recherche le mot clé $Nodes dans le .msh
    #Tant qu'on ne le trouve pas on avance dans le fichier.
    while ligne != keywords:
        ligne = f.readline()
        maillage.write(ligne)

    #On initialise un tableau destiné à contenir les noeuds du maillage
    #Puis on fait une boucle pour le remplir.
    nbrNoeuds = int(f.readline())
    maillage.write(str(nbrNoeuds)+'\n')
    nodes = np.zeros((nbrNoeuds, 4))

    for i in range(nbrNoeuds):
        l = f.readline()
        maillage.write(l)
        nodes[i,:] = map(float, l.split())
        i+=1
        
    #Maintenant on récupère les noeuds situé à l'insertion du faisceau de Bachmann
    noeuds_FB = nodes[(nodes[:,1]>=0.3) & (nodes[:,1]<=0.7) & (nodes[:,2]==0.5),:]

    # On va maintenant chercher les éléments qui ont un coté
    # situé sur l'interface

    keywords = "$Elements\n" 
    while ligne != keywords:
        ligne = f.readline()
        maillage.write(ligne)
        
    nbrElements = int(f.readline())
    maillage.write(str(nbrElements) + '\n')
    Elements = np.zeros((nbrElements, 8))

    for i in range(nbrElements):
        l = f.readline()
        Elements[i,:] = map(float, l.split())
        i+=1
    
    #Construction d'un tableau qui contiendra les triangles ayant un côté
    #touchant l'interface.
    triangles_FB = np.zeros((1,8))
    for i in range(len(noeuds_FB)):
        triangles_FB = np.concatenate((triangles_FB, Elements[(Elements[:,5]==noeuds_FB[i,0]) | (Elements[:,6]==noeuds_FB[i,0]) | (Elements[:,7]==noeuds_FB[i,0]),:]), axis = 0)
        
    triangles_FB = np.delete(triangles_FB, (0), axis = 0)

    #Attention triangles_FB contient des doublons
    #On va donc ici créer un tableau sans doublons
    i = map(int, set(triangles_FB[:,0])) 
    triangles_FB = np.zeros((len(i),8))
    for k in range(len(i)):
        triangles_FB[k,:] = Elements[Elements[:,0] == i[k], :]
    

    #Maintenant nous constuisons un tableau contenant les triangles situés
    #à l'interface du coté supérieur
    triangle_sup = np.zeros((1,8))
    for i in range(len(triangles_FB)):
        if((nodes[triangles_FB[i,5]-1,2] > 0.5) | (nodes[triangles_FB[i,6]-1,2] > 0.5) | (nodes[triangles_FB[i,7]-1,2] > 0.5)):
            temp = np.reshape(triangles_FB[i,:],(1,8)) 
            triangle_sup = np.concatenate((triangle_sup, temp), axis = 0)

    #Construction du tableau contenant les triangles inférieur à l'interface.
    i = np.setdiff1d(triangles_FB[:,0], triangle_sup[:,0])
    
    triangle_inf = np.zeros((len(i), 8))
    for k in range(len(i)):
        triangle_inf[k, :] = triangles_FB[triangles_FB[:,0] == i[k], :]

    i = map(int, triangle_inf[:,0] - 1)
    Elements[i,4] = 1

    i = map(int, triangle_sup[:,0] - 1)
    Elements[i,4] = 2
           
    f.closed
    maillage.closed

    maillage = open("../maillages/domaine2.msh", 'a')
    
    for i in range(len(Elements)):
        ligne = str(int(Elements[i,0])) + ' ' + str(int(Elements[i,1])) + ' ' + str(int(Elements[i,2])) + ' ' + str(int(Elements[i,3])) \
                + ' ' + str(int(Elements[i,4])) + ' ' + str(int(Elements[i,5])) + ' ' + str(int(Elements[i,6])) + ' ' + str(int(Elements[i,7])) + '\n'  
        maillage.write(ligne)
        
    maillage.write('$EndElements')
    maillage.close

    np.savetxt('../maillages/noeuds_FB.txt', noeuds_FB, fmt = ['%i' , '%.4f', '%.2f', '%i'])
