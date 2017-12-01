#!/bin/bash

DIR=$1

# 
# Delete files/directories in DIR until the size of DIR < 100GB
while [ `du -s ${DIR} | cut -f1` -gt 100000000 ]; do 
  echo "cleanup_workdir.sh: Workdir size: "`du -sh ${DIR}`
  f=`find ${DIR} -maxdepth 1 -mindepth 1 -type d -mtime +7 -printf '%T+\t%p\n' | sort | cut -f2 | head -1`
  echo "cleanup_workdir.sh: Removing $f"
  rm -rf $f
done
echo "cleanup_workdir.sh: Workdir size: "`du -sh ${DIR}`

