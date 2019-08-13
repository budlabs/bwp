#!/usr/bin/env bash

main() {

  _wdir="$BWP_DIR/walls"
  _history="$BWP_DIR/history"

  [[ -d $_wdir ]] || {
    mkdir -p "$_wdir"
    mkdir -p "$BWP_DIR/blurs"
    mkdir -p "$BWP_DIR/locks"
    ERM "BWP_DIR didn't exist, created: $_wdir"
  }

  # bwp -a [-f] FILE|DIR  add to the library
  ((__o[add] == 1)) && {
    add_to_library "$*" > /dev/null
    exit
  }

  { [[ -n ${__o[rename]} ]] || ((__o[delete] == 1)) ;} \
    && ((__o[random]+__o[next]+__o[prev] > 0)) \
    && ERH "-r -n -p is not allowed when deleting or renaming."

  _curpth="$(readlink "$BWP_DIR/currentwall")"
  _curnam="${_curpth##*/}"
  
  _wall="$(get_wall "$@")"

  if   ((__o[delete] == 1)); then
    delete_wall "$_wall"
  elif [[ -n ${__o[rename]} ]]; then
    rename_wall "${__o[rename]}" "$_wall"
  elif ((__o[lock] ==1)); then
    set_lock "$_wall"
  elif ((__o[wallpaper] == 1)) || ((__o[blur] == 1)); then
    set_wall "$_wall"
  fi


}
___source="$(readlink -f "${BASH_SOURCE[0]}")"  #bashbud
___dir="${___source%/*}"                        #bashbud
source "$___dir/init.sh"                        #bashbud
main "${@}"                                     #bashbud