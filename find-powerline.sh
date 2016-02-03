#!/bin/bash
#  Finds the root directory where powerline is installed.


echo "Looking for powerline root ..." >&2

find / -name powerline -type d 2> /dev/null | while read maybe; do
  if [ -d "${maybe}/bindings" ]; then
    echo "${maybe}"
  fi
done | head -n1
