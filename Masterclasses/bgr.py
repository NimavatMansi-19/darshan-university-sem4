import cv2
image =cv2.imread("abc.png")
BGR=cv2.cvtColor(image,cv2.COLOR_RGB2BGR)
cv2.imshow('original',image)
cv2.imshow('BGR',BGR)
