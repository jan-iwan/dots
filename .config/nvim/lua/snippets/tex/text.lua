local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("snippets.utils.tex")
local utils = require("snippets.utils")

return {
    s(
        { trig = "italic", dscr = "Italic" },
        fmta([[
        \textit{<>}
        ]], d(1, utils.get_selection)),
        { condition = tex.in_text }
    ),

    s(
        { trig = "bold", dscr = "Italic" },
        fmta([[
        \textbf{<>}
        ]], d(1, utils.get_selection)),
        { condition = tex.in_text }
    ),
}
