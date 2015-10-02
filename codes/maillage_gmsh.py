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
    keywords2 = "$EndNodes"
    f = open(sys.argv[1], 'r')
    ligne = ""

    #On recherche le mot clé $Nodes dans le .msh
    #Tant qu'on ne le trouve pas on avance dans le fichier.
    while ligne != keywords:
        ligne = f.readline()


    #On initialise un tableau destiné à contenir les noeuds du maillage
    #Puis on fait une boucle pour le remplir.
    nbrNoeuds = int(f.readline())
    nodes = np.zeros((nbrNoeuds, 4))

    for i in range(nbrNoeuds):
        l = f.readline()
        nodes[i,:] = map(float, l.split())
        i+=1

    #Maintenant on récupère les noeuds situé à l'insertion du faisceau de Bachmann
    
    
        
    f.closed
