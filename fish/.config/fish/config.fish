if test (tty) = "/dev/tty1"
	exec sway
end

if status is-interactive && not set -q TMUX
	# Vars
	export EDITOR=nvim
	export hydro_color_pwd=green
	export PATH=/usr/bin/:/opt/jdk-18.0.2/bin/:/usr/bin/idea/bin/:/home/skill/.local/bin/

	tmux new-session -A -s main
	kill $KITTY_PID
end

function y
    set tmp (mktemp -t yazi-cwd.XXXXX)
    yazi $argv --cwd-file=$tmp
    if set cwd (cat -- $tmp); and test -n "$cwd"; and test "$cwd" != "$PWD"
        cd -- $cwd
    end
    rm -f -- $tmp
end
