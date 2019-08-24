#!/usr/bin/env bash

: "${BWP_DIR:=$HOME/.cache/wallpapers}"
_polybarmodule=bwpmodule

declare -A buttons

# customize icons and actions here
# (default icons are from fontawesome)
buttons[prev]="%{A1:bwpcontrol prev:}%{A}"
buttons[next]="%{A1:bwpcontrol next:}%{A}"
buttons[edit]="%{A1:bwpcontrol edit:}%{A}"
buttons[delete]="%{A1:bwpcontrol delete:}%{A}"
buttons[random]="%{A1:bwpcontrol random:}%{A}"

# CURRENTWALL string will get replaced by the name
# of the currentwallpaper
buttons[text]="%{A1:bwpcontrol menu:}CURRENTWALL%{A}"

[[ -n $(polify --module "$_polybarmodule") ]] && _state=controls

main() {

  case "$1" in

    ( update )
      [[ $_state = controls ]] && updatemodule
    ;;

    ( toggle )
      if [[ $_state = controls ]]; then
        polify --module "$_polybarmodule" --clear
      else
        updatemodule
      fi
    ;;

    ( next|prev|random|delete )
      bwp -f"${1:0:1}"
      [[ $_state = controls ]] && updatemodule
    ;;

    ( edit ) rename_wallpaper ;;
    ( menu ) select_wallpaper ;;

  esac

}

select_wallpaper() {

  local newwall wdir

  wdir="$BWP_DIR/walls"

  newwall="$(

    find "$wdir" ! -path "$wdir" -printf '%f\n' \
    | if command -v i3menu > /dev/null ; then
        i3menu                   \
          --orientation vertical \
          --width       300      \
          --ypos        25       \
          --layout      mouse    \
          --anchor      2        \
          --height      350      \

      else
        dmenu
      fi

  )"

  [[ -n $newwall ]] && {
    bwp "$newwall"
    updatemodule
  }
}

rename_wallpaper() {

  local xpos newname

  _curpth="$(readlink "$BWP_DIR/currentwall")"
  _curnam="${_curpth##*/}"

  # adjust the xposition depending on the
  # visibility of the "next button"
  [[ $_curnam = $(head -1 "$BWP_DIR/history") ]] \
    && xpos=55 \
    || xpos=68

  newname="$(

    echo -n | if command -v i3menu > /dev/null ; then
      i3menu                 \
        --layout  mouse      \
        --filter  "$_curnam" \
        --ypos    1          \
        --xoffset $xpos      \
        --width   350        \

    else
      dmenu
    fi

  )"

  [[ -n $newname ]] && {
    bwp --rename "$newname"
    updatemodule
  }
}

updatemodule() {

  local ne pr ip in ie id ir it lbl

  _curpth="$(readlink "$BWP_DIR/currentwall")"
  _curnam="${_curpth##*/}"

  # this test hides the next button if the
  # currentwall is the first in history. And hides
  # the prevbutton if the current wall is last in
  # history.
  [[ -f "$BWP_DIR/history" ]] && { 
    ne='' pr=''
    [[ $_curnam = $(head -1 "$BWP_DIR/history") ]] && unset ne
    [[ $_curnam = $(tail -1 "$BWP_DIR/history") ]] && unset pr 
  }

  ip=${buttons[prev]}
  in=${buttons[next]}
  ie=${buttons[edit]}
  id=${buttons[delete]}
  ir=${buttons[random]}
  it=${buttons[text]/CURRENTWALL/$_curnam}

  # lbl is the module content
  lbl="%{A1::} ${pr+$ip }$ie $id $ir ${ne+$in }$it%{A}"

  polify --module "$_polybarmodule" "$lbl"
}

main "${@}"
