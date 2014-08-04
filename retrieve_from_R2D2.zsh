#!/usr/bin/zsh

if [ $# -ne 2 ]; then
  echo "Usage: retrieve_from_R2D2 <file on remote host> <path to local host>"
  exit 1
fi

remote_path=$1
local_path=$2
filename=`basename ${remote_path}`

echo "Retrieving $remote_path from remote host R2D2..."

ssh -t hlong@nightmare.cs.uct.ac.za rcp harry@lnghar001.cs.uct.ac.za:"'${remote_path}'" /home/hlong/tmp/
rcp hlong@nightmare.cs.uct.ac.za:"'/home/hlong/tmp/${filename}'" "${local_path}"


