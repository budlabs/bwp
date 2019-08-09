#!/bin/bash

set_lock() {

  local trg="$BWP_DIR/walls/$1"

  i3lock \
    --raw "$(get_geometry)":rgb \
    --image <(convert "$trg" RGB:-)

  ln -fs "$trg" "$BWP_DIR/currentlock"

}
