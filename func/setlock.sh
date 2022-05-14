#!/bin/bash

set_lock() {

  local trg screenArea io lo

  trg="$BWP_DIR/walls/$1"

  io="${_o[image-options]:-${BWP_LOCK_IMAGE_OPTIONS:-}}"
  lo="${_o[lock-options]:-${BWP_LOCK_OPTIONS:-}}"

  [[ -f "$io" ]] && io="$(cat "$io")"
  [[ -f "$lo" ]] && lo="$(cat "$lo")"

  mapfile -t screens < <(xrandr | awk '
    
    # get screen area
    match($0,/.*current\s([0-9]+.*[0-9]+),.*/,ma) {
      print gensub(/ /,"","g",ma[1])
    }

    # connected screens
    / connected/ && /mm$/ {
      if ($3 == "primary")
        primary=$4
      else s[$1]=$3
    } 

    END {
      # print the primary screen first
      print primary
      for (m in s) {print s[m]}
    }
  ')

  screenArea="${screens[0]}"
  unset 'screens[0]'

  # if multiple screens are active stretch blurred
  # version of image
  if ((${#screens[@]} > 1)); then
    io="                             \
      ${trg/walls/blurs}             \
      -gravity Center                \
      -resize '${screenArea}^'       \
      -extent '${screenArea}'        \
      \(                             \
        '$trg'                       \
        -gravity Center              \
        -extent '${screens[1]%%+*}'  \
      \)                             \
      -gravity NorthWest             \
      -geometry '+${screens[1]#*+}'  \
      -composite                     \
      $io"
  else
    io="${trg} ${io}"
  fi

  eval i3lock                                     \
    --raw   "$screenArea":rgb                     \
    --image <(eval convert                        \
                     "${io}"                      \
                     -set png:format png32 RGB:-) \
    "${lo}"                                       \

  ln -fs "$trg" "$BWP_DIR/currentlock"
}

