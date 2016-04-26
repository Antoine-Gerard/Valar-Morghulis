from eikonal_functions import *

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
        verif =  ((0.25-x[i])**2 + (0.25-y[j])**2 - 0.05**2 < 1e-3) \
                  or ((0.75-x[i])**2 + (0.25-y[j])**2 - 0.05**2 < 1e-3) \
                  or ((0.75-x[i])**2 + (0.75-y[j])**2 - 0.05**2 < 1e-3) \
                  or ((0.25-x[i])**2 + (0.75-y[j])**2 - 0.05**2 < 1e-3) \

        if( verif ) :
            T[i,j] = 0
            Tab[i,j] = 1
            A.add((T[i,j],(i,j)))

        verif = ((0.25-x[i])**2 + (0.25-y[j])**2 <= 0.05**2) \
                or ((0.75-x[i])**2 + (0.25-y[j])**2 <=0.05**2) \
                or ((0.75-x[i])**2 + (0.75-y[j])**2 <=0.05**2) \
                or ((0.25-x[i])**2 + (0.75-y[j])**2 <=0.05**2)

        if( verif ) :
            Tab[i,j] = 1
            T[i,j] = 0
            Alive.add((T[i,j],(i,j)))

import matplotlib.pyplot as plt

plt.imshow(T, cmap='jet')

plt.xticks([]), plt.yticks([])

plt.show()
