local line_begin = require("luasnip.extras.expand_conditions").line_begin
local utils = require("snippets.utils")
local ts = require("snippets.utils.ts")

local brackets = {
	p = { "(", ")" },
    v = { "\\lVert", "\\rVert" },
	a = { "\\langle", "\\rangle" },
	A = { "Angle", "Angle" },
	b = { "brack", "brack" },
	B = { "Brack", "Brack" },
	c = { "brace", "brace" },
	m = { "|", "|" },
}

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
        { condition = ts.in_math, }
    ),

    -- subscript
    s(
        { trig = "__", wordTrig = false, snippetType = "autosnippet", },
        fmta("_{<>}", { i(1) }),
        { condition = ts.in_math, }
    ),

    -- superscript
    s(
        { trig = "^^", wordTrig = false, snippetType = "autosnippet", },
        fmta("^{<>}", { i(1) }),
        { condition = ts.in_math, }
    ),

    -- infinity
    s(
        { trig = "fi", snippetType = "autosnippet", },
        t([[\infty]]),
        { condition = ts.in_math, }
    ),

    -- function definition
    s(
        { trig = "fun", snippetType = "autosnippet", },
        fmta([[<>:<>\to <>]], { i(1, "f"), i(2, "\\reals"), i(3, "\\reals")} ),
        { condition = ts.in_math, }
    ),

    -- delimiters. e.g. \left( \right)
    s(
        { trig = "lr([aAbBcmp])", regTrig = true, snippetType = "autosnippet" },
        fmta([[
        \left<> <> \right<>
        ]],{
            f(function(_, snip)
                local cap = snip.captures[1] or "p"
                return brackets[cap][1]
            end),
            d(1, utils.get_selection),
            f(function(_, snip)
                local cap = snip.captures[1] or "p"
                return brackets[cap][2]
            end),
        }),
        { condition = ts.in_math, }
    ),
}
