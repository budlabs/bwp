# bwp - SHORT DESCRIPTION 

USAGE
-----

LONG DESCRIPTION


OPTIONS
-------

```text
bwp --wallpaper|-w [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]
bwp --blur|-b [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]     
bwp --lock|-l [--prev|-p|--next|-n|--random|-r|**WALLPAPER**]     
bwp --delete|-d [--force|-f] [**WALLPAPER**]                      
bwp --add|-a [--force|-f] **FILE|DIR**                           
bwp --rename|-x NEWNAME [**WALLPAPER**]                           
bwp --help|-h                                                 
bwp --version|-v                                              
```


`--wallpaper`|`-w`  
set desktop wallpaper

`--prev`|`-p`  
takes the previous wallpaper according to BWP_DIR/history

`--next`|`-n`  
takes the next wallpaper according to BWP_DIR/history

`--random`|`-r`  
get a random wallpaper from BWP_DIR/walls

`--blur`|`-b`  
toggle/set blur

`--lock`|`-l`  
lock screen

`--delete`|`-d`  
delete wallpaper from library

`--force`|`-f`  
if set `--delete` option will not prompt and when adding
files to the library (`--add`) existing files with the same
name will get overwritten.




`--add`|`-a`  
add a new image to the library

`--rename`|`-x` NEWNAME  
rename WALLPAPER to NEWNAME

`--help`|`-h`  
Show help and exit. whatever newline. this is also a new
line.


`--version`|`-v`  
Show version and exit.

## license

**bwp** is licensed with the **MIT license**


