#!/bin/bash

LOCKSCREEN="/home/aravinth/Pictures/Wallpapers/lockscreen.jpg"

i3lock --nofork -i $LOCKSCREEN --ignore-empty-password -f -k \
    -t --pass-media-keys --pass-screen-keys \
    --greetertext="Welcome, Batman." --greeterpos="980:900" 

