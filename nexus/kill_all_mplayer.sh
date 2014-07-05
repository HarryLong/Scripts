#!/system/bin/sh
# Stop Music

ssh -i /sdcard/id_rsa -n -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no harry@myraspberrypi.no-ip.org "pkill mplayer";

