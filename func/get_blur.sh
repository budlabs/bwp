#!/bin/bash

get_blur() {
  local name bdir

  name="$1"
  bdir="$BWP_DIR/blurs"

  if [[ "$_curpth" = "$bdir/$name" ]]; then
    echo "$_wdir/$name"
  else 
    
    [[ -f "$bdir/$name" ]] \
      || generate_blur "$_wdir/$name" "$bdir/$name"

    echo "$bdir/$name"
  fi
}
