# add a custom action to thunar

![demo](https://github.com/budRich/bwp/raw/next/examples/thunar/demo.gif)

One of the best features of the [Thunar file manager] are [custom actions].
By adding a custom action (`Edit -> Configure custom actions ...`) with the command:  

```
bwp %f
```

You can change wallpaper with bwp from within thunar, and if the image doesn't exist in the library it will be automatically added.

If you use the polybar module you can use this custom action command to also update the module when you change wallpaper from thunar:  
```
bwp %f && bwpcontrol update
```


I also made a [video about this] on the [budlabs youtube channel] a while back.

[video about this]: https://www.youtube.com/watch?v=NsRnn4VKLQ8&list=PLt6-rPpOpkb3bMI5_wF43mRy1l2PEgDmf&index=23&t=0s
[budlabs youtube channel]: https://www.youtube.com/channel/UCi8XrDg1bK_MJ0goOnbpTMQ
[custom actions]: https://docs.xfce.org/xfce/thunar/4.10/custom-actions
[Thunar file manager]: https://docs.xfce.org/xfce/thunar/start
