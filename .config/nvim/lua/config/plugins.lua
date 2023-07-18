-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Hello world!")
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
