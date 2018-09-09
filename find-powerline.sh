#!/bin/bash
#  Finds the root directory where powerline is installed.


# Look for known paths (faster).
EASY_FIND=""
echo -n "Checking known powerline roots ..." >&2
[ -z "${EASY_FIND}" -a -d "${HOME}/.local/lib/python3.6/site-packages/powerline" ] && EASY_FIND="${HOME}/.local/lib/python3.6/site-packages/powerline"
[ -z "${EASY_FIND}" -a -d "/usr/local/lib/python3.6/site-packages/powerline" ] && EASY_FIND="/usr/local/lib/python3.6/site-packages/powerline"
[ -z "${EASY_FIND}" -a -d "/usr/lib/python2.7/site-packages/powerline" ] && EASY_FIND="/usr/lib/python2.7/site-packages/powerline"

if [ -n "${EASY_FIND}" ]; then
  echo "${EASY_FIND}"
  echo " Done!" >&2
  exit 0
else
  echo " No luck!" >&2
fi


# No luck, scan the full system
echo -n "Looking for powerline root ..." >&2

find / -name powerline -type d 2> /dev/null | while read maybe; do
  if [ -d "${maybe}/bindings" ]; then
    echo "${maybe}"
  fi
done | sort --reverse | head -n1

echo " Done!" >&2
