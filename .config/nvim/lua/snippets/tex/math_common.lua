local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("snippets.tex.utils")

return {
    -- inline math
    s(
        { trig = "mm", snippetType = "autosnippet", },
        fmta("$<>$ <>", { i(1), i(0) })
    ),

    -- fraction
    s(
        { trig = "//", snippetType = "autosnippet", },
        fmta([[\\frac{<>}{<>}]], { i(1), i(2) }),
        { condition = tex.in_mathzone, }
    ),

    -- subscript
    s(
        { trig = "__", wordTrig = false, snippetType = "autosnippet", },
        fmta("_{<>}", { i(1) }),
        { condition = tex.in_mathzone, }
    ),

    -- superscript
    s(
        { trig = "^^", wordTrig = false, snippetType = "autosnippet", },
        fmta("^{<>}", { i(1) }),
        { condition = tex.in_mathzone, }
    ),

    -- infinity
    s(
        { trig = "fi", snippetType = "autosnippet", },
        t([[\infty]]),
        { condition = tex.in_mathzone, }
    ),

    -- function definition
    s(
        { trig = "fun", snippetType = "autosnippet", },
        fmta([[<>:<>\to <>]], { i(1, "f"), i(2, "\\reals"), i(3, "\\reals")} ),
        { condition = tex.in_mathzone, }
    ),
}
