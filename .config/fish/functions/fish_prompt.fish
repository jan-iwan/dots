function fish_prompt
    printf (set_color green)(prompt_pwd)" "

    if test -n "$SSH_TTY"
        printf (set_color yellow)"z "
    else
        printf (set_color green)"⡢ "
    end

    set_color normal
end
