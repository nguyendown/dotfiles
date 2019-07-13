#
# ~/.bash_profile
#
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx -- -dpi 96 -ardelay 150 -arinterval 20 > /dev/null 2>&1
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
