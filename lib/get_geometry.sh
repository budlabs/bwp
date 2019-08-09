get_geometry() {
  if [[ -n $BWP_GEOMETRY ]]; then
    echo $BWP_GEOMETRY
  else
    xrandr | awk '/[*]/ {print $1; exit}'
  fi
}

