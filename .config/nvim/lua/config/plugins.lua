-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("<insert>Hello world!<Esc>:wq<cr>")

    -- color before installing colorscheme
    -- vim.opt.termguicolors = false
    -- vim.cmd([[
    -- hi SignColumn NONE
    -- hi CursorLine ctermbg=0 cterm=NONE
    -- hi StatusLine NONE
    -- hi NormalFloat ctermbg=0
    -- hi TabLineFill NONE
    -- hi TabLineSel NONE
    -- ]])
    --
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- open lazy menu
vim.keymap.set("n", "<leader>P", vim.cmd.Lazy)

-- lazy.nvim options
local opts = {
    install = {
        -- i prefer the default
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
    -- performance = {
    --     rtp = {
    --         disabled_plugins = { "telescope" }
    --     }
    -- }
}

require("lazy").setup("plugins", opts)
