import cv2

trained_face_data = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')


img = cv2.imread('images/RDJ.jpg')
grayscaled_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# Detecct faces
face_coordinates = trained_face_data.detectMultiScale(grayscaled_img)

cv2.imshow('Clever Programmer Face Detector', grayscaled_img)
cv2.waitKey()