#!/usr/bin/env bash

___printversion(){
  
cat << 'EOB' >&2
bwp - version: 2019.08.13.7
updated: 2019-08-13 by budRich
EOB
}


# environment variables
: "${BWP_DIR:=$HOME/tmp/bwp}"
: "${BWP_GEOMETRY:=}"
: "${BWP_COMMAND:=feh --no-fehbg --bg-fill}"


___printhelp(){
  
cat << 'EOB' >&2
bwp - SHORT DESCRIPTION


SYNOPSIS
--------
bwp --wallpaper|-w [--prev|-p|--next|-n|--random|-r|WALLPAPER]
bwp --blur|-b [--prev|-p|--next|-n|--random|-r|WALLPAPER]     
bwp --lock|-l [--prev|-p|--next|-n|--random|-r|WALLPAPER]     
bwp --delete|-d [--force|-f] [WALLPAPER]                      
bwp --add|-a [--force|-f] FILE|DIR                           
bwp --rename|-x NEWNAME [WALLPAPER]                           
bwp --help|-h                                                 
bwp --version|-v                                              

OPTIONS
-------

--wallpaper|-w  
set desktop wallpaper


--prev|-p  
takes the previous wallpaper according to
BWP_DIR/history


--next|-n  
takes the next wallpaper according to
BWP_DIR/history


--random|-r  
get a random wallpaper from BWP_DIR/walls


--blur|-b  
toggle/set blur


--lock|-l  
lock screen


--delete|-d  
delete wallpaper from library


--force|-f  
if set --delete option will not prompt and when
adding files to the library (--add) existing files
with the same name will get overwritten.





--add|-a  
add a new image to the library


--rename|-x NEWNAME  
rename WALLPAPER to NEWNAME


--help|-h  
Show help and exit. whatever newline. this is
also a new line.



--version|-v  
Show version and exit.
EOB
}


for ___f in "${___dir}/lib"/*; do
  source "$___f"
done

declare -A __o
eval set -- "$(getopt --name "bwp" \
  --options "wpnrbldfax:hv" \
  --longoptions "wallpaper,prev,next,random,blur,lock,delete,force,add,rename:,help,version," \
  -- "$@"
)"

while true; do
  case "$1" in
    --wallpaper  | -w ) __o[wallpaper]=1 ;; 
    --prev       | -p ) __o[prev]=1 ;; 
    --next       | -n ) __o[next]=1 ;; 
    --random     | -r ) __o[random]=1 ;; 
    --blur       | -b ) __o[blur]=1 ;; 
    --lock       | -l ) __o[lock]=1 ;; 
    --delete     | -d ) __o[delete]=1 ;; 
    --force      | -f ) __o[force]=1 ;; 
    --add        | -a ) __o[add]=1 ;; 
    --rename     | -x ) __o[rename]="${2:-}" ; shift ;;
    --help       | -h ) __o[help]=1 ;; 
    --version    | -v ) __o[version]=1 ;; 
    -- ) shift ; break ;;
    *  ) break ;;
  esac
  shift
done

if [[ ${__o[help]:-} = 1 ]]; then
  ___printhelp
  exit
elif [[ ${__o[version]:-} = 1 ]]; then
  ___printversion
  exit
fi

[[ ${__lastarg:="${!#:-}"} =~ ^--$|${0}$ ]] \
  && __lastarg="" 





