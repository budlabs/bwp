get_wall() {
  if ((__o[random] == 1)); then
    get_random_wall
  elif ((__o[prev] == 1)); then
    get_previous_wall
  elif ((__o[next] == 1)); then
    get_next_wall
  elif [[ -z $1 ]]; then
    
    if ((__o[lock]+__o[wallpaper] == 2)) && [[ -f "$BWP_DIR/currentwall" ]]; then
      echo "$_curnam"
    elif ((__o[lock] == 1)) && [[ -f "$BWP_DIR/currentlock" ]]; then
      basename "$(readlink "$BWP_DIR/currentlock")"
    elif ((__o[lock] != 1)) && [[ -f "$BWP_DIR/currentwall" ]]; then
      echo "$_curnam"
    else
      get_random_wall
    fi
  elif [[ -f "$*" ]]; then
    add_to_library "$*"
  elif [[ -f "$_wdir/$*" ]]; then
    echo "$*"
  else
    ERX "Not a valid argument '$*'"
  fi
}
