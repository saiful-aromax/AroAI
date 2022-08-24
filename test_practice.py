import numpy as np
import matplotlib.pyplot as plt

A = np.random.rand(100)
B = np.random.randn(1000)
C = np.arange(100).reshape(4, 25)
D = np.random.permutation(np.arange(30))
E = np.arange(30, 70, 3)
F = np.argwhere(C == 51)
# plt.hist(A, bins=100)
# plt.show()
# plt.hist(B, bins=100)
# plt.show()
# plt.hist(C)
# plt.show()

print(C[1:4])
