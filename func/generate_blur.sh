#!/bin/bash

generate_blur() {
  local src trg ext

  src="$1" trg="$2" ext="$3"

  convert "$src"                     \
          -blur 0x8                  \
          -set "png:format" png32    \
          -quality 85                \
          "$trg"

  # if pngquant is installed it will be used to 
  # convert png32 to png8 saving us some diskspace
  [[ $ext =~ PNG ]] && command -v pngquant > /dev/null && {
    pngquant -fo "${trg}.png" "$trg" \
      &&  mv -f  "${trg}.png" "$trg"
  }
}
