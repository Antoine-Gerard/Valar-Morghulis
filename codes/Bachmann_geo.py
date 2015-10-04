# -*- coding: utf-8 -*-
#from __future__ import division
import numpy as np
#import matplotlib.pyplot as plt
import sys


#Ici nous allons créer un fichier .geo (gmsh) représentant
#le faisceau de Bachmann (cas test) en utilisant les noeuds
#générés par gmsh lors du maillage de la pièce de tissu test
#contenant l'insertion du FB.



if len(sys.argv) < 2 :
    print "Attention pas de fichier d'entrée" 

else :
    Bachmann = np.loadtxt(sys.argv[1])
    geo_file = open('../maillages/bachmann.geo', 'w')
    
    geo_file.write('Point(1) = {0, 0, 0, 0.01};\n')
    geo_file.write('Point(2) = {0.4, 0, 0, 0.01};\n')
    geo_file.write('Point(3) = {0.4, 1, 0, 0.01};\n')
    geo_file.write('Point(4) = {0, 1, 0, 0.01};\n')

    for i in range(2, len(Bachmann)):
        geo_file.write('Point(' + str(i+3) + ') = { ' + str(Bachmann[i,1] - 0.3) + \
                       ', 0, 0, 0.01};\n')
    
    
    geo_file.write('\nLine(1) = {1, 2};\n')
    geo_file.write('Line(2) = {2, 3};\n')
    geo_file.write('Line(3) = {3, 4};\n')
    geo_file.write('Line(4) = {4, 1};\n')
    geo_file.write('Line Loop(1) = {1, 2, 3, 4};\n')
    
    geo_file.write('\nPlane Surface(1) = {1};\n')
      
    geo_file.write('\nPhysical Surface(1) = {1};\n')
    geo_file.close
