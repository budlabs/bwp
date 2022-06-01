#!/bin/bash

set_wall(){
  local name trg

  name="$1"
  trg="${_wdir}/$name"

  if [[ -z $name ]] || [[ ! -f $trg ]]; then
    ERX "no such wallpaper"
  else
    command -v "${BWP_COMMAND%% *}" > /dev/null \
      || ERX "BWP_COMMAND '$BWP_COMMAND' not found"
      
    ((_o[blur] == 1)) && trg="$(get_blur "$name")"

    ${BWP_COMMAND} "$trg"

    ln -fsn "$trg" "$BWP_DIR/currentwall"

    ((_o[prev]+_o[next] > 0)) || add_to_history "$name"
  fi
}
