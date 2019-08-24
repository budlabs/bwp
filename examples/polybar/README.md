# Script: bwpcontrol

This is a custom [polybar] module that was created for a [screencast] on the [budlabs youtube channel].

![demo](https://github.com/budRich/bwp/raw/next/examples/polybar/bwpcontroldemo.gif)

## Dependencies

* [polify] used to update the module.
* [bwp] for wallpaper selecting
* [i3menu] OR dmenu for displaying menus
* [i3lock] to lock the screen (optional)

## Module

```
[module/bwpmodule]
type = custom/ipc
hook-0 = polify --module bwpmodule
format = <output>

click-left = bwpcontrol toggle
click-middle = bwp --lock --wallpaper
click-right = bwp --blur
scroll-up = bwpcontrol next
scroll-down = bwpcontrol prev

initial = 1
```

Also make sure the following setting is present in the **bar section** of your polybar config:

```
[bar/example]

...

enable-ipc = true

...

; for FontAweseom to work these font settings are required
font-1 = FontAwesome5Free:style=Solid:pixelsize=10:antialias=true;3
font-2 = FontAwesome5Brands:style=Solid:pixelsize=10:antialias=true;3
```

[polybar]: https://polybar.github.io/
[screencast]: https://youtu.be/nK9qx_9I4Iw
[budlabs youtube channel]: https://www.youtube.com/channel/UCi8XrDg1bK_MJ0goOnbpTMQ
[polify]: https://github.com/budlabs/polify
[bwp]: https://github.com/buRich/bwp
[i3menu]: https://github.com/budlabs/i3ass/wiki/16AS_i3menu
[i3lock]: https://github.com/i3/i3lock
