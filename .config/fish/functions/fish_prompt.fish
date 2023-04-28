function fish_prompt
    printf (set_color green)(prompt_pwd)" "

    if [ $TERM != "linux" ]
        printf (set_color green)"⡢ "
    else
        printf (set_color green)"z "
    end

    set_color normal
end
