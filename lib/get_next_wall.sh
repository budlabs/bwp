
get_next_wall() {
  local trg firstline

  if [[ -f "$_history" ]]; then
    firstline="$(head -1 "$_history")"

    if [[ $firstline = "$_curnam" ]]; then
      get_random_wall
    else
      trg="$(awk -v current="$_curnam" '
        $0 == current {print lastline ; exit}
        {lastline = $0}
      ' "$_history")"

      if [[ -z $trg ]]; then
        rm "$_history"
        ERX "history is empty"
      elif [[ -f "$_wdir/$trg" ]]; then
        echo "$trg"
      else
        delete_wall "$trg"
        get_next_wall 
      fi
    fi
  else
    get_random_wall
  fi
}
