# Nvidia-Xrun

This package enables the muxless Nitro to make use of external displays and projectors.

## Restore steps 

1. Install nvidia-xrun with nvidia drivers and cudann (the pkglist.txt will do that)
2. nvidia-xrun looks for a script in the home dir to init graphical environment
 so `cp nvidia-xinitrc ~\.nvidia-xinitrc` 
3. Unfortunately, the nvidia-initrc doesn't start all components of the gnome desktop-environment
   so to lockscreen `cp lockscreen ~\lockscreen && chmod 777 lockscreen`
