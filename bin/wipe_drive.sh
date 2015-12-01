#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "Specify the drive device"
  exit
fi

MOUNT_POINT=`mount | grep $1 | awk '{print $3}'`
DISK_SIZE=`df -m $MOUNT_POINT | tail -n 1 | awk '{print $2}'`
echo $MOUNT_POINT
echo $DISK_SIZE

echo 'Are you sure? (type yes)'
read CONFIRM
if [[ $CONFIRM != "yes" ]]; then
	echo bye
	exit
fi

openssl enc -aes-256-ctr -pass pass:"$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)" -nosalt </dev/zero | pv -bartpes "${DISK_SIZE}m" | dd bs=64K of=$1
