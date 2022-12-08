import numpy as np
import matplotlib.pyplot as plt

A = np.random.rand(100)
B = np.random.randn(1000)
B_C = np.arange(25)
C = np.arange(100).reshape(4, 25)
C_D = C[1:]
C_D1 = C[:1]
C_D2 = C[:2]
C_D3 = C_D2[0]
D = np.random.permutation(np.arange(30))
E = np.arange(30, 70, 3)
F = np.argwhere(C == 51)
# plt.hist(A, bins=100)
# plt.show()
# plt.hist(B, bins=100)
# plt.show()
# plt.hist(C)
# plt.show()
# This is TEST and this is me also this but things arnt goot
G = C[1:4]

print(C[1:4])

#This is TEST