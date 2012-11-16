#!/bin/bash

if [[ ! -z $1 ]]; then
	DIR=$1
else
	DIR=.
fi

if [[ ! -z $2 ]]; then
	KEEP=$2
else
	KEEP=10
fi


echo "largest files in $DIR (MB) (keeping $KEEP)"

du -am $DIR | sort -n -r | head -n $KEEP