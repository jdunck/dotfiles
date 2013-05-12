#!/usr/bin/env python3
import os.path, shutil, subprocess, socket
import json

def backup(dest):
  location = os.path.abspath(__file__)
  conf_location = os.path.normpath(os.path.join(location, "../../conf/backupKeys.json"))
  with open(conf_location, 'r') as f:
    conf = json.loads(f.read())
  local_conf = conf[socket.gethostname()]
  ownertrust = subprocess.check_output(["gpg", "--export-ownertrust"] )
  with open(os.path.join(dest, 'gpg-ownertrust'), 'w') as f:
    f.write(ownertrust)
  for key in local_conf['keys']:
    shutil.copy(key, dest)

if __name__ == '__main__':
  import sys
  if len(sys.argv) == 1:
    print("destination path is required")
    sys.exit(1)
  dest = os.path.abspath(sys.argv[1])
  if not os.path.exists(dest):
    os.makedirs(dest)
  backup(dest)
