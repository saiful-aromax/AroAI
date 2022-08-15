import numpy as np
import matplotlib.pyplot as plt

A = np.random.rand(10,2)
B = np.arange(100)
plt.hist(A, bins=100)
plt.show()
print(A)
