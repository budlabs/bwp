## ENVIRONMENT

### BWP_DIR
Directory where wallpapers and history file will get
stored.
defaults to: `$HOME/.cache/wallpapers`

### BWP_GEOMETRY
($WIDTHx$HEIGHT) if set, images added to the library will
be resized (if needed) to the dimensions specified. If not
set, images will be resized (if needed) to the same
dimensions as the currently active monitor.
defaults to: `""`

### BWP_COMMAND
Command used to set the wallpaper.
defaults to: `feh --no-fehbg --bg-fill`

### BWP_LOCK_OPTIONS
Additional command line options passed to `i3lock`.
`--lock-options` will override this variable if set.
defaults to: `""`

### BWP_LOCK_IMAGE_OPTIONS
Additional command line options passed to `convert` before
locking the screen. `--image-options` will override this
variable if set.
defaults to: `""`
