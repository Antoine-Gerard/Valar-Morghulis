# -*- coding: utf-8 -*-
#from __future__ import division
import numpy as np
#import matplotlib.pyplot as plt


# Construction des maillages pour 2 domaines:
# domaine Omega_0 := une oreillette, plane 2D, rectangulaire (0,Lx) x (0,Ly)
# domaine Omega_B := le faisceau de Bachman, plan 2D, (0,LB) x (0,L)

Lx = 1.
Ly = 1.
LB = 0.4

# Le branchement entre ces deux domaines est
# Sur le bord gauche {0}x(0,LB) du faisceau de Bachmann
# Sur l'arète (0.5*(Lx-LB), 0.5*(Lx+LB)) x {Ly/2}

# On construit déjà le domaine Omega_0
# Les sommets
x0 = np.array([[0,0], [Lx,0], [Lx,Ly], [0,Ly], # coins extérieurs du domaine Omega_0
               [0.5*(Lx-LB),0.5*Ly], [0.5*(Lx+LB),0.5*Ly]], # extrémités du Bachmann
              dtype=np.float)
# Les arètes
a0 = np.array([[1,2],[2,3],[3,4],[4,1],[5,6]],dtype=np.int)

# Écriture du fichier .poly
# First line: <# of vertices> <dimension (must be 2)> <# of attributes> <# of boundary markers (0 or 1)>
# Following lines: <vertex #> <x> <y> [attributes] [boundary marker]
# One line: <# of segments> <# of boundary markers (0 or 1)>
# Following lines: <segment #> <endpoint> <endpoint> [boundary marker]
# One line: <# of holes>
# Following lines: <hole #> <x> <y>
# Optional line: <# of regional attributes and/or area constraints>
# Optional following lines: <region #> <x> <y> <attribute> <maximum area>

#Ouverture du fichier mesh.poly en ecriture
fichier = open("mesh.poly","w")
fichier.write("6 2 0 0\n")

#Coordonnées des points
for i in range(len(x0)):
    fichier.write("%s %s %s\n" % (i+1, x0[i,0], x0[i,1]))

fichier.write("5 0\n")

#Ecriture des segments
for i in range(len(a0)):
    fichier.write("%d %d %d\n" % (i+1, a0[i,0], a0[i,1]))

fichier.write("0\n1\n1 0.5 0.25 0 -1")
    

fichier.close()    

