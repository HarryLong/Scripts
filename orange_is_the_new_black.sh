#!/bin/bash
# Generic script to help continue watching a series from where you were watching previously
# Customised for: Orange is the new black

FOLDER="/media/passport/Videos/Series/Orange is the new black/Season 1/"
LAST_PLAYED=${FOLDER}/.last_played

if [[ ! -d $FOLDER ]]; then
  echo "Folder doesn't exist: $FOLDER"
  exit 1
fi

cd "$FOLDER"
index=0

if [[ -f $LAST_PLAYED ]]; then
  echo "********************************"
  echo "Last played:"
  cat "$LAST_PLAYED"
  echo "********************************"
else
  touch "$LAST_PLAYED"
fi

for file in *; do
  if [[ -f $file ]]; then
    echo [${index}] : ${file}
    filenames[$index]=$file
    index=`expr ${index} + 1`
  fi
done

echo "Please select a file to play from the list above:"

read input;

full_path=${FOLDER}/${filenames[${input}]}
echo "Playing $full_path..."
echo ${full_path} > "$LAST_PLAYED"

vlc "$full_path"
