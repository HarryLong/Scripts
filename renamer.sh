#!/bin/bash
currentDir=`pwd`/
i=1; 
for file in *.csv
do
echo $file
mv "$file" RUN${i}.csv;
i=`expr $i + 1`
done


