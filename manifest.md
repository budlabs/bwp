---
description: >
  SHORT DESCRIPTION
updated:       2019-08-09
version:       2019.08.09.3
author:        budRich
repo:          https://github.com/budlabs
created:       2019-08-09
type:          default
dependencies:  [bash, gawk, sed]
see-also:      [bash(1), awk(1), sed(1)]
environ:
    BWP_DIR: $HOME/tmp/bwp
    BWP_GEOMETRY: -
    BWP_COMMAND: feh --no-fehbg --bg-fill
synopsis: |
    --wallpaper|-w [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]
    --blur|-b [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]     
    --lock|-l [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]     
    --delete|-d [--force|-f] [**WALLPAPER**]                      
    --add|-a [--force|-f] **FILE|DIR**                           
    --rename|-x NEWNAME [**WALLPAPER**]                           
    --help|-h                                                 
    --version|-v                                              
...

# long_description

LONG DESCRIPTION

# options-wallpaper-description
set desktop wallpaper

# options-blur-description
toggle/set blur

# options-lock-description
lock screen

# options-delete-description
delete wallpaper from library

# options-add-description
add a new image to the library

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




