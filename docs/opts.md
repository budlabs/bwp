# options-wallpaper-description
when set in conjunction with `--lock`, the current wallpaper will be used as lockscreen background.

# options-blur-description
toggle/set blur. If no WALLPAPER is specified the blur state of the current wallpaper will get toggled.

# options-lock-description
locks the computer with `i3lock(1)`. If no WALLPAPER is specified, the last image that was last used as lockscreen background will be used.

# options-delete-description
delete WALLPAPER from library and history. Use `--force` option to skip prompt.

# options-add-description
if a argument is a FILE it will get added to the library. If argument is a DIRECTORY all images in that directory will get added to the library. Use `--force` option to overwrite existing files.

# options-rename-description
rename WALLPAPER to NEWNAME

# options-random-description
get a random wallpaper from BWP_DIR/walls

# options-next-description
takes the next wallpaper according to BWP_DIR/history

# options-prev-description
takes the previous wallpaper according to BWP_DIR/history

# options-force-description
if set `--delete` option will not prompt and when adding files to the library (`--add`) existing files with the same name will get overwritten.

# options-lock-options-description

Additional command line options passed to `i3lock`.
If OPTIONS is the path to a file, the content of that file will be used.
This options overrides the environment variable: `BWP_LOCK_OPTIONS` 

# options-image-options-description

Additional command line options passed to `convert` before locking the screen.
If OPTIONS is the path to a file, the content of that file will be used.
This options overrides the environment variable: `BWP_LOCK_IMAGE_OPTIONS`

# options-help-description
Show help and exit.

# options-version-description
Show version and exit.
