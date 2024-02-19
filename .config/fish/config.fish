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

## environment variables ##
export (envsubst < $HOME/.config/environment.d/env.conf )
