# window manager examples

I personally use the [i3 window manager], but i guess these simple examples can be added in one way or another for other WM/DE solutions.

## global keybindings

```
bindsym Mod4+Shift+w   exec --no-startup-id bwp --next
bindsym Mod4+Control+w exec --no-startup-id bwp --prev
bindsym Mod4+x         exec --no-startup-id bwp --lock --wallpaper
```

## restore wallpaper on startup

When `bwp` is executed without any arguments it will reset the wallpaper to the last known one (or a random one if none is found). So add this to your startup script, for example `~/.config/i3/config`:  

```
exec --no-startup-id bwp
```

[i3 window manager]: https://i3wm.org/
