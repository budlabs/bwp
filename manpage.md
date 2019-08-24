`bwp` - budlabs wallpaper selector

SYNOPSIS
--------
```text
bwp [--prev|-p|--next|-n|--random|-r|WALLPAPER]
bwp --blur|-b [--prev|-p|--next|-n|--random|-r|WALLPAPER|DIR]     
bwp --lock|-l [--lock-options|-L OPTIONS] [--image-options|-I OPTIONS] [--wallpaper|-w|--random|-r|WALLPAPER]     
bwp --delete|-d [--force|-f] [WALLPAPER]                      
bwp --add|-a    [--force|-f] FILE|DIR                           
bwp --rename|-x NEWNAME [WALLPAPER]                           
bwp --help|-h                                                 
bwp --version|-v                                              
```

DESCRIPTION
-----------
The argument WALLPAPER is available for all
actions except `--add` and can be either the name
of a file in `BWP_DIR/walls` or the path to a file
(*if the file doesn't exist in the library, it
will get added before the action is applied*). If
the WALLPAPER argument is omitted and no navigate
action (`--next`,`--pre`,`--random`) is specified
the action will get applied to the **currentwall**
(*the file that `BWP_DIR/currentwall` links
to.\**)  

\*(*except for the `--lock` action that will use
`BWP_DIR/currentlock`. To set the lockscreen to
the **currentwall**, use the `--wallpaper`
option*).


OPTIONS
-------

`--prev`|`-p`  
takes the previous wallpaper according to
BWP_DIR/history

`--next`|`-n`  
takes the next wallpaper according to
BWP_DIR/history

`--random`|`-r`  
get a random wallpaper from BWP_DIR/walls

`--blur`|`-b`  
toggle/set blur. If no WALLPAPER is specified the
blur state of the current wallpaper will get
toggled.

`--lock`|`-l`  
locks the computer with `i3lock(1)`. If no
WALLPAPER is specified, the last image that was
last used as lockscreen background will be used.

`--lock-options`|`-L` OPTIONS  
Additional command line options passed to
`i3lock`. If OPTIONS is the path to a file, the
content of that file will be used. This options
overrides the environment variable:
`BWP_LOCK_OPTIONS`

`--image-options`|`-I` OPTIONS  
Additional command line options passed to
`convert` before locking the screen. If OPTIONS is
the path to a file, the content of that file will
be used. This options overrides the environment
variable: `BWP_LOCK_IMAGE_OPTIONS`

`--wallpaper`|`-w`  
when set in conjunction with `--lock`, the
current wallpaper will be used as lockscreen
background.

`--delete`|`-d`  
delete WALLPAPER from library and history. Use
`--force` option to skip prompt.

`--force`|`-f`  
if set `--delete` option will not prompt and when
adding files to the library (`--add`) existing
files with the same name will get overwritten.

`--add`|`-a`  
if a argument is a FILE it will get added to the
library. If argument is a DIRECTORY all images in
that directory will get added to the library. Use
`--force` option to overwrite existing files.

`--rename`|`-x` NEWNAME  
rename WALLPAPER to NEWNAME

`--help`|`-h`  
Show help and exit.

`--version`|`-v`  
Show version and exit.


ENVIRONMENT
-----------

`BWP_DIR`  
Directory where wallpapers and history file will
get stored.
defaults to: $HOME/.cache/wallpapers

`BWP_GEOMETRY`  
($WIDTHx$HEIGHT) if set, images added to the
library will be resized (if needed) to the
dimensions specified. If not set, images will be
resized (if needed) to the same dimensions as the
currently active monitor.
defaults to: 

`BWP_COMMAND`  
Command used to set the wallpaper.
defaults to: feh --no-fehbg --bg-fill

`BWP_LOCK_OPTIONS`  
Additional command line options passed to
`i3lock`. `--lock-options` will override this
variable if set.
defaults to: 

`BWP_LOCK_IMAGE_OPTIONS`  
Additional command line options passed to
`convert` before locking the screen.
`--image-options` will override this variable if
set.
defaults to: 

DEPENDENCIES
------------
`bash`
`gawk`
`sed`
`ImageMagick`
`i3lock`



