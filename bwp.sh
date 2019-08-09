#!/usr/bin/env bash

: "${BWP_DIR:=$HOME/tmp/bwp}"
: "${BWP_GEOMETRY:=}"
: "${BWP_COMMAND:=feh --no-fehbg --bg-fill}"

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
  ((_o[a] == 1)) && {
    add_to_library "$*" > /dev/null
    exit
  }

  { [[ -n ${_o[x]} ]] || ((_o[d] == 1)) ;} \
    && ((_o[r]+_o[n]+_o[p] > 0)) \
    && ERH "-r -n -p is not allowed when deleting or renaming."

  _curpth="$(readlink "$BWP_DIR/currentwall")"
  _curnam="${_curpth##*/}"
  
  _wall="$(get_wall "$@")"

  if   ((_o[d] == 1)); then
    delete_wall "$_wall"
  elif [[ -n ${_o[x]} ]]; then
    rename_wall "${_o[x]}" "$_wall"
  elif ((_o[l] ==1)); then
    set_lock "$_wall"
  elif ((_o[w] == 1)) || ((_o[b] == 1)); then
    set_wall "$_wall"
  fi


}


__source="$(readlink -f "${BASH_SOURCE[0]}")"
__srcdir="${__source%/*}"
for f in "$__srcdir/lib/"* ; do . "$f" ; done


_help_msg="$(cat << 'EOB'
bwp - budlabs wallpaper manager

Usage
-----
bwp --wallpaper|-w [--prev|-p|--next|-n|--random|-r|WALLPAPER] set desktop wallpaper
bwp --blur|-b [--prev|-p|--next|-n|--random|-r|WALLPAPER]      toggle/set blur
bwp --lock|-l [--prev|-p|--next|-n|--random|-r|WALLPAPER]      lock screen
bwp --delete|-d [--force|-f] [WALLPAPER]                       delete wallpaper from library
bwp --add|-a [--force|-f] FILE|DIR                             add a new image to the library
bwp --rename|-x NEWNAME [WALLPAPER]                            rename WALLPAPER to NEWNAME
bwp --help|-h                                                  print this help
bwp --version|-v                                               print version info
EOB
)"

declare -A _o


# Execute getopt
ARGS=$(getopt --options "wblafx:rhvpnd" --longoptions "wallpaper,blur,lock,add,force,rename:,random,help,version,prev,next,delete" -- "$@");
 
#Bad arguments
if [ $? -ne 0 ]; then
  ERH no options, no action, no woman, no cry
fi
 
eval set -- "$ARGS"


while true; do
  case "$1" in
    -w|--wallpaper)
      echo walloption
      _o[w]=1
      shift
    ;;
    -b|--blur)
      _o[b]=1
      shift
    ;;
    -l|--lock)
      _o[l]=1
      shift
    ;;
    -a|--add)
      _o[a]=1
      shift
    ;;
    -f|--force)
      _o[f]=1
      shift
    ;;
    -x|--rename)
      shift
      _o[x]="$1"
      shift
    ;;
    -r|--random)
      echo random opt
      _o[r]=1
      shift
    ;;
    -h|--help)
      _o[h]=1
      shift
    ;;
    -v|--version)
      _o[v]=1
      shift
    ;;
    -p|--prev)
      _o[p]=1
      shift
    ;;
    -n|--next)
      _o[n]=1
      shift
    ;;
    -d|--delete)
      _o[d]=1
      shift
    ;;
    --)
      shift
      break
    ;;

  esac
done

unset f o co

main "${@}"
