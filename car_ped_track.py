import cv2

img = cv2.imread('images/cars1.jpg')
grayscaled_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
tranied_car_data = cv2.CascadeClassifier('cars.xml')
car_coordinates = tranied_car_data.detectMultiScale(grayscaled_img)
for (x, y, w, h) in car_coordinates:
    
    cv2.rectangle(img, (x, y), ((x + w), (y+ h)), (0, 255, 0), 2)
cv2.imshow("Show Image", img)
cv2.waitKey()