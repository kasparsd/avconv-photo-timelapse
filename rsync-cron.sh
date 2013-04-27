#!/bin/sh

# Sync to a remote server via SSH, using key based authentication (no passwords)

rsync -atvz /home/kaspars/foto/ username@example.com:/home/kaspars/backup/foto/
rsync -atvz /home/kaspars/video/ username@example.com:/home/kaspars/backup/video/