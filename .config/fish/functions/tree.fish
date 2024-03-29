function tri --description "Show tree view of directories, by default up to 3
    levels of depth"
    eza \
        --long \
        --classify \
        --binary \
        --tree \
        --color=always \
        --group-directories-first \
        --level=3 \
        $argv |\

    bat --plain
end
