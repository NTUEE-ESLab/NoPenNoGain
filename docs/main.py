import numpy as np
import time
import cv2
from picamera import PiCamera
from picamera.array import PiRGBArray

m = 0.00000001
M = 100000000

class TrackCam:
    def __init__(self):
        self.camera = PiCamera()
        self.camera.resolution = (1216, 960)
        self.scene = self.setScene()
        self.vertex = self.setVertex()
        self.x_start, self.y_start, self.width, self.height = self.setBound()
        self.a = self.b = self.c = self.d = 0
        self.para1 = self.para2 = False
        self.I1, self.I2 = self.setIdealPoint()

    def getIm(self):
        output = np.empty((960*1216*3), dtype = np.uint8)
        self.camera.capture(output, 'bgr')
        output = output.reshape((960, 1216, 3))
        output = output[:960, :1200, ]

        return output

    def getPoint(self, im):
        # Get the masked image
        im_hsv = cv2.cvtColor(im, cv2.COLOR_BGR2HSV)
        # lower mask
        lowRed = np.array([0,50,50])
        uppRed = np.array([10,255,255])
        im_mask0 = cv2.inRange(im_hsv, lowRed, uppRed)
        # upper mask
        lowRed = np.array([170,50,50])
        uppRed = np.array([180,255,255])
        im_mask1 = cv2.inRange(im_hsv, lowRed, uppRed)
        # join the masks
        im_mask = im_mask0 + im_mask1
        # Get the non-zero part
        location = cv2.findNonZero(im_mask)
        if(location is None):
            return[-1, -1]
        pixelNum = len(location)
        x_ave = y_ave = 0
        for i in range(pixelNum):
            x_ave += location[i][0][0]
            y_ave += location[i][0][1]
        
        return [x_ave // pixelNum, y_ave // pixelNum]

    def setScene(self):
        im = self.getIm()
        cv2.imwrite('./sceneIm.jpg', im)
        if(self.getPoint(im) == [-1, -1]):
            print('Dirty scene!')
            return None
        
        return im

    def setVertex(self):
        ver = []
        for i in range(4):
            again = True
            while(again):
                print('Getting vertex ', i)
                #time.sleep(5)
                im = self.getIm()
                x, y = self.getPoint(im)
                if(not x == -1):
                    ver.append([x, y])
                    print('Get vertex ', i, 'as (', x, ', ', y, ')')
                    again = False
        
        return ver

    def drawEdge(self):
        edgeIm = self.scene
        for i in range(4):
            cv2.line(edgeIm, (self.vertex[i%4][0], self.vertex[i%4][1]), (self.vertex[(i+1)%4][0], self.vertex[(i+1)%4][1]), (0, 255, 0), 2)
        cv2.imwrite('./edgeIm.jpg', edgeIm)

        return None

    def setBound(self):
        x_start = min(self.vertex[0][0], self.vertex[3][0])
        y_start = min(self.vertex[0][1], self.vertex[1][1])
        width  = max(self.vertex[1][0], self.vertex[2][0]) - x_start
        height = max(self.vertex[3][1], self.vertex[2][1]) - y_start

        for i in range(4):
            self.vertex[i][0] -= x_start
            self.vertex[i][1] -= y_start

        return [x_start, y_start, width, height]

    def setIdealPoint(self):
        I1 = I2 = [0, 0]
        print('Are vertical bounds parallel: ')
        if((self.vertex[3][0]-self.vertex[0][0])*(self.vertex[2][1]-self.vertex[1][1]) == (self.vertex[2][0]-self.vertex[1][0])*(self.vertex[3][1]-self.vertex[0][1])):
            self.para1 = True
            print('Yes')
        else:
            print('No')
        print('Are horizontal bounds parallel: ')
        if((self.vertex[1][0]-self.vertex[0][0])*(self.vertex[2][1]-self.vertex[3][1]) == (self.vertex[2][0]-self.vertex[3][0])*(self.vertex[1][1]-self.vertex[0][1])):
            self.para1 = True
            print('Yes')
        else:
            print('No')
        if(self.para1 == False):
            self.a = (self.vertex[1][1]-self.vertex[0][1]) / np.clip((self.vertex[1][0]-self.vertex[0][0]), m, M) 
            self.b = - self.a * self.vertex[0][0] + self.vertex[0][1]
            e = (self.vertex[2][1]-self.vertex[3][1]) / np.clip((self.vertex[2][0]-self.vertex[3][0]), m, M)
            f = - e * self.vertex[3][0] + self.vertex[3][1]

            I1[0] = - (self.b - f) / (self.a - e)
            I1[1] = I1[0] * self.a + self.b

            print('Ideal point 1 at (', I1[0], ', ', I1[1], ')')
        else:
            print('No ideal point 1')
        if(self.para2 == False):
            self.c = (self.vertex[3][1]-self.vertex[0][1]) / np.clip((self.vertex[3][0]-self.vertex[0][0]), m, M)
            self.d = - self.c * self.vertex[3][0] + self.vertex[3][1]
            g = (self.vertex[2][1]-self.vertex[1][1]) / np.clip((self.vertex[2][0]-self.vertex[1][0]), m, M)
            h = - g * self.vertex[2][0] + self.vertex[2][1]

            I2[0] = - (self.d - h) / (self.c - g)
            I2[1] = I2[0] * self.c + self.d

            print('Ideal point 1 at (', I2[0], ', ', I2[1], ')')
        else:
            print('No ideal point 1')

        return I1, I2

    def transformation(self, x_T, y_T):
        x_E = x_F = 0
        if(self.para1 == True):
            r = - self.c * x_T + y_T
            x_E = - (self.b - r) / (self.a - self.c)
        else:
            g = (self.I2[1] - y_T) / (self.I2[0] - x_T)
            h = - g * x_T + y_T
            x_E = - (self.b - h) / (self.a - g)
        if(self.para2 == True):
            r = - self.a * x_T + y_T
            x_F = - (self.d - r) / (self.c - self.a)
        else:
            e = (self.I1[1] - y_T) / (self.I1[0] - x_T)
            f = - e * x_T + y_T
            x_F = - (self.d - f) / (self.c - e)

        k = ((self.I1[0]-self.vertex[0][0]) * (self.vertex[1][0]-x_E)) / np.clip(((self.vertex[1][0]-self.vertex[0][0]) * (self.I1[0] - x_E)), m, M)
        l = ((self.I2[0]-self.vertex[0][0]) * (self.vertex[3][0]-x_F)) / np.clip(((self.vertex[3][0]-self.vertex[0][0]) * (self.I2[0] - x_F)), m, M)

        x_trans = int(round((1 - k) * self.width))
        y_trans = int(round((1 - l) * self.height))

        return [x_trans, y_trans]

    def track(self):
        while(True):
            im = self.getIm()
            im = im[self.x_start : (self.x_start + self.width), self.y_start : (self.y_start + self.height)]
            x_ave, y_ave = self.getPoint(im)
            x_trans, y_trans = self.transformation(x_ave, y_ave)

            if(x_ave == -1):
                print('(---, ---) | (---, ---)')
            else:
                print('(', x_ave, ', ', y_ave, ') | (', x_trans, ', ', y_trans, ')')



def main():
   trackCam = TrackCam()
   trackCam.track()


if(__name__ == '__main__'):
   main()