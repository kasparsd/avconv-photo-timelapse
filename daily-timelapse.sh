#!/bin/sh

# This script accepts an argument of which day to make the timelapse for
when=$1

# Default to yesterday
if [ -z "$1" ] ; then
	when="yesterday"
fi

# Create a filename based on which date this is for
filename=$(date -d $when +%Y%m%d)

# Overlay date on the video
timestamp=$(date -d $when +%Y/%m/%d)

# Find photos that were taken after 4am on that day and before 4am the next day
# and pipe them (-i -) to avconv. Create a timelapse at 30 fps, overlay
# the current date and store it.
cat $(find ./foto/* -newermt "$when 4am" -not -newerct "$when 4am + 1 day") | \
	avconv -strict experimental -f image2pipe -vcodec mjpeg \
	-i - -q 1 -r 30 \
	-vf "drawtext=fontfile='/usr/share/fonts/truetype/ttf-dejavu/DejaVuSansMono-Bold.ttf':text='eO $timestamp':x=20:y=20:fontsize=14:fontcolor=white:shadowcolor=black:shadowx=1:shadowy=1" \
	/home/kaspars/timelapse/$filename.mp4