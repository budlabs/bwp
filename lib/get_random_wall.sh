#!/bin/bash

get_random_wall() {

  local rnd

  rnd="$(
    find "${_wdir:-}" ! -name "${_curnam:-}" -printf '%f\n' \
    | sort -R | head -1
  )"

  ((__o[next] == 1)) && add_to_history "${rnd:=$_curnam}"
  echo "$rnd"
}
