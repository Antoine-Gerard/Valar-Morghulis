#!/usr/bin/env python
# -*- coding: utf-8 -*-

from eikonal_manifold import *
from eikonal_functions import *
from lecture_maillage import *
from collections import defaultdict
from scipy.interpolate import griddata
from tvtk.api import tvtk
from mayavi import mlab
import matplotlib.pyplot as plt

A = set()
Alive = set()

Filename = "LA-endo-fibres.mesh"

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
    if i%1000 == 0:
        print "%d itérations" %i
#
T = 70. * np.ones((len(Points)))
Tab = np.zeros((len(Points)))
k=0
#
#
#
#for i in range(len(Points)):
ind = [17993, 17992, 18619, 14842, 39364, 16718, 13594]

for i in ind:
    T[i] = 0
    Tab[i] = 1
    A.add(i)
    Alive.add(i)



narrowBand = voisinsInit(A, Voisins, Alive)
#
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


#Plot isoline

#
#
#grid_x, grid_y = np.mgrid[0:1:100j, 0:1:100j]
#
#
#grid_z0 = griddata(Points[:,:2], T, (grid_x, grid_y), method='nearest')
#CS = plt.contour(grid_x, grid_y, grid_z0, 15, linewidths=0.5, colors='k')
#
#CS = plt.contourf(grid_x, grid_y, grid_z0, 15, cmap='jet', vmax=abs(grid_z0).max(), vmin=-abs(grid_z0).max())


#fig = plt.figure()
#ax = fig.add_subplot(111, projection='3d')
#ax.scatter(Points[:,0], Points[:,1], Points[:,2], c=T)

mesh = tvtk.PolyData(points=Points, polys=Triangles-1)
mesh.point_data.scalars = T
mesh.point_data.scalars.name = 'Data'


w = tvtk.XMLPolyDataWriter(input=mesh, file_name='data.vtp')
w.write()

source = mlab.pipeline.open('data.vtp')

surf = mlab.pipeline.surface(source,colormap='gist_rainbow')
lines = mlab.pipeline.contour_surface(source, contours = 20, colormap = 'gist_rainbow')


mlab.colorbar()

#plt.colorbar()
