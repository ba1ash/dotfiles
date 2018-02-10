xrandr --dpi 220
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
setxkbmap -layout us,ru
setxkbmap -option 'grp:ctrl_alt_toggle'
export TERMINAL=alacritty
exec i3
