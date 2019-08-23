#!/bin/bash

set_lock() {

  local trg screenArea

  trg="$BWP_DIR/walls/$1"

  if [[ -f "${__o[image-options]}" ]]; then
    BWP_LOCK_IMAGE_OPTIONS="$(cat "${__o[image-options]}")"
  elif [[ -n "${__o[image-options]}" ]]; then
    BWP_LOCK_IMAGE_OPTIONS="${__o[image-options]}"
  fi

  if [[ -f "${__o[lock-options]}" ]]; then
    BWP_LOCK_OPTIONS="$(cat "${__o[lock-options]}")"
  elif [[ -n "${__o[lock-options]}" ]]; then
    BWP_LOCK_OPTIONS="${__o[lock-options]}"
  fi

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
    BWP_LOCK_IMAGE_OPTIONS="         \
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
      ${BWP_LOCK_IMAGE_OPTIONS}"
  else
    BWP_LOCK_IMAGE_OPTIONS="${trg} ${BWP_LOCK_IMAGE_OPTIONS}"
  fi

  eval i3lock                                     \
    --raw   "$screenArea":rgb                     \
    --image <(eval convert                        \
                     "${BWP_LOCK_IMAGE_OPTIONS}"  \
                     -set png:format png32 RGB:-) \
    "${BWP_LOCK_OPTIONS}"                         \

  ln -fs "$trg" "$BWP_DIR/currentlock"
}

