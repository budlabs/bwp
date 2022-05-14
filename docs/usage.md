The argument WALLPAPER is available for all
actions except `--add` and can be either the name
of a file in `BWP_DIR/walls` or the path to a
file (*if the file doesn't exist in the library,
it will get added before the action is applied*).
If the WALLPAPER argument is omitted and no
navigate action (`--next`,`--pre`,`--random`) is
specified the action will get applied to
the **currentwall** (*the file that
`BWP_DIR/currentwall` links to.\**)  


\*except for the `--lock` action that will use
`BWP_DIR/currentlock`. 
