-- notetaking with markdow >:)
local vimwiki = {
    "vimwiki/vimwiki",

    cmd = { "VimwikiIndex" },

    init = function()
        vim.g.vimwiki_list = {{
            path = "~/Documents/notes/",
            syntax = "markdown",
            ext = ".md"
        }}
    end,

    config = function()
        -- i have defined three special schemes, 'vim:', 'tex:' and 'pdf:'
    -- 'vim:' opens a file in a new buffer
    -- 'tex:' opens a .tex file from a latex directory
    -- 'pdf:' opens a pdf from a latex directory with zathura
    -- e.g. [[vim:~/src/python/script.py]]
    -- eg. [[tex:main]], opens 'main.tex'
    -- eg. [[pdf:some_document]], opens 'some_document.pdf'
    vim.cmd([[
    function! VimwikiLinkHandler(link)
    " a little bit of poorly written vimscript doesn't hurt
    " i will do this properly in the future i promise

    " latex files are in '~/Documents/latex/<project>/'
    " where <project> is the same as the current directory
    let latex_prefix = "~/Documents/latex/" . expand('%:p:h:t') . "/"

    let link = a:link
    " check for the schemes i have defined
    if link =~# '\(^vim\|^tex\|^pdf\):'
        let scheme = substitute(link, ':.*', '', '')
        let link = substitute(link, '.*:', '', '')
    else
        " any other scheme (e.g "file:" or "local:")
        " use default vimwiki handler (uses xdg-open)
        return 0
    endif

    " handle tex and pdf particularly
    " prepend latex directory and use scheme as file extension
    if scheme =~# 'tex\|pdf'
        " "tex:dir" should open the directory instad of a file
        if link ==# 'dir'
            let link = latex_prefix
        else
            let link = latex_prefix . link . "." . scheme
        endif
    endif

    " resolve absolute path, vimwiki needs the "file:" scheme
    let file = vimwiki#base#resolve_link('file:' . link).filename

    if file == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    else
        " if directory doesn't exist, ask for creation
        let dir = fnamemodify(file, ':h')
        if !isdirectory(dir)
            echomsg 'Vimwiki: Make new directory: ' . dir
            let response = input('[y]es/[N]o?')
            if response ==# 'yes' || response ==# 'y'
                call mkdir(dir, 'p')
            else
                return 1
            endif
        endif

        if scheme ==# 'pdf'
            " open pdf in zathura, "--fork" so  that vim doesn't freeze
            " "-c" since i use a different config in this case
            let file = '"' . file . '"'
            silent execute '!zathura' '--fork -c ~/.config/zathura/latex' file
        else
            " open files with vim
            exe 'tabnew ' . fnameescape(file)
        endif

        " success
        return 1
    endif
    endfunction
    ]])
    end,
}

return vimwiki
