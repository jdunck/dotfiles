#!/bin/bash
if [[ $# != 1 ]]; then
  echo usage: backup /path/to/backup/dest
  echo "( src is assumed / )"
  exit
fi
root_dir=$1
dest=${root_dir}/${HOSTNAME}

if [[ -e /proc ]] ; then
  excludes="${excludes} --exclude /proc"
fi
excludes="--exclude \"${root_dir}\" --exclude /.Spotlight-V100 --exclude /.com.apple.NetBootX --exclude /Library/Updates --exclude /private/var/vm --exclude /private/var/folders --exclude $HOME/Dropbox --exclude $HOME/votizen/Dropbox --exclude $HOME/work/causes/Dropbox"

date=`date "+%Y-%m-%dT%H-%M-%S"`

num_previous=0
for previous in `ls -1 "${dest}/previous"`; do
  num_previous=$(($num_previous + 1))
  if [[ $num_previous = 10 ]]; then
    echo done
    break
  fi
  link_dests="$link_dests --link-dest=${dest}/previous/${previous}"
done

full_dest="${dest}/previous/back-$date"
options="--archive --delete --one-file-system --partial --progress --extended-attributes --ignore-errors"

echo "backing up to $full_dest, using $link_dests for delta"
echo sudo rsync -vv --itemize-changes $options $excludes $link_dests / "$full_dest"
sudo rsync -vv --itemize-changes $options $excludes $link_dests / "$full_dest"

success=$?
if [[ $success = 0 || $success = 23 ]]; then
  sudo rm -f ${dest}/current
  sudo ln -s ${dest}/previous/back-$date ${dest}/current
else
  echo "Failed :/"
  #sudo mv "$full_dest" "${full_dest}-fail"
fi
##jwz: rsync -vaxAX --delete  --ignore-errors  / /Volumes/Backup/
## http://blog.interlinked.org/tutorials/rsync_time_machine.html
