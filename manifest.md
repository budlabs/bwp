---
description: >
  SHORT DESCRIPTION
updated:       2019-08-14
version:       2019.08.14.10
author:        budRich
repo:          https://github.com/budlabs
created:       2019-08-09
type:          default
license:       mit
dependencies:  [bash, gawk, sed, ImageMagick, i3lock]
see-also:      [bash(1), awk(1), sed(1), ImageMagick(1), i3lock(1)]
environ:
    BWP_DIR: $HOME/tmp/bwp
    BWP_GEOMETRY: 
    BWP_COMMAND: feh --no-fehbg --bg-fill
    BWP_LOCK_OPTIONS:
    BWP_LOCK_IMAGE_OPTIONS:
synopsis: |
    [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]
    --blur|-b [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]     
    --lock|-l [--lock-options|-L OPTIONS] [--image-options|-I OPTIONS] [--wallpaper|-w|--random|-r|**WALLPAPER**]     
    --delete|-d [--force|-f] [**WALLPAPER**]                      
    --add|-a    [--force|-f] **FILE|DIR**                           
    --rename|-x NEWNAME [**WALLPAPER**]                           
    --help|-h                                                 
    --version|-v                                              
...

# long_description

`bwp` looks at the files in
**BWP_DIR** (*defaults to: `~/.cache/bwp`*)
when selecting a wallpaper.
If `bwp` is executed without any arguments it will execute
**BWP_COMMAND** (*defaults to: `feh --no-fehbg --bg-fill`*)
and set the wallpaper to the the image that **BWP_DIR**/currentwall is linked to
(*or choose a random image from **BWP_DIR**/walls if currentwall doesn't exist*).
The file **BWP_DIR**/history contains the wallpaper **history**.
`--previous` and `--next` can be used to set a wallpaper from the history.
`--random` will select a random wallpaper from **BWP_DIR**/walls .
If the last argument to `bwp` is a file it will get copied to **BWP_DIR**/walls and resized to the same dimensions as the active monitor.
If the last argument is a name of a file in **BWP_DIR**/walls, that file will get used for further actions.
When `bwp` is executed with the `--lock` option,
it will lock the computer using `i3lock(1)`.
When locking, the selected image will be linked to: **BWP_DIR**/currentlock (*which is the file that will be used as locksreen background if no WALLPAPER argument is specified*).


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
