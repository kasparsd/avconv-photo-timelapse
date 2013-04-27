#!/bin/sh

# Create a filename for yesterday's timelapse video
filename=$(date -d 'yesterday' +%Y%m%d)

# Set your YouTube credentials
username="username@gmail.com"
password="yourpassword"

# Upload the video, make it unlisted.
# Store video URL in $yurl
yurl=$(youtube-upload --email=$username --password=$password \
        --title="Timelapse: $timestamp" \
        --category="Autos" \
        --keywords="racing, timelapse, build" \
        --description="Building eO. Visit http://driveeo.com" \
        --unlisted \
        /home/kaspars/timelapse/$filename.mp4)

# Add the uploaded video to an existing playlist
youtube-upload --email=$username --password=$password \
        --add-to-playlist=http://gdata.youtube.com/feeds/api/playlists/PLf3Vpg-v5gTupbSvAaaPmk33XA6ji9XnG \
        $yurl
