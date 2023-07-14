#!/bin/bash

# Configruacion del teclado en español
setxkbmap latam &

# Configuracion Pantalla

#~/.screenlayout/Monitor_casa.sh
#xlayoutdisplay -p HDMI-1-2 -o HDMI-1-2 -o eDP1 &

# teclas 
xbindkeys & 

# Iconos 
udiskie -t &
nm-applet & 
blueberry-tray &
#volumeicon &
cbatticon -u 5 & 

# Cargar Wallpapper
nitrogen --restore &

# Picom 
picom &
/usr/bin/dunst &
