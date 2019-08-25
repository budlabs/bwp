#!/usr/bin/env bash

___printversion(){
  
cat << 'EOB' >&2
bwp - version: 2019.08.25.1
updated: 2019-08-25 by budRich
EOB
}


# environment variables
: "${BWP_DIR:=$HOME/.cache/wallpapers}"
: "${BWP_GEOMETRY:=}"
: "${BWP_COMMAND:=feh --no-fehbg --bg-fill}"
: "${BWP_LOCK_OPTIONS:=}"
: "${BWP_LOCK_IMAGE_OPTIONS:=}"


___printhelp(){
  
cat << 'EOB' >&2
bwp - budlabs wallpaper selector


SYNOPSIS
--------
bwp [--prev|-p|--next|-n|--random|-r|WALLPAPER]
bwp --blur|-b [--prev|-p|--next|-n|--random|-r|WALLPAPER|DIR]     
bwp --lock|-l [--lock-options|-L OPTIONS] [--image-options|-I OPTIONS] [--wallpaper|-w|--random|-r|WALLPAPER]     
bwp --delete|-d [--force|-f] [WALLPAPER]                      
bwp --add|-a    [--force|-f] FILE|DIR                           
bwp --rename|-x NEWNAME [WALLPAPER]                           
bwp --help|-h                                                 
bwp --version|-v                                              

OPTIONS
-------

--prev|-p  
takes the previous wallpaper according to
BWP_DIR/history


--next|-n  
takes the next wallpaper according to
BWP_DIR/history


--random|-r  
get a random wallpaper from BWP_DIR/walls


--blur|-b  
toggle/set blur. If no WALLPAPER is specified the
blur state of the current wallpaper will get
toggled.


--lock|-l  
locks the computer with i3lock(1). If no
WALLPAPER is specified, the last image that was
last used as lockscreen background will be used.


--lock-options|-L OPTIONS  
Additional command line options passed to i3lock.
If OPTIONS is the path to a file, the content of
that file will be used. This options overrides the
environment variable: BWP_LOCK_OPTIONS


--image-options|-I OPTIONS  
Additional command line options passed to convert
before locking the screen. If OPTIONS is the path
to a file, the content of that file will be used.
This options overrides the environment variable:
BWP_LOCK_IMAGE_OPTIONS


--wallpaper|-w  
when set in conjunction with --lock, the current
wallpaper will be used as lockscreen background.


--delete|-d  
delete WALLPAPER from library and history. Use
--force option to skip prompt.


--force|-f  
if set --delete option will not prompt and when
adding files to the library (--add) existing files
with the same name will get overwritten.


--add|-a  
if a argument is a FILE it will get added to the
library. If argument is a DIRECTORY all images in
that directory will get added to the library. Use
--force option to overwrite existing files.


--rename|-x NEWNAME  
rename WALLPAPER to NEWNAME


--help|-h  
Show help and exit.


--version|-v  
Show version and exit.
EOB
}


for ___f in "${___dir}/lib"/*; do
  source "$___f"
done

declare -A __o
eval set -- "$(getopt --name "bwp" \
  --options "pnrblL:I:wdfax:hv" \
  --longoptions "prev,next,random,blur,lock,lock-options:,image-options:,wallpaper,delete,force,add,rename:,help,version," \
  -- "$@"
)"

while true; do
  case "$1" in
    --prev       | -p ) __o[prev]=1 ;; 
    --next       | -n ) __o[next]=1 ;; 
    --random     | -r ) __o[random]=1 ;; 
    --blur       | -b ) __o[blur]=1 ;; 
    --lock       | -l ) __o[lock]=1 ;; 
    --lock-options | -L ) __o[lock-options]="${2:-}" ; shift ;;
    --image-options | -I ) __o[image-options]="${2:-}" ; shift ;;
    --wallpaper  | -w ) __o[wallpaper]=1 ;; 
    --delete     | -d ) __o[delete]=1 ;; 
    --force      | -f ) __o[force]=1 ;; 
    --add        | -a ) __o[add]=1 ;; 
    --rename     | -x ) __o[rename]="${2:-}" ; shift ;;
    --help       | -h ) ___printhelp && exit ;;
    --version    | -v ) ___printversion && exit ;;
    -- ) shift ; break ;;
    *  ) break ;;
  esac
  shift
done

[[ ${__lastarg:="${!#:-}"} =~ ^--$|${0}$ ]] \
  && __lastarg="" 




