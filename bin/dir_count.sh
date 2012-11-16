#!/bin/bash

if [[ ! -z $1 ]]; then
	DIR=$1
else
	DIR=.
fi

if [[ ! -z $2 ]]; then
	MIN=$2
else
	MIN=0
fi

echo count files within $DIR, displaying dirs with at least $MIN files

find $DIR -maxdepth 1 -type d | while read dir; do 
    count=$(find "$dir" | wc -l)
    if [[ $count -gt $MIN ]]; then
    	echo "$count; $dir"
    fi
done