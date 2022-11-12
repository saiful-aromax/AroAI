import tensorflow as tf
import matplotlib.pyplot as plt

(training_images, training_labels), (test_images, test_labels) = tf.keras.datasets.fashion_mnist.load_data()

training_images  = training_images / 255.0
test_images = test_images / 255.0

print(training_labels[0])
print(training_images[0])
plt.imshow(training_images[0])
# plt.axis('Off')
plt.show()
sigma = "Aromax"