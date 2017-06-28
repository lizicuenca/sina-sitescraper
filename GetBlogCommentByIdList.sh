#!/bin/bash

# read blogid list to excute data

if [ -z "$1" ]
  then
    echo "No argument supplied. Sleeping time :)"
  else 
  	if [ -f "$1" ]
	then
	  	echo "$(date +'%Y%m%d %H-%M'):On your mark - Pulling data for blogId list from file $1 .... Let's go!"
	else
		echo "$(date +'%Y%m%d %H-%M'):File name: $1 is not found. Can't process further. Sleeping .... "
	fi
fi


while read line ; do
	./testCurl.sh $line
	sleep $[ ( $RANDOM % 20 ) ]s
done < $1

echo "$(date +'%Y%m%d %H-%M'):Done with my task for Pulling data for blogId list from file $1 . Sleeping time ..."
	


