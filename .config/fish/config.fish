if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x fish_greeting 
    if [ "$TERM" = "linux" ]
        setterm --blank=10
        set -l colorscheme "$HOME/.local/bin/gruvbox"
        if type -q $colorscheme
            $colorscheme
        end
    end
end

	## variables ##
fish_add_path $HOME/.local/bin
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DESKTOP_DIR "$HOME/"
set -xU MANPAGER "less -R --use-color -Dd+r -Du+b"
set -xU MANROFFOPT "-P -c"
# set -x LIBVIRT_DEFAULT_URI "qemu:///system"
