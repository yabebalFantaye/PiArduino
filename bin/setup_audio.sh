#Raspberry Pi – Setting Up Your Audio
sudo apt-get install alsa-utils
sudo apt-get install mpg321
sudo apt-get install lame
sudo apt-get install alsa-utils

#Load the driver:
#sudo modprobe snd_bcm2835

#make sure to find the right driver
#sudo lsmod | grep 2835

#wanting to get analog audio working use a “1” if you are using HDMI use a “2”. The rule is “0” = auto.
#to route the built-in audio. Replace “N” with one of the following choices:
#amixer cset numid=3 N
#Replace “N” with one of the following choices
#0: auto   1:analog   2:HDMI
sudo amixer cset numid=3 1

#test it
speaker-test -t sine -f 440 -c 2

#record test the following command creates “test.wav” as a 5-second,
#CD-quality wave file. Since it’s a mono mic, specify the number of
#channels as “1” by -c option. You can find the details of the options
#-D option specifies recording device. Since the mic is on “card 1”,
#“device 0” (see step 1-4), the value is “hw:1,0”
arecord -D hw:1,0 -d 5 -f cd test.wav -c 1

#play recorded
aplay test.wav

#if you mess up something reset using
sudo /etc/init.d/alsa-utils reset

#pyaudio jack start
jack_control start

#Refs
#http://iwearshorts.com/blog/raspberry-pi-setting-up-your-audio/
#http://sandsoftwaresound.net/get-started-alsa-jack/

