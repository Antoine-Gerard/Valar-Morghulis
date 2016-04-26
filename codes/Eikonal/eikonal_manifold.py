#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from math import sqrt
from heapq import *
from numpy.linalg import norm

def noeudsVoisins( xIndex , Triangles):
    tmp = Triangles[(Triangles[:,0] == xIndex) | (Triangles[:,1] == xIndex) | (Triangles[:,1] == xIndex), :]

    xTriangle = tmp.tolist()

    return xTriangles

def voisinsInit(A, myDict, Alive):
    tmp = list(A)
    voisins = set()

    for i in tmp:
        Neighbor = myDict[i]
        for j in Neighbor:
            if((j not in Alive) & (j not in A) ):
                voisins.add(j)

    return voisins

def activVoisinAdd(x, myDict, Points, Alive):
    tmp = list(myDict[x])
    myList = []
    for j in tmp:
        h = norm(Points[x,:] - Points[j,:])
        if(j in Alive):
            myList.append((j, h))

    return myList

def voisinAdd(x, myDict, Points):
    tmp = list(myDict[x])
    myList = []
    for j in tmp:
        h = norm(Points[x,:] - Points[j,:])
        myList.append((j, h))

    return myList

def localeDist(x, Voisins, Points, T, Alive):
    voisinsLocal = activVoisinAdd(x, Voisins, Points, Alive)
    ind = [voisinsLocal[i][0] for i in range(len(voisinsLocal))]
    TLocal = T[ind]
    indSort = TLocal.argsort()

    TLocal = TLocal[indSort]
    voisinsLocal = [voisinsLocal[i] for i in indSort]

    Tsh = [ TLocal[0]/(voisinsLocal[0][1]**2)]
    hInv = [ 1./(voisinsLocal[0][1]**2) ]

    xm = ((Tsh[0] + sqrt(hInv[0]))) / ( hInv[0] )

    m = 0
    n = len(TLocal)
    if(n == 1):
        return xm

    while((m <= n-2) & (xm >= TLocal[m+1])  ):
        Tsh.append(TLocal[m+1] / (voisinsLocal[m+1][1]**2))
        hInv.append(1. / (voisinsLocal[m+1][1]**2))
        tmp = [hInv[i] \
               - sum([ (TLocal[i] - TLocal[j]) * ( hInv[i] * hInv[j] ) for j in range(i+1, m+2)]) \
               for i in range(m+2)]
        tmp.append(hInv[m+1])

        xm = (sum(Tsh) + sqrt(sum(tmp))) / (sum(hInv))

        if ( m <= n-2):
            m += 1
        if( m == n-1):
            TLocal =  np.append(TLocal, np.inf)


    return xm

def heapsort(iterable):
    h = []
    for value in iterable:
        heappush(h, value)
    return [heappop(h) for i in range(len(h))]
