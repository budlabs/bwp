#!/bin/bash

generate_blur() {
  local src trg

  src="$1" trg="$2"

  convert "$src"              \
    -blur 0x8                 \
    -set "png:format" png32   \
    "$trg"
}
