#!/bin/bash

get_wall() {
  if ((_o[random] == 1)); then
    get_random_wall
  elif ((_o[prev] == 1)); then
    get_previous_wall
  elif ((_o[next] == 1)); then
    get_next_wall
  elif [[ -z $1 ]]; then
    
    if ((_o[lock]+_o[wallpaper] == 2)) && [[ -f "$BWP_DIR/currentwall" ]]; then
      echo "$_curnam"
    elif ((_o[lock] == 1)) && [[ -f "$BWP_DIR/currentlock" ]]; then
      basename "$(readlink "$BWP_DIR/currentlock")"
    elif ((_o[lock] != 1)) && [[ -f "$BWP_DIR/currentwall" ]]; then
      echo "$_curnam"
    else
      get_random_wall
    fi
  elif [[ -f "$*" ]]; then
    add_to_library "$*"
  elif [[ -f "$_wdir/$*" ]]; then
    echo "$*"
  else
    ERX "Not a valid argument '$*'"
  fi
}
