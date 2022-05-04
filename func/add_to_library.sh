#!/bin/bash

add_to_library() {

  local src trg name

  src="$1"

  ((__o[delete] == 1)) \
    && ERX "file path not a valid arg to delete action"

  if [[ -d "$src" ]]; then
    find "$src"  -iregex '.*\.\(jpg\|png\)' -print0 | {
      if command -v parallel > /dev/null; then
        parallel -0 --bar "BWP_GEOMETRY=$(get_geometry) \
          bwp -a ${__o[force]:+-f}" "{}" :::: -
      else
        xargs -0 -i{} BWP_GEOMETRY="$(get_geometry)" \
          bwp -a ${__o[force]:+-f} "{}"
      fi
    }
    exit
  elif [[ ! -f $src ]]; then
    ERX "'$src' is not a file."
  fi

  : "${BWP_GEOMETRY:=$(get_geometry)}"

  mapfile imageinfo < <(identify -format '%m\n%wx%h' "$src")

  [[ ${imageinfo[0]:-} =~ PNG|JPEG ]] \
    || ERX "'$src' is not an image."

  trg="$_wdir/${src##*/}" trg="${trg%.*}"
  name="${trg##*/}"

  if [[ -f $trg ]] && ((__o[force] != 1)); then
    ERR "$trg already exist in library"
  else
    # resize image
    if [[ ${imageinfo[1]} = "${BWP_GEOMETRY}" ]]; then
      cp -f "$src" "$trg"
    else
      convert "$src"                 \
        -resize  "${BWP_GEOMETRY}^"  \
        -gravity center              \
        -extent  "${BWP_GEOMETRY}"   \
        "$trg"
    fi

    ((__o[wallpaper] == 1)) \
      && set_wall "$name" && __o[wallpaper]=0
      
    generate_blur "$trg" "${trg/walls/blurs}" "${imageinfo[0]:-}"
    
  fi

  echo "$name"
}
