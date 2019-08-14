#!/bin/bash

get_previous_wall() {
  if [[ -f "$_history" ]]; then
    trg="$(awk -v current="$_curnam" '
      NR == 1       {firstline = $0}
      foundit == 1  {found = $0 ; exit}
      $0 == current {foundit = 1}

      END {
        if (found)
          print found
        else
          print firstline
      }
    ' "$_history")"

    if [[ -z $trg ]]; then
      ERX "history is empty"
    elif [[ -f "$_wdir/$trg" ]]; then
      echo "$trg"
    else
      delete_wall "$trg"
      get_previous_wall 
    fi
  else
    echo "$_curnam"
  fi
}
