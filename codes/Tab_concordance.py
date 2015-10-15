# -*- coding: utf-8 -*-
#from __future__ import division
import numpy as np
#import matplotlib.pyplot as plt
import sys

import re

#Ici on se propose de construire le tableau
#de concordance entre les noeuds du Faisceau
#de Bachmann et les noeuds situés à l'insertion
#de celui ci dans les oreillettes.

if len(sys.argv) < 3 :
    print "Attention pas de fichier d'entrée" 

else :
    FB = open(sys.argv[1], 'r')
    insertion_nodes = np.loadtxt(sys.argv[2])

    keywords = "$Nodes\n"

    ligne=""
    while ligne != keywords:
        ligne = FB.readline()

    nbrNoeuds = int(FB.readline())

    nodes = np.zeros((nbrNoeuds, 4))
    for i in range(nbrNoeuds):
        l = FB.readline()
        nodes[i,:] = map(float, l.split())
        i+=1

    #Recherche des noeuds qui concordent

    Tab_concordance = np.zeros((len(insertion_nodes), 2))
    for i in range(len(insertion_nodes)) :
        Tab_concordance[i,0] = insertion_nodes[i,0]
        Tab_concordance[i,1] = nodes[(abs((nodes[:,1] - (insertion_nodes[i,1] - 0.3))) < 1e-7) & \
                                     (nodes[:,2] == 0) , 0]

    np.savetxt('../maillages/concordance.txt', Tab_concordance, fmt = '%i')
                        
    FB.close
        
    
    
        
