#!/bin/bash
if [[ $# = 0 ]]; then
  echo "no uuid passed - looking for encrypted volumes:"
  diskutil corestorage list
  exit
fi

diskutil corestorage unlockVolume $1 -stdinpassphrase
