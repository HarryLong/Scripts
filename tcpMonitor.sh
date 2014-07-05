#!/bin/bash
#Script to monitor traffic

maxSize=40000
dumpFile=/home/harry/tcpDump/monitor.dump
indexFile=/home/harry/tcpDump/index

currentIndex=`cat $indexFile`
newIndex=`expr $currentIndex + 1`

function move_file(){
 echo $newIndex > $indexFile
 mv $dumpFile $dumpFile.$newIndex 
}

if (pgrep tcpdump > /dev/null); then
  dumpFileSize=`du -s $dumpFile | sed 's/[^0-9]*//g'`
  echo $dumpFileSize
  if [ $dumpFileSize -gt $maxSize ]; then
    pgrep tcpdump | xargs sudo kill
    move_file
    sudo tcpdump -i eth1 -w $dumpFile 
  fi   
else
 move_file
 sudo tcpdump -i eth1 -w $dumpFile   
fi 

 


