local ok, _ = pcall(require, "gruvbox")

if not ok then
    return
end

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
    -- undercurl = undercurl,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        operators = false,
        comments = false,
        folds = false,
    }, strikethrough = true, invert_selection = true,
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

-- weird results if only set once
vim.cmd.colorscheme("gruvbox")
vim.cmd.colorscheme("gruvbox")
