import sys
sys.path.append('../Protocol/MainFold/Python')
import protocol
import DigitRecognization
import cv2

datainterface=protocol.Protocol('192.168.1.107',6000)

raw_image = cv2.imread("/Users/wzq/Downloads/testcase1/363_92785372614985.jpg")
res= DigitRecognization.recognize(raw_image)
print res
datainterface.SendPadPass(res,str(12345))
