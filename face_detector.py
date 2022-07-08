import cv2

trained_face_data = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')


img = cv2.imread('images/multi3.jpg')
grayscaled_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# Detecct faces
face_coordinates = trained_face_data.detectMultiScale(grayscaled_img)
for (x, y, w, h) in face_coordinates:
    
    # [x, y, w, h] = face_coordinates[0]
    cv2.rectangle(img, (x, y), ((x + w), (y+ h)), (0, 255, 0), 2)


cv2.imshow('Clever Programmer Face Detector', img)
cv2.waitKey()