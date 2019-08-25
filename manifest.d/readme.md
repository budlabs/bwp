# readme_banner

`bwp` was created because I wanted a way to navigate wallpaper history.
I also thought that it would be cool to be able to blur the current wallpaper as well as lock the screen with the current wallpaper, so that's in here too.  

When a file is added to the *bwp library* (`BWP_DIR/walls`), it will get resized according to the environment variable `BWP_GEOMETRY` 
(*defaults to the resolution of the currently active monitor*). And a blurred version of the image will get created. This makes for very fast *blur toggling* and lock screen activation.  

`bwp` has a commandline interface, and can be used accordingly. If no argument is passed to `bwp` it will set the wallpaper to whatever file `BWP_DIR/currentwall` is linked to. So adding the following line to your startup script is nice:  

```
bwp
```

See [the examples directory](https://github.com/budRich/bwp/tree/next/examples/) with usecases for:  

* [i3](https://github.com/budRich/bwp/tree/next/examples/i3)
* [polybar](https://github.com/budRich/bwp/tree/next/examples/polybar)
* [thunar](https://github.com/budRich/bwp/tree/next/examples/thunar)
* [i3lock](https://github.com/budRich/bwp/tree/next/examples/i3lock)

I should also mention that **bwp** started out as "*mod*" of [betterlockscreen] by pavanjadhaw

[betterlockscreen]: https://github.com/pavanjadhaw/betterlockscreen

# readme_install

If you use **Arch Linux** you can get **bwp** from [AUR](https://aur.archlinux.org/packages/bwp/).  

Use the `make(1)` to do a systemwide installation of both the script and the manpage.  

(*configure the installation destination in the Makefile, if needed*)

```
$ git clone https://github.com/budlabs/bwp.git
$ cd bwp
# make install
$ bwp -v
bwp - version: 2019.08.24.10
updated: 2019-08-24 by budRich
```

# long_description

The argument WALLPAPER is available for all actions except `--add` and can be either the name of a file in `BWP_DIR/walls` or the path to a file (*if the file doesn't exist in the library, it will get added before the action is applied*). If the WALLPAPER argument is omitted and no navigate action (`--next`,`--pre`,`--random`) is specified the action will get applied to the **currentwall** (*the file that `BWP_DIR/currentwall` links to.\**)  

\*(*except for the `--lock` action that will use `BWP_DIR/currentlock`. To set the lockscreen to the **currentwall**, use the `--wallpaper` option*).

# readme_dependencies

[ImageMagick] is used to resize and blur wallpapers and prepare the lockscreen background.  

[i3lock] is used to lock the computer. I personally use the fork [i3lock-color], and that works as well, these are off course only needed if you intend to lock the screen.  

[feh] is the default program to set the wallpaper, but it can be changed by setting the environment variable `BWP_COMMAND`.  

`xrandr` is used to fetch the screen dimensions.  

if [pngquant] is installed it will be used to convert blurred images to png8 to save space.

if [parallel] is installed it will be used when adding multiple files 
(when the last argument to `bwp` is a path to a directory).
It should be faster then `xargs`, 
(*which is used if parallel is not installed*),
but utilize more of the CPU.

[ImageMagick]: https://www.imagemagick.org/
[parallel]: https://www.gnu.org/software/parallel/
[pngquant]: https://pngquant.org/
[feh]: https://feh.finalrewind.org/
[i3lock-color]: https://github.com/PandorasFox/i3lock-color
[i3lock]: https://github.com/i3/i3lock
