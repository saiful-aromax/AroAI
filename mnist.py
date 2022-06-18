import tensorflow as tf
# import matplotlib.pyplot as plt


class myCallback(tf.keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs={}):
        accuracy = logs.get('accuracy')
        if(accuracy > 0.9):
            print("\nReached 90% accuracy so cancelling training!")
            self.model.stop_training = True


callbacks = myCallback()


mnist = tf.keras.datasets.fashion_mnist

(training_images, training_labels),  (test_images, test_labels) = mnist.load_data()

# plt.imshow(test_images[0])


training_images = training_images/255.0
test_images = test_images/255.0

# print('training labels:', training_labels[0])
# print('training images:', training_images[0])

model = tf.keras.models.Sequential([tf.keras.layers.Flatten(), tf.keras.layers.Dense(
    512, activation=tf.nn.relu), tf.keras.layers.Dense(10, activation=tf.nn.softmax)])

model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy', metrics=['accuracy'])
model.fit(training_images, training_labels, epochs=5, callbacks=[callbacks])

model.evaluate(test_images, test_labels)

classifications = model.predict(test_images)

print(classifications[47])
print(test_labels[47])
