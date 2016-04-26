#!/usr/bin/env python
# -*- coding: utf-8 -*-

#Fichiers regroupant des fonctions utiles
#pour lire un maillage au format .mesh en python

import numpy as np

def getPoints(Filename):
    """Return points coordinates of your mesh file

    Filename: name of your mesh file

    """
    myFile = open(Filename, 'r')
    line = ""
    while( line != " Vertices\n" ):
        line = myFile.readline()

    nbrVertices = int(myFile.readline())
    Points = np.zeros((nbrVertices,3))

    for i in range(nbrVertices):
        tmp = map(float, (myFile.readline()).split())
        Points[i,:] = tmp[0:-1]

    return Points

def getTriangles(Filename):
    """Return Triangles of your mesh file

    Filename: name of your mesh file

    """
    myFile = open(Filename, 'r')
    line = ""
    while( line != " Triangles\n" ):
        line = myFile.readline()

    nbrTriangles = int(myFile.readline())
    Triangles = np.zeros((nbrTriangles,3))

    for i in range(nbrTriangles):
        tmp = map(float, (myFile.readline()).split())
        Triangles[i,:] = tmp[0:-1]

    return Triangles
