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
                Comment = { fg = "#98971a" },
                String = { fg = "#d65d0e" },
                Typedef = { fg = "#fabd2f", bold = false },
                Type = { fg = "#458588", bold = true },
                Special = { fg = "#d79921" },
                Number = { fg = "#b8bb26" },
                Function = { fg = "#d79921", bold = true },
                Macro = { fg = "#d3869b"},
                Identifier = { fg = "#d5c4a1" },
                Structure = { fg = "#458588" },
                PreProc = { fg = "#689d6a" },
                Include = { fg = "#689d6a" },
                Define = { fg = "#689d6a" },

                StatusLine = { fg = "#1d2021" },
                TabLineFill = { bg = "#1d2021" },
                TabLineSel = { bg = "#1d2021" },

                netrwDir = { fg = "#458588", bold = true },
                netrwSymLink = { fg = "#689d6a" },
                netrwExe = { fg = "#98971a", bold = true },
                netrwMarkFile = { fg = "#d79921", bold = true },

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
