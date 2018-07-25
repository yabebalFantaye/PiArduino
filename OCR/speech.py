# -*- coding: utf-8 -*-

from subprocess import PIPE, call
import urllib

import cv2
from PIL import Image
from pytesser import *
from time import sleep


class Speech(object):
  
    # converts text to speech
    def text_to_speech(self, text):
        try:
            # truncate text as google only allows 100 chars
            text = text[:100]
  
            # encode the text
            query = urllib.quote_plus(text)
  
            # build endpoint
            endpoint = "http://translate.google.com/translate_tts?tl=en&q=" + query
  
            # debug
            print(endpoint)
  
            # get google to translate and mplayer to play
            call(["mplayer", endpoint], shell=False, stdout=PIPE, stderr=PIPE)
        except:
            print ("Error translating text")


#----------------------------
#   start main code
#----------------------------
speech = Speech()
 
#IMAGE_FILE = 'mister_fruits.jpg'
IMAGE_FILE = 'mister_puce.jpg'

# loop forever
lang='eng'

while True:

    try:
        # save image from webcam
        img = cv2.VideoCapture(0).read()[1]
        cv2.imwrite(IMAGE_FILE, img)
        
        # load image
        # img = Image.open(IMAGE_FILE)
 
        # detect words in image
        
        words = image_file_to_string(IMAGE_FILE).strip()
        print('detected word', words)
 
        # annouce the arrival of Mr Puce! 
        #if(words == 'Mr Puce'):
        speech.text_to_speech("Watch out, here comes %s"%words)
    except:
        raise
    
    sleep(5)

