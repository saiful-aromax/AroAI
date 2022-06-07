import cv2

trained_face_data = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

img = cv2.imread('images/RDJ.jpg')
cv2.imshow('Clever Programmer Face Detector', img)
cv2.waitKey()

print("This is Aromax")
