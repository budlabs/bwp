#!/bin/bash

get_random_wall() {

  local rnd

  rnd="$(ls --ignore "${_curnam:-}" "${_wdir:-}" \
        | sort -R \
        | head -1)"

  ((_o[n] == 1)) && add_to_history "${rnd:$_curnam}"
  echo "$rnd"
}
