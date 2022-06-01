#!/bin/bash

add_to_history() {
  local name

  name="$1"

  if [[ -f $_history ]]; then
  
    awk -v name="$name" '
      BEGIN {a[name]=1 ; print name}
      !a[$0]++
    ' "${_history:-}" > /tmp/bwphist

    cat /tmp/bwphist > "$_history"
  else
    echo "$name" > "$_history"
  fi
}
