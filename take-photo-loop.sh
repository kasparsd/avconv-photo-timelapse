#!/bin/sh

# Note: use together with monitor-photo-loop.sh

# Photos will be stored in /home/kaspars/foto/ so make sure
# the folder exists before running this.

while true
do
	# Get the current hour
	hour=$(date +"%-k")

	# Run only between 6:00 and 2:00 (skip the dark hours)
	if [ $hour -ge 6 -o $hour -le 2 ];
	then
		# Create a filename based on current timestamp
		filename=$(date +%Y%m%d-%H%M%S).jpeg
		
		# Capture one frame from /dev/video0
		avconv -f video4linux2 -s 1280x960 -itsoffset 1 -q 1 -i /dev/video0 -q 1 -qscale 1 -f image2 /home/kaspars/foto/$filename
	fi

	# wait 5 seconds before the next capture
	sleep 5
done