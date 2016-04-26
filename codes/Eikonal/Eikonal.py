#!/usr/bin/env python
# -*- coding: utf-8 -*-

from eikonal_functions import *
from matplotlib.mlab import griddata

n = 500

x = np.linspace(0,1,n)
y = np.linspace(0,1,n)

dx = 1./(len(x)-1)

T = 1. * np.ones((n,n))
Tab = np.zeros((n,n))

A = set()
Alive = set()

for i in range(len(x)):
    for j in range(len(y)):
        verif =  ((x[i]  <= 0.05)) \
                 # or ((0.75-x[i])**2 + (0.25-y[j])**2 - 0.05**2 < 1e-3) \
                 # or ((0.75-x[i])**2 + (0.75-y[j])**2 - 0.05**2 < 1e-3) \
                 # or ((0.25-x[i])**2 + (0.75-y[j])**2 - 0.05**2 < 1e-3) \

        if( verif ) :
            T[i,j] = 0
            Tab[i,j] = 1
            A.add((T[i,j],(i,j)))

        #verif = ((x[i]-0.05)  <= 1e-2) \
        #        or ((0.75-x[i])**2 + (0.25-y[j])**2 <=0.05**2) \
        #        or ((0.75-x[i])**2 + (0.75-y[j])**2 <=0.05**2) \
        #        or ((0.25-x[i])**2 + (0.75-y[j])**2 <=0.05**2)
        #
        #if( verif ) :
        #    Tab[i,j] = 1
        #    T[i,j] = 0
        #    Alive.add((T[i,j],(i,j)))

narrowBand = initVoisin(A, T)


tmp = narrowBand.copy()

for (k,(i,j)) in tmp:
    if (Tab[(i,j)] == 1):
        narrowBand.remove((k,(i,j)))

for (k,(i,j)) in narrowBand:
    Tab[i,j] = -1
    T[i,j] = evalDistance((i,j), T, dx)


narrowBand = updateNarrow(narrowBand, T)

Tas = construireTas(list(narrowBand))

m = len(Tas)
while (m !=0 ):
    tmp = Tas[0]
    Alive.add(Tas[0])
    Tas = Extraire(Tas)
    Tab[tmp[1]] = 1
    voisinX = addVoisin(tmp[1], T)
    for (k,(i,j)) in voisinX:
        if(Tab[i,j] != 1):
            T[i,j] = evalDistance((i,j), T, dx)
            if(Tab[i,j] != -1):
                Ajouter(Tas, (T[i,j], (i,j)))
                Tab[i,j] = -1

    m = len(Tas)
    print ("valeur de k = %d") %m

import matplotlib.pyplot as plt

#grid_x, grid_y = np.mgrid[0:1:500j,0:1:500j]

#ind_x, ind_y = np.mgrid[0:500,0:500]
#x = x[ind_x].reshape(n*n)
#y = y[ind_y].reshape(n*n)

#grid_z0 = griddata(x, y, (T.reshape(n*n)), grid_x, grid_y, interp='nn')
#CS = plt.contour(grid_x, grid_y, grid_z0, 15, linewidths=0.5, colors='k')

#CS = plt.contourf(grid_x, grid_y, grid_z0, 15, cmap='jet', vmax=abs(grid_z0).max(), vmin=-abs(grid_z0).max())





plt.contourf(T, 15, alpha=.75, cmap='jet')
C = plt.contour(T, 30, colors='black', linewidth=.5)

#plt.clabel(C, inline=2, fontsize=10)
# plt.xticks([]), plt.yticks([])

plt.colorbar()
plt.show()
