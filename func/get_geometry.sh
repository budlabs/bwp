#!/bin/bash

get_geometry() {
  echo "${BWP_GEOMETRY:=$(xrandr | awk '/[*]/ {print $1; exit}')}"
}

