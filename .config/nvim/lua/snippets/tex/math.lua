local function in_mathzone()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

-- create latex environments
local function new_env(name, label)
    if label == nil then
        return fmta(string.format([[
        \begin{%s}
            <>
        \end{%s}

        ]], name, name), i(1))
    else
        return fmta(string.format([[
        \begin{%s}
            <>
            \label{%s:<>}
        \end{%s}

        ]], name, label, name), { i(2), i(1) })
    end
end

local snips = {
    -- inline math
    s(
        { trig = "mm", snippetType = "autosnippet", },
        fmta("$<>$ <>", { i(1), i(0) })
    ),

    -- fraction
    s(
        { trig = "//", snippetType = "autosnippet", },
        fmta([[\\frac{<>}{<>}]], { i(1), i(2) }),
        { condition = in_mathzone, }
    ),

    -- derivative
    s(
        { trig = "/d", snippetType = "autosnippet", },
        fmta([[\\frac{<>}{<>}]], { i(1), i(2) }),
        { condition = in_mathzone, }
    ),

    -- partial derivative
    s(
        { trig = "/p", snippetType = "autosnippet", },
        fmta([[\frac{\partial <>}{\partial <>}]], { i(1), i(2) }),
        { condition = in_mathzone, }
    ),

    -- partial derivative with subscript
    s(
        { trig = "/s", snippetType = "autosnippet", },
        fmta([[\partial_<> <>]], { i(1), i(2) }),
        { condition = in_mathzone, }
    ),

    -- nabla
    s(
        { trig = "/n", snippetType = "autosnippet", },
        { t([[\nabla ]]) },
        { condition = in_mathzone, }
    ),

    -- subscript
    s(
        { trig = ";-", wordTrig = false, snippetType = "autosnippet", },
        fmta("_{<>}", { i(1) }),
        { condition = in_mathzone, }
    ),

    -- superscript
    s(
        { trig = ";6", wordTrig = false, snippetType = "autosnippet", },
        fmta("^{<>}", { i(1) }),
        { condition = in_mathzone, }
    ),

    -- limits
    s(
        { trig = "lim", snippetType = "autosnippet", },
        fmta([[\lim_{<>\to <>} <>]], { i(1), i(2), i(3) }),
        { condition = in_mathzone, }
    ),

    -- integral
    -- s(
    --     { trig = "int", snippetType = "autosnippet", },
    --     -- fmta([[\int_{<>}^{<>} <>]], { i(1), i(2), i(3) }),
    --     { t([[\int]]), c(1, { t("_{}") }) }
    --     { condition = in_mathzone, }
    -- ),

    -- environments
    s(
        { trig = "new", snippetType = "autosnippet", },
        fmta([[
        \begin{<>}
            <>
        \end{<>}

        ]], { i(1), i(2), rep(1)}),
        { condition = line_begin, }
    ),

    s(
        { trig = "=eq", snippetType = "autosnippet", },
        new_env("equation", "eq")
    ),

    s(
        { trig = "=di", snippetType = "autosnippet", },
        new_env("displaymath")
    ),

    s(
        { trig = "=ga", snippetType = "autosnippet", },
        new_env("gather*")
    ),

    s(
        { trig = "=al", snippetType = "autosnippet", },
        new_env("align*")
    ),

    s(
        { trig = "=mat", snippetType = "autosnippet", },
        new_env("bmatrix*")
    ),

}

return snips
