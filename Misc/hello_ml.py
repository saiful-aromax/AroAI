import tensorflow as tf
import numpy as np

model = tf.keras.Sequential([tf.keras.layers.Dense(units=1, input_shape=[1])])
model.compile(optimizer='sgd', loss='mean_squared_error')

xs = np.array([-1.0, 0.0, 1.0, 2.0, 3.0, 4.0], float)
ys = np.array([-2.0, 1.0, 4.0, 7.0, 10.0, 13.0], float)

model.fit(xs, ys, epochs=500)
print(model.predict([10.0]))