function tree
    eza -alb --tree --color always --group-directories-first --level=3 $argv |\
    bat --theme gruvbox-dark --plain
end
