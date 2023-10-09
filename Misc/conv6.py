import matplotlib.pyplot as plt
import tensorflow as tf

model = tf.keras.models.load_model('rps.h5')



acc = model.fit.history['accuracy']
val_acc = model.fit.history['val_accuracy']
loss = model.fit.history['loss']
val_loss = model.fit.history['val_loss']

epochs = range(len(acc))

plt.plot(epochs, acc, 'r', label='Training accuracy')
plt.plot(epochs, val_acc, 'b', label='Validation accuracy')
plt.title('Training and validation accuracy')
plt.legend(loc=0)
plt.figure()


plt.show()