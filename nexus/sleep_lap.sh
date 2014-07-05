#!/bin/bash
# Sleep

delay=100;

if [ $# -ne 0 ]; then
  delay=$1
fi

ssh -i ~/.ssh/id_rsa -n -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no harry@myraspberrypi.no-ip.org "/home/harry/scripts/sleep.sh $delay";

