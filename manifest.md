---
description: >
  budlabs wallpaper selector
updated:       2019-08-24
version:       2019.08.24.8
author:        budRich
repo:          https://github.com/budlabs
created:       2019-08-09
type:          default
license:       mit
dependencies:  [bash, gawk, sed, ImageMagick, i3lock]
see-also:      [i3lock(1), ImageMagick(1), parallel(1), pngquant(1)]
environ:
    BWP_DIR: $HOME/.cache/wallpapers
    BWP_GEOMETRY: 
    BWP_COMMAND: feh --no-fehbg --bg-fill
    BWP_LOCK_OPTIONS:
    BWP_LOCK_IMAGE_OPTIONS:
synopsis: |
    [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]
    --blur|-b [--prev|-p|--next|-n|--random|-r|**WALLPAPER|DIR**]     
    --lock|-l [--lock-options|-L OPTIONS] [--image-options|-I OPTIONS] [--wallpaper|-w|--random|-r|**WALLPAPER**]     
    --delete|-d [--force|-f] [**WALLPAPER**]                      
    --add|-a    [--force|-f] **FILE|DIR**                           
    --rename|-x NEWNAME [**WALLPAPER**]                           
    --help|-h                                                 
    --version|-v                                              
...


