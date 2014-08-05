#!/bin/bash

DEVICE=$1
if [[ -z $DEVICE ]]; then
  echo "target disk (i.e. /dev/diskN) required"
  exit 1
fi

IMG_FILE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`.img

hdiutil convert -format UDRW -o $HOME/$IMG_FILE

diskutil unmountDisk $DEVICE

sudo dd if=${IMG_FILE} of=${DEVICE} bs=1m

diskutil eject $DEVICE

echo "to boot to USB, use alt (option) when powering on."