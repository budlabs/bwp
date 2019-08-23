# bwp - budlabs wallpaper selector 

USAGE
-----

`bwp` looks at the files in **BWP_DIR** (*defaults to:
`~/.cache/wallpapers`*) when selecting a wallpaper. If `bwp`
is executed without any arguments it will execute
**BWP_COMMAND** (*defaults to: `feh --no-fehbg --bg-fill`*)
and set the wallpaper to the the image that
**BWP_DIR**/currentwall is linked to (*or choose a random
image from **BWP_DIR**/walls if currentwall doesn't exist*).
The file **BWP_DIR**/history contains the wallpaper
**history**. `--previous` and `--next` can be used to set a
wallpaper from the history. `--random` will select a random
wallpaper from **BWP_DIR**/walls . If the last argument to
`bwp` is a file it will get copied to **BWP_DIR**/walls and
resized to the same dimensions as the active monitor. If the
last argument is a name of a file in **BWP_DIR**/walls, that
file will get used for further actions. When `bwp` is
executed with the `--lock` option, it will lock the computer
using `i3lock(1)`. When locking, the selected image will be
linked to: **BWP_DIR**/currentlock (*which is the file that
will be used as locksreen background if no WALLPAPER
argument is specified*).


OPTIONS
-------

```
bwp [--prev|-p|--next|-n|--random|-r|WALLPAPER]
bwp --blur|-b [--prev|-p|--next|-n|--random|-r|WALLPAPER|DIR]     
bwp --lock|-l [--lock-options|-L OPTIONS] [--image-options|-I OPTIONS] [--wallpaper|-w|--random|-r|WALLPAPER]     
bwp --delete|-d [--force|-f] [WALLPAPER]                      
bwp --add|-a    [--force|-f] FILE|DIR                           
bwp --rename|-x NEWNAME [WALLPAPER]                           
bwp --help|-h                                                 
bwp --version|-v                                              
```


`--prev`|`-p`  
takes the previous wallpaper according to BWP_DIR/history

`--next`|`-n`  
takes the next wallpaper according to BWP_DIR/history

`--random`|`-r`  
get a random wallpaper from BWP_DIR/walls

`--blur`|`-b`  
toggle/set blur. If no WALLPAPER is specified the blur
state of the current wallpaper will get toggled.

`--lock`|`-l`  
locks the computer with `i3lock(1)`. If no WALLPAPER is
specified, the last image that was last used as lockscreen
background will be used.

`--lock-options`|`-L` OPTIONS  
Additional command line options passed to `i3lock`. If
OPTIONS is the path to a file, the content of that file will
be used. This options overrides the environment variable:
`BWP_LOCK_OPTIONS`

`--image-options`|`-I` OPTIONS  
Additional command line options passed to `convert` before
locking the screen. If OPTIONS is the path to a file, the
content of that file will be used. This options overrides
the environment variable: `BWP_LOCK_IMAGE_OPTIONS`

`--wallpaper`|`-w`  
when set in conjunction with `--lock`, the current
wallpaper will be used as lockscreen background.

`--delete`|`-d`  
delete WALLPAPER from library and history. Use `--force`
option to skip prompt.

`--force`|`-f`  
if set `--delete` option will not prompt and when adding
files to the library (`--add`) existing files with the same
name will get overwritten.

`--add`|`-a`  
if a argument is a FILE it will get added to the library.
If argument is a DIRECTORY all images in that directory will
get added to the library. Use `--force` option to overwrite
existing files.

`--rename`|`-x` NEWNAME  
rename WALLPAPER to NEWNAME

`--help`|`-h`  
Show help and exit.

`--version`|`-v`  
Show version and exit.

---

if [pngquant](https://pngquant.org/) is installed it will
be used to convert blurred images to png8 to save space.

if [parallel](https://www.gnu.org/software/parallel/) is installed it will be used when adding multiple files  (when the last argument to `bwp` is a path to a directory). It should be faster then `xargs`,  (*which is used if `parallel is not installed*), but utilize more of the CPU.

## license

**bwp** is licensed with the **MIT license**


