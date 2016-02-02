#!/bin/bash
#  Swap two panes based on direction.


function pane_id() {
  pane_id=$(
    tmux list-panes -F "#{pane_active} #{pane_id}" \
      | grep "^1" | cut -d' ' -f2
  )
  if [ -z "${pane_id}" ]; then
    echo "Could not find an active TMUX pane"
    exit 1;
  fi
  echo "${pane_id}"
}


### MAIN ###
DIRECTION=""
case "$1" in
  -D|-L|-R|-U) DIRECTION="$1";;
  *)
    echo "No direction specified!"
    exit 1
esac

start_pane=$(pane_id)
tmux select-pane "${DIRECTION}"
target_pane=$(pane_id)

if [ "${start_pane}" != "${target_pane}" ]; then
  tmux swap-pane -d -s "${start_pane}" -t "${target_pane}"
fi
