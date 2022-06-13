import tensorflow as tf
import matplotlib.pyplot as plt

mnist = tf.keras.datasets.fashion_mnist

(training_images, training_labels),  (test_images, test_labels) = mnist.load_data()

plt.imshow(test_images[0])
# plt.imshow(test_images[0])


training_images = training_images/255.0
test_images = test_images/255.0

# print('training labels:', training_labels[0])
# print('training images:', training_images[0])

model = tf.keras.models.Sequential([tf.keras.layers.Flatten(), tf.keras.layers.Dense(
    1024, activation=tf.nn.relu), tf.keras.layers.Dense(10, activation=tf.nn.softmax)])

model.compile(optimizer='adam', loss='sparse_categorical_crossentropy')

model.fit(training_images, training_labels, epochs=5)

model.evaluate(test_images, test_labels)

classifications = model.predict(test_images)

print(classifications[0])
print(test_labels[0])
