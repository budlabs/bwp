#!/usr/bin/env bash



: "${BWP_DIR:=$HOME/tmp/bwp}"

[[ -n $(polify --module bwpmodule) ]] \
  && _state=controls \
  || _state=minimized

main() {
  case "$1" in
    toggle )
      if [[ $_state = controls ]]; then
        polify --module bwpmodule --clear
      else
        updatemodule
      fi
    ;;

    next|prev|random|delete )
      bwp -w"${1:0:1}" -f
      [[ $_state = controls ]] && updatemodule
    ;;

    edit )
      _curpth="$(readlink "$BWP_DIR/currentwall")"
      _curnam="${_curpth##*/}"

      [[ $_curnam = $(head -1 "$BWP_DIR/history") ]] \
        && xpos=55 \
        || xpos=68

      newname="$(i3menu \
                   --layout  mouse      \
                   --filter  "$_curnam" \
                   --ypos    1          \
                   --xoffset $xpos         \
                   --width   350        \
                   )"

      [[ -n $newname ]] && {
        bwp -x "$newname"
        updatemodule
      }
      
    ;;

    menu )
      newwall="$(ls "$BWP_DIR"/walls | \
                 i3menu \
                   --orientation vertical \
                   --width 300 \
                   --ypos 25 \
                   --layout mouse \
                   --anchor 2 \
                   --height 350
                   )"


      [[ -n $newwall ]] && {
        bwp -w "$newwall"
        updatemodule
      }
      
    ;;

    
  esac
}


updatemodule() {
  _curpth="$(readlink "$BWP_DIR/currentwall")"
  _curnam="${_curpth##*/}"

  # prev edit delete random next
  # menu
  # blur

 # 
  iPrev="%{A1:bwpcontrol prev:}%{A}"
  iEdit="%{A1:bwpcontrol edit:}%{A}"
  iDel="%{A1:bwpcontrol delete:}%{A}"
  iRnd="%{A1:bwpcontrol random:}%{A}"
  lbl="$iPrev $iEdit $iDel $iRnd"

  [[ $_curnam = $(head -1 "$BWP_DIR/history") ]] \
    || lbl+=" %{A1:bwpcontrol next:}%{A}"


  iName="%{A1:bwpcontrol menu:}$_curnam%{A}"

  lbl="%{A1::} $lbl $iName%{A}"

  polify --module bwpmodule "$lbl"
}

main "${@}"
