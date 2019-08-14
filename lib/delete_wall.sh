#!/bin/bash

delete_wall() {
  local trg

  trg="$1"

  ((__o[delete] == 1)) && ((__o[force] != 1)) && {
    YNP -n "delete $trg?" || ERX "deletion aborted"
  }
  
  rm "$BWP_DIR"/*/"$trg"
  sed -i "/^${trg}$/d" "$_history"

  [[ $trg = "$_curnam" ]] && {
    set_wall "$(get_previous_wall)"
  }
}
