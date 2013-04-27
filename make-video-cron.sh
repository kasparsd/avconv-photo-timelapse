#!/bin/sh

# Make sure we run this after the scheduled photos are taken 
sleep 15

filename=$(date +%Y%m%d-%H%M%S).mp4

# Record a 15 second (-t 15) video from /dev/video0
# using hw:1 input with one channel (-ac 1) for audio
# and save it as mp4
avconv -f alsa -ac 1 -i hw:1 -f video4linux2 -q 1 -s 960x720 -r 30 -i /dev/video0 -q 1 -t 15 -strict experimental /home/kaspars/video/$filename
