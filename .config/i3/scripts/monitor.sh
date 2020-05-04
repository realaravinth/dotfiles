#!/bin/bash


help(){
    echo "Usage: monitor [option]"
    echo
    echo "Works only on HDMI interfaces, in case the script doesn't work, run xrandr to see available interfaces "
    echo
    echo "  extends             left    extends monitor to the left"
    echo "                      right   extends monitor to the right"
    echo "  mirror                      mirrors monitor"
    echo "  help                        displays this menu"
    echo 
    echo "Buy me a coffee realaravinth@batsense.net :)"
}

if [ -z $1 ]
then
    help    
else
    if [ $1 == 'mirror' ]
    then
        xrandr --output HDMI-0 --mode 1920x1080 --same-as eDP-1-1
    elif [ $1 == 'extends' ]
        then
            if [ -z $2 ]
            then
                help
            else
                if [ $2 == right ]
                then
                    xrandr --output HDMI-0 --auto --right-of eDP-1-1
                elif [ $2 == 'left' ]
                then
                    xrandr --output HDMI-0 --auto --left-of eDP-1-1
                else
                    echo "Error: $2 is not an option"
                    help 
                fi
            fi
    else
        echo "Error: $1 is not an option"
        help 
    fi
fi