-- from ~/.config/palette.lua
local colors = require("palette").colors

local gruvbox = {
    "ellisonleao/gruvbox.nvim",

    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true

        require("gruvbox").setup({
            undercurl = false,
            underline = true,
            bold = true,
            italic = {
                strings = false,
                operators = false,
                comments = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = true,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {
                Comment = { fg = colors["green"] },
                String = { fg = colors["orange"] },
                Typedef = { fg = colors["bri yellow"], bold = false },
                Type = { fg = colors["blue"], bold = true },
                Special = { fg = colors["yellow"] },
                Number = { fg = colors["bri green"] },
                Function = { fg = colors["yellow"], bold = true },
                Macro = { fg = colors["bri magenta"]},
                Identifier = { fg = colors["fg"] },
                Structure = { fg = colors["blue"] },
                PreProc = { fg = colors["cyan"] },
                Include = { fg = colors["cyan"] },
                Define = { fg = colors["cyan"] },

                StatusLine = { fg = colors["bg"] },
                TabLineFill = { bg = colors["bg"] },
                TabLineSel = { bg = colors["bg"] },

                netrwDir = { fg = colors["blue"], bold = true },
                netrwSymLink = { fg = colors["cyan"] },
                netrwExe = { fg = colors["green"], bold = true },
                netrwMarkFile = { fg = colors["yellow"], bold = true },

                -- i hate undercurl
                GruvboxRedUnderline = { underline = true, undercurl = false },
                GruvboxGreenUnderline = { underline = true, undercurl = false },
                GruvboxYellowUnderline = { underline = true, undercurl = false },
                GruvboxBlueUnderline = { underline = true, undercurl = false },
                GruvboxPurpleUnderline = { underline = true, undercurl = false },
                GruvboxAquaUnderline = { underline = true, undercurl = false },
                GruvboxOrangeUnderline = { underline = true, undercurl = false },
            },
            dim_inactive = false,
            transparent_mode = true,
        })

        vim.cmd.colorscheme("gruvbox")
    end,
}

return gruvbox
