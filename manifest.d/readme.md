# readme_usage

if [pngquant](https://pngquant.org/) is installed it will be used to convert blurred images to png8 to save space.

if [parallel](https://www.gnu.org/software/parallel/) is installed it will be used when adding multiple files 
(when the last argument to `bwp` is a path to a directory).
It should be faster then `xargs`, 
(*which is used if `parallel is not installed*),
but utilize more of the CPU.
