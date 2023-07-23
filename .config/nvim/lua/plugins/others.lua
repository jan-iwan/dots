local plugins = {
    {
        "tpope/vim-fugitive",
        keys = {{ "<leader>gs", vim.cmd.Git }, desc = "git" },
    },

    -- undo history
    {
        "mbbill/undotree",
        keys = {{ "<leader>u", vim.cmd.UndotreeToggle }, desc = "undo tree" },
    },

    -- comment stuff
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "InsertEnter" },
        opts = {},
    },

    -- notetaking with markdow >:)
    {
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
            -- open external files with the "vfile:" scheme
            -- e.g. [[vfile:~/example|example file]]
            -- if the file is a pdf, open it in zathura
            -- (i use a different config file for my latex pdfs)
            -- a little bit of vimscript doesn't hurt
            vim.cmd([[
            function! VimwikiLinkHandler(link)
            let link = a:link
            if link =~# '^vfile:'
                let link = link[1:]
            else
                return 0
            endif
            let file = vimwiki#base#resolve_link(link).filename
            if file == ''
                echomsg 'Vimwiki Error: Unable to resolve link!'
                return 0
            else
                let extension = substitute(file, '.*\.', '', '')
                if extension ==# 'pdf'
                    silent execute '!zathura' "--fork -c ~/.config/zathura/zathurarc-latex" file
                else
                    exe 'tabnew ' . fnameescape(file)
                endif
                return 1
            endif
            endfunction
            ]])
            end,
    },
}

return { plugins }
