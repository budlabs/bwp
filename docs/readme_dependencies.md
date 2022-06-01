[ImageMagick] is used to resize and blur
wallpapers and prepare the lockscreen
background. 

[i3lock] is used to lock the computer. I
personally use the fork [i3lock-color], and that
works as well, these are off course only needed
if you intend to lock the screen.  

[feh] is the default program to set the wallpaper,
but it can be changed by setting the environment
variable `BWP_COMMAND`.  

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
