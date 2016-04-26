#!/usr/bin/env python
# -*- coding: utf-8 -*-

from eikonal_manifold import *
from eikonal_functions import *
from lecture_maillage import *
from collections import defaultdict
from scipy.interpolate import griddata

A = set()
Alive = set()

Filename = "carre_structure.mesh"

Points = getPoints(Filename)
Points[:,2] = Points[:,2] - 0.5

Triangles = getTriangles(Filename)

Triangles = np.int_(Triangles)

n = len(Points)


Voisins = defaultdict(set)

for i in range(len(Triangles)):
    Voisins[Triangles[i,0]-1] = Voisins[Triangles[i,0]-1].union({Triangles[i,1]-1, Triangles[i,2]-1})
    Voisins[Triangles[i,1]-1] = Voisins[Triangles[i,1]-1].union({Triangles[i,0]-1, Triangles[i,2]-1})
    Voisins[Triangles[i,2]-1] = Voisins[Triangles[i,2]-1].union({Triangles[i,0]-1, Triangles[i,1]-1})

T = 1. * np.ones((len(Points)))
Tab = np.zeros((len(Points)))
k=0



for i in range(len(Points)):
    verif =  (0.5-Points[i,0])**2 + (0.5-Points[i,1])**2 - 0.1**2 < 1e-6

    if( verif ) :
        T[i] = 0
        Tab[i] = 1
        A.add(i)
        Alive.add(i)


    verif = (0.5-Points[i,0])**2 + (0.5-Points[i,1])**2 <= 0.1**2

    if( verif ) :
        Tab[i] = 1
        T[i] = 0
        k+=1
        Alive.add(i)


narrowBand = voisinsInit(A, Voisins, Alive)

k=[]
for i in narrowBand:
    t = localeDist(i, Voisins, Points, T, Alive)
    T[i] = t
#    tmp = list(Voisins[i])
#    T[i] = 0
#    for j in tmp:
#        if ((j in A) | (j in Alive) ):
#            k.append((i,j))
#            h = norm(Points[i,:] - Points[j,:])
#            T[i] += 1./h**2
#    if(T[i] != 0):
#        T[i] = sqrt(1./T[i])

TNarrow = heapsort(T[list(narrowBand)])
tmp = heappop(TNarrow)

k = len(TNarrow)
while (k != 0):

    ind = (np.argwhere(T == tmp))[0,0]
    Alive.add(ind)
    voisinsLocal = voisinAdd(ind, Voisins, Points)
    for (i,h) in voisinsLocal:
        if (i in narrowBand):
            farAway = False
        else:
            farAway = True
            narrowBand.add(i)

        if (i not in Alive):
            t = localeDist(i, Voisins, Points, T, Alive)
            if (t < T[i]):
                if (not farAway):
                    TNarrow[TNarrow.index(T[i])] = t
                else:
                    heappush(TNarrow, t)


                T[i] = t
                heapsort(TNarrow)


    tmp = heappop(TNarrow)
    k = len(TNarrow)
    #print "%d voisins" %k



import matplotlib.pyplot as plt


grid_x, grid_y = np.mgrid[0:1:100j, 0:1:100j]


grid_z0 = griddata(Points[:,:2], T, (grid_x, grid_y), method='nearest')
CS = plt.contour(grid_x, grid_y, grid_z0, 15, linewidths=0.5, colors='k')

CS = plt.contourf(grid_x, grid_y, grid_z0, 15, cmap='jet', vmax=abs(grid_z0).max(), vmin=-abs(grid_z0).max())



plt.colorbar()
plt.show()
