if [[ -z  "$DISPLAY" ]] && [ "$XDG_VTNR" = 1 ]; then
~/C-Program/LoginMessage/C
exec startx
else
	~/C-Program/LoginMessage/C
fi
