local colors = {
    ["black"] = "#263640",
    ["red"] = "#cc241d",
    ["green"] = "#98971a",
    ["yellow"] = "#d79921",
    ["blue"] = "#458588",
    ["magenta"] = "#b16282",
    ["cyan"] = "#689d6a",
    ["white"] = "#a89984",
    ["orange"] = "#d65d0e",

    ["bri black"] = "#4a697d",
    ["bri red"] = "#fb4934",
    ["bri green"] = "#b8bb26",
    ["bri yellow"] = "#fabd2f",
    ["bri blue"] = "#83a598",
    ["bri magenta"] = "#d3869b",
    ["bri cyan"] = "#8ec07c",
    ["bri white"] = "#f9f5d7",
    ["bri orange"] = "#fe8019",

    ["dim black"] = "#3c3836",
    ["dim red"] = "#9d0006",
    ["dim green"] = "#79740e",
    ["dim yellow"] = "#b57614",
    ["dim blue"] = "#076678",
    ["dim magenta"] = "#8f3f71",
    ["dim cyan"] = "#327b58",
    ["dim white"] = "#928374",
    ["dim orange"] = "#af3a03",

    ["bg"] = "#1d2021",
    ["fg"] = "#ebdbb2",

    ["bri bg"] = "#504945",
    ["bri fg"] = "#fbf1c7",

    ["dim bg"] = "#282828",
    ["dim fg"] = "#bdae93",

    ["alt bg"] = "#32302f",
    ["alt fg"] = "#d5c4a1",
}

local gruvbox = {
    "ellisonleao/gruvbox.nvim",

    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true

        require("gruvbox").setup({
            undercurl = false,
            italic = {
                strings = false,
                operators = false,
                comments = false,
                folds = false,
            },
            invert_selection = true,
            contrast = "hard", -- can be "hard", "soft" or empty string

            overrides = {
                Comment = { fg = colors["green"] },
                String = { fg = colors["orange"] },
                Typedef = { fg = colors["bri yellow"], bold = false },
                Type = { fg = colors["blue"], bold = true },
                Special = { fg = colors["yellow"] },
                Number = { fg = colors["bri green"] },
                Function = { fg = colors["yellow"], bold = true },
                Macro = { fg = colors["bri magenta"] },
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

                -- i hate undercurl, i really do :)
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
