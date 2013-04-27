#!/bin/sh

# Check if take-photo-loop is NOT running
if ! pgrep take-photo-loop.sh ;
then
	# Call the photo taking script and send it to background
	nohup /home/kaspars/take-photo-loop.sh &
	exit
fi