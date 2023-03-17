#!/bin/bash
backup() {
re='.*$'
if ! [[ $s1 =~ $re ]] ; then
  return 1
elif ! [[ $2 =~ $re ]] ; then
 return 2
else
  rsync -avz $1 $2
return 0
fi
}

backup $1 $2

case $? in
0) echo "backup was successful" ;;
1) echo "source directory is not set" ;;
2) echo "target file is not set" ;;
*) echo "Unknown error" ;;
esac
