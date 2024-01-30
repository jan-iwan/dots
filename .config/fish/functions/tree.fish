function tree
    eza --long --classify --binary --tree --color=always --group-directories-first --level=3 $argv |\
    bat --theme gruvbox-dark --plain
end
