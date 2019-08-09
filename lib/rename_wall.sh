#!/bin/bash

rename_wall() {
  local newname trg

  newname="$1"
  trg="$2"

  for f in "$BWP_DIR"/*/"$trg" ; do
    mv -f "$f" "${f%/*}/$newname"
  done

  [[ -f "$_history" ]] \
    && sed -i "s/^${trg}$/${newname}/" "$_history"

  [[ $trg = "$_curnam" ]] \
    && ln -fs "${f%/*}/$newname" "$BWP_DIR/currentwall"
    
  # rename_wall "${_o[x]}" "$_wall"
}
