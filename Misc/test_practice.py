import numpy as np
import matplotlib.pyplot as plt

A = np.random.rand(100)
print(A[97:])
print(type(A))
NP = np.array([1, 2, 3, 543, 34])
print(NP[:-3])
print(NP[1:2])
print(NP[2:])
B = np.random.randn(1000)
print(B)
B_C = np.arange(25)
print(B_C)
C = np.arange(100).reshape(4, 25)
print(C)
C_D = C[1:]
C_D1 = C[:1]
C_D2 = C[:2]
C_D3 = C_D2[0]
print(C_D, C_D1, C_D2, C_D3)
D = np.random.permutation(np.arange(30))
print(D)
E = np.arange(30, 70, 3)
print(E)
F = np.argwhere(C == 51)
print(F)
# plt.hist(A, bins=100)
# plt.show()
# plt.hist(B, bins=100)
# plt.show()
# plt.hist(C)
# plt.show()
# This is TEST and this is me also this but things arnt goot
G = C[1:4]
print(G)

li = [1, 2, 3, 4, 5]

print(li[:4].pop())
print(li[:4])

# This is AROMAX 55 and final TEST and further commit
