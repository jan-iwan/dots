local function in_mathzone()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local snps = {
    -- inline math
    s(
    {
        trig = "mm",
        snippetType = "autosnippet",
    },
    fmta("$<>$ <>", { i(1), i(0) })
    ),

    -- fraction
    s({
        trig = "//",
        snippetType = "autosnippet",
    },
    fmta("\\frac{<>}{<>} <>", { i(1), i(2), i(0) }),
    {
        condition = in_mathzone,
    }
    ),

    -- subscript
    s({
        trig = ";-",
        wordTrig = false,
        snippetType = "autosnippet",
        
    },
    fmta("_{<>}", { i(1) }),
    {
        condition = in_mathzone,
    }
    ),

    -- superscript
    s({
        trig = ";6",
        wordTrig = false,
        snippetType = "autosnippet",
        
    },
    fmta("^{<>}", { i(1) }),
    {
        condition = in_mathzone,
    }
    ),

    -- environments
    s({
        trig = "new",
        snippetType = "autosnippet",
    },
    fmta(
    [[
    \begin{<>}
    <>
    \end{<>}

    ]],
    { i(1), i(2), rep(1)}
    ),
    {
        condition = line_begin,
    }
    )
}

return snps
