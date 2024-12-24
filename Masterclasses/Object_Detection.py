import cv2
import time
import imutils

# Initialize video capture
cam = cv2.VideoCapture(0)
time.sleep(1)
firstFrame = None
area = 500

while True:
    # Read frame from camera
    _, img = cam.read()
    text = "Normal"
    
    # Resize and preprocess frame
    img = imutils.resize(img, width=500)
    grayImg = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gaussianImg = cv2.GaussianBlur(grayImg, (21, 21), 0)

    # Initialize the first frame
    if firstFrame is None:
        firstFrame = gaussianImg
        continue

    # Compute frame difference
    frameDelta = cv2.absdiff(firstFrame, gaussianImg)
    thresh = cv2.threshold(frameDelta, 25, 255, cv2.THRESH_BINARY)[1]
    thresh = cv2.dilate(thresh, None, iterations=2)

    # Find contours
    cnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    cnts = imutils.grab_contours(cnts)

    # Process contours
    for c in cnts:
        if cv2.contourArea(c) < area:
            continue
        (x, y, w, h) = cv2.boundingRect(c)
        cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0), 2)
        text = "Moving Object Detected"

    # Display text and feed
    cv2.putText(img, text, (10, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)
    cv2.imshow("CameraFeed", img)

    # Break on 'q' key press
    key = cv2.waitKey(10)
    if key == ord("q"):
        break

# Release resources
cam.release()
cv2.destroyAllWindows()
