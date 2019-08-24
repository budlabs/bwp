# customizing i3lock

When **bwp** is executed with the `--lock` option, `i3lock(1)` will lock the computer with the selected wallpaper. Before locking however the image is piped through `imagemagick(1)` to make sure all images will be accepted by **i3lock**.
(*the vanilla version of i3lock only supports `.png` images otherwise*). If a multimonitor setup is active, the blurred version of the wallpaper will get stretched over all screens, with the default image on the currently active monitor.  
It is possible to add additional options both to **i3lock** and **imagemagick** by either using the environment variables:  

* **BWP_LOCK_OPTIONS** , for i3lock
* **BWP_LOCK_IMAGE_OPTIONS** , for imagemagick

or use the command line options `--lock-options` and `--image-options` .
(*if both are present, the commandline options will overwrite the environment variables*) .

Both of these commands will do the same thing:  
```
bwp --lock --lock-options '--ignore-empty-password --nofork'
BWP_LOCK_OPTIONS='--ignore-empty-password --nofork'
```

if value is the path to a file, the content of that file will be used.

Below is a [modified example] from [i3lock-color]:  

```
--insidevercolor=#ffffff22   \
--ringvercolor=#bb00bbbb     \
\
--insidewrongcolor=#ffffff22 \
--ringwrongcolor=#880000bb   \
\
--insidecolor=#00000000      \
--ringcolor=#ff00ffcc        \
--linecolor=#00000000        \
--separatorcolor=#ff00ffcc   \
\
--verifcolor=#ee00eeee        \
--wrongcolor=#ee00eeee        \
--timecolor=#ee00eeee        \
--datecolor=#ee00eeee        \
--layoutcolor=#ee00eeee      \
--keyhlcolor=#880000bb       \
--bshlcolor=#880000bb        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2         \

```

If those options are saved to the file `~/tmp/colorlock`, **bwp** can be executed with:  
```
bwp --lock --lock-options ~/tmp/colorlock

OR

export BWP_LOCK_OPTIONS=~/tmp/colorlock
bwp --lock
```

Worth noting is that the options `--image` and `--raw` is already set from within **bwp**.

The same method can be used with imagemagick, the options will get inserted after the path to the wallpaper and before: `-set png:format png32 RGB:-` .  

Imagemagick is a quite complex commandline application, but here is a simple example:  

```
bwp --lock \
    --image-options '-draw "fill black fill-opacity 0.4 rectangle 0,0 250,250"'
```

this will result in the following command:  

```
convert PATH_TO_WALLPAPER \
        -draw "fill black fill-opacity 0.4 rectangle 0,0 250,250" \
        -set png:format png32 RGB:-
```

And draw a black square at the top left corner of the lock screen.

## pro tip

Create a script that will generate your custom options in to two files and add the following to your startup script:

```
export export BWP_LOCK_OPTIONS=~/tmp/colorlock
export export BWP_LOCK_IMAGE_OPTIONS=~/tmp/imagelock
```

I'm really sorry, I lost my own script...

[i3lock-color]: https://github.com/PandorasFox/i3lock-color
[modified example]: https://github.com/PandorasFox/i3lock-color/blob/master/lock.sh
