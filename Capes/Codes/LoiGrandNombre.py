import numpy as np
import matplotlib.pyplot as plt

n = int(input("Combien de fois voulez vous lancer \n"))


L = []
for i in range(n):
    L.append(np.random.randint(1,7))


name = ['1','2','3','4','5','6']

A = [L.count(1), L.count(2), L.count(3), L.count(4), L.count(5), L.count(6)]


#Dessin du camembert
plt.pie(A, labels=name, autopct='%1.1f%%', startangle=90, shadow=True)
plt.show()
