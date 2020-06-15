#/bin/bash
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
then                                                                            
     if [ $(xrandr --listmonitors | head -n 1 | cut -d " " -f 2) -eq 1 ]         
    then                                                                        
        exec startx                                                             
    else                                                                        
        exec nvidia-xrun                                                        
    fi                                                                          
fi
