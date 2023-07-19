-- declare lazy.nvim options before doing anything
local opts = {
    install = {
        -- if gruvbox is not available, use default
        colorscheme = { "gruvbox", "default" },
    },
    ui = {
        -- i don't like icons
        icons = {
            cmd = "[cmd]",
            config = "[cfg]",
            event = "[event]",
            ft = "[filetype]",
            init = "[init]",
            keys = "[keys]",
            plugin = "[depend]",
            runtime = "[rt]",
            source = "[src]",
            start = "[start]",
            task = "[task]",
            lazy = "[lazy]",
            import = "[import]",
            loaded = "ok",
            not_loader = "no",
            list = {
                "o",
                "->",
                "*",
                "-",
            },
        },
    },
}

-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- check if lazy is installed
if vim.loop.fs_stat(lazypath) then
    -- open lazy menu
    vim.keymap.set("n", "<leader>P", vim.cmd.Lazy)

    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup("plugins", opts)

    return

else
    -- if lazy is not installed don't install it right away,
    -- if there was no internet connection that would make nvim unusable
    function install()
        print("Installing lazy.nvim!")

        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })

        vim.opt.rtp:prepend(lazypath)
        require("lazy").setup("plugins", opts)
    end

    -- some highlights for when there is no colorscheme
    vim.opt.termguicolors = false
    vim.cmd([[
    hi SignColumn NONE
    hi CursorLine ctermbg=0 cterm=NONE
    hi CursorLineNr ctermbg=0 cterm=NONE
    hi StatusLine NONE
    hi TabLineFill NONE
    hi TabLineSel NONE
    ]])

    -- same as `:lua install`
    vim.keymap.set("n", "<leader>P", install)

    print("<insert>Hello world!<Esc>:wq<cr> Run `:lua install()` to install plugins.")
end
