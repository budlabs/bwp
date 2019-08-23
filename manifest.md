---
description: >
  budlabs wallpaper selector
updated:       2019-08-23
version:       2019.08.23.0
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

# long_description

`bwp` looks at the files in
**BWP_DIR** (*defaults to: `~/.cache/wallpapers`*)
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
