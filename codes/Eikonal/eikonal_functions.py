#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from math import sqrt

def ajCoordonnees(x,y):
    if ((x[0] == 499) & (y[0] == 1)):
        return ( 0, x[1] + y[1])
    if ((x[0] == 0) & (y[0] == -1)):
        return (499, x[1] + y[1])
    if ((x[1] == 0) & (y[1] == -1)):
        return (x[0] + y[0], 499)
    if ((x[1] == 499) & (y[1] == 1)):
        return (x[0] + y[0] ,0)

    return ( x[0] + y[0], x[1] + y[1])


def calculeT(x, T_Voisin, Fij, dx):
    nu1 = min(T_Voisin[0][0], T_Voisin[1][0])
    nu2 = min(T_Voisin[2][0], T_Voisin[3][0])

    if ((max(nu1,nu2) - min(nu1,nu2)) < dx):
        return (nu1 + nu2)/2 + 1./2 * (sqrt( -(nu1 - nu2)**2 + 2 * dx**2))
    else:
        return min(nu1, nu2) + dx


def voisinAlive(x, ensemble):
    deplacements = [(-1,0), (1,0), (0,-1), (0,1)]
    for i in range(4):
        if (ajCoordonnees(x,deplacements[i]) in ensemble):
            return ajCoordonnees(x,deplacements[i])


def updateNarrow(ensemble, T):
    A = set()
    for (k,(i,j)) in ensemble:
        A.add((T[i,j],(i,j)))

    return A

def initVoisin(A, T):
    Voisin = set()


    for (k,(i,j)) in A:
        if (i != 0):
            Voisin.add((T[i-1,j],(i-1,j)))
        if (i != 499):
            Voisin.add((T[i+1,j],(i+1,j)))
        if (j != 0):
            Voisin.add((T[i,j-1],(i,j-1)))
        if (j != 499):
            Voisin.add((T[i,j+1],(i,j+1)))

    return Voisin


def addVoisin(x,T):
    Voisin = set()
    deplacements = [(-1,0), (1,0), (0,-1), (0,1)]
    for i in range(4):
        Voisin.add((T[ajCoordonnees(x,deplacements[i])], ajCoordonnees(x,deplacements[i])))

    return Voisin

def nbrVoisin(x,ensemble):
    i = 0;
    deplacements = [(-1,0), (1,0), (0,-1), (0,1)]
    for i in range(4):
        if(ajCoordonnees(x,deplacements[i]) in ensemble):
            i+=1

    return i


def evalDistance(x,T, dx):
    Voisins = []
    deplacements = [(-1,0), (1,0), (0,-1), (0,1)]
    for i in range(4):
        Voisins.append(ajCoordonnees(x,deplacements[i]))

    Tvoisin = [(T[i,j], (i,j)) for (i,j) in Voisins]

    return calculeT(x, Tvoisin, 1, dx)


####Procedure pour le tri par tas

def echanger(liste, i1, i2):
    liste[i1], liste[i2] = liste[i2], liste[i1]
    return liste


def Redescendre(Tas, Rang):
    k = len(Tas)
    while(Rang <= k/2):
        rgFils = 2*Rang
        if( rgFils <  k):
            if (Tas[rgFils-1][0] > Tas[rgFils][0]):
                rgFils = rgFils+1
            if(Tas[Rang-1][0] > Tas[rgFils-1][0]):
                Tas = echanger(Tas, rgFils-1, Rang-1)
                Rang = rgFils
            else:
                Rang = k/2 + 1
        else:
            Rang = k/2+1


def Remonter(Tas,Rang):
    k = len(Tas)
    while( (Rang-1 >= 0) & (Tas[Rang/2-1][0]>Tas[Rang-1][0]) ):
        echanger(Tas, Rang-1, Rang/2-1)
        Rang = Rang/2

def Ajouter(Tas,Elements):
    Tas.append(Elements)
    Remonter(Tas,len(Tas))

def Extraire(Tas):
    Tas[0] = Tas[len(Tas)-1]
    del(Tas[-1])
    Redescendre(Tas,1)

    return Tas

def construireTas(T):
    Tas = []
    for i in range(len(T)):
        Ajouter(Tas, T[i])

    return Tas
