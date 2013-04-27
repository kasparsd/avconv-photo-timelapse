# Use avconv (ffmpeg) to take photos and assamble timelapse videos

A set of sample bash scripts to take photos with a webcam using avconv (ffempeg) during a specific period every day and assamble them in a daily timelapse that is uploaded to YouTube.

## Setup

This can be run on a headless unix box (linux, freebsd or OS X).

## Requirements

* `avconv` or `ffmpeg` for capturing photos and assambling the timelapse.
* `rsync` for sending photos to a backup server on hourly basis.
* `[youtube-upload](https://code.google.com/p/youtube-upload/)` for uploading daily timelapse to YouTube


## Crontab Examples

Use `crontab -e` to edit the Cronjob file for your user.

	# Take a photo every minute
	*/1 * * * * /home/kaspars/take-photo-cron.sh

	# Take a photo every 5 minutes
	*/5 * * * * /home/kaspars/take-photo-cron.sh

	# Make a short video every day at 11:30
	30 11 * * * /home/kaspars/make-video-cron.sh

	# Rsync files every hour at minute 5
	5 * * * *   /home/kaspars/rsync-cron.sh