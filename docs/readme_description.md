`bwp` was created because I wanted a way to
navigate wallpaper history. I also thought that
it would be cool to be able to blur the current
wallpaper as well as lock the screen with the
current wallpaper, so that's in here too.  

The development process was recorded and published to **youtube** as:
[How to change wallpapers] on the [budlabs youtube channel].  

When a file is added to the *bwp library*
(`BWP_DIR/walls`), it will get resized according
to the environment variable `BWP_GEOMETRY`
(*defaults to the resolution of the currently
active monitor*). And a blurred version of the
image will get created. This makes for very
fast *blur toggling* and lock screen
activation. 

`bwp` has a commandline interface, and can be used
accordingly. If no argument is passed to `bwp` it
will set the wallpaper to whatever file
`BWP_DIR/currentwall` is linked to. So adding the
following line to your startup script is nice:  

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
[How to change wallpapers]: https://www.youtube.com/playlist?list=PLt6-rPpOpkb0mJGVx07iS-kNA4cgk8CFw
[budlabs youtube channel]: https://www.youtube.com/channel/UCi8XrDg1bK_MJ0goOnbpTMQ
