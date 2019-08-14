#!/bin/bash

set_lock() {

  local trg="$BWP_DIR/walls/$1"

  [[ -n "${__o[image-options]}" ]] \
    && BWP_LOCK_IMAGE_OPTIONS="${__o[image-options]}"

  [[ -n "${__o[lock-options]}" ]] \
    && BWP_LOCK_OPTIONS="${__o[lock-options]}"

  eval i3lock                         \
    --raw "$(get_geometry)":rgb       \
    --image <(eval                    \
      convert "$trg"                  \
      "${BWP_LOCK_IMAGE_OPTIONS}"     \
      -set png:format png32 RGB:-)    \
    "${BWP_LOCK_OPTIONS}"             \

  ln -fs "$trg" "$BWP_DIR/currentlock"

}

