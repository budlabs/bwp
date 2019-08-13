#!/bin/bash

get_random_wall() {

  local rnd

  rnd="$(
    find "${_wdir:-}" \
    ! -name "${_curnam:-}" -type f -printf '%f\n' \
    | sort -R | head -1
  )"

  ((${_o[n]:-0} == 1)) && add_to_history "${rnd:=$_curnam}"
  echo "$rnd"
}
