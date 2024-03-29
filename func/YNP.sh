#!/bin/bash

YNP() {

  local sp key default opts status

  default=y
  opts=yn

  [[ $1 =~ -([${opts}]) ]] \
    && default="${BASH_REMATCH[1]}" && shift

  sp="$* [${default^^}/${opts/$default/}]"

  if [[ -t 2 ]]; then
    >&2 echo "$sp"

    while :; do
      read -rsn 1

      key="${REPLY:-$default}"
      [[ $key =~ [${opts}] ]] || continue
      break
    done
  else
    key="$default"
  fi

  [[ ${key,,} = n ]] && status=1

  return "${status:-0}"
}
