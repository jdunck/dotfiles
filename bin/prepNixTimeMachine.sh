#!/bin/bash
if [[ $# != 1 ]]; then
  echo usage: backup /path/to/backup/dest
  echo "( src is assumed / )"
  exit
fi
dest=$1
mkdir -p ${dest}/${HOSTNAME}/previous/
