if [[ -z  "$DISPLAY" ]] && [ "$XDG_VTNR" = 1 ]; then
~/C-Program/LoginMessage/C &
exec startx &> $HOME/.Xerror.log
else
	~/C-Program/LoginMessage/C &
fi

# Created by `pipx` on 2024-05-13 16:21:23
export PATH="$PATH:/home/aleksic/.local/bin"
