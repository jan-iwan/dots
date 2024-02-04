local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("snippets.tex.utils")

return {
    -- square root
    s(
        { trig = "sr", snippetType = "autosnippet" },
        fmta([[\sqrt{<>}]], i(1)),
        { condition = tex.in_math, }
    ),

    -- square
    s(
        { trig = "sq", snippetType = "autosnippet", wordTrig = false },
        c(1, {
            t([[^2]]),
            fmta([[^{<>}]], i(1, "n")),
        }),
        { condition = tex.in_math, }
    ),

    s(
        { trig = "ee", snippetType = "autosnippet" },
        fmta([[e^{<>}]], i(1)),
        { condition = tex.in_math, }
    ),

    -- dot product
    s(
        { trig = "d.", snippetType = "autosnippet", wordTrig = false },
        t([[\cdot ]]),
        { condition = tex.in_math, }
    ),

    -- cross product / cartesian product
    s(
        { trig = "x.", snippetType = "autosnippet", wordTrig = false },
        t([[\times ]]),
        { condition = tex.in_math, }
    ),

    -- differential
    s(
        { trig = "df", snippetType = "autosnippet" },
        { t([[\dif ]]) },
        { condition = tex.in_math, }
    ),

    -- derivative
    s(
        { trig = "dv", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv{<>}{<>}]], { r(1, "fun"), r(2, "var", i(nil, "x")) }),
            fmta([[\dv{<>} <>]], { r(1, "var", i(nil, "x")), r(2, "fun") }),
        })
    ),
    -- nth derivative
    s(
        { trig = "ndv", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv[<>]{<>}{<>}]], { r(1, "order", i(nil, "2")), r(2, "fun"), r(3, "var", i(nil, "x")) }),
            fmta([[\dv[<>]{<>} <>]], { r(1, "order", i(nil, "2")), r(2, "var", i(nil, "x")), r(3, "fun") }),
        })
    ),

    -- partial derivative
    s(
        { trig = "dp", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv{<>}{<>}]], { r(1, "fun"), r(2, "var", i(nil, "x")) }),
            fmta([[\pdv{<>} <>]], { r(1, "var", i(nil, "x")), r(2, "fun") }),
        }),
        { condition = tex.in_math, }
    ),
    -- nth derivative
    s(
        { trig = "ndp", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv[<>]{<>}{<>}]], { r(1, "order", i(nil, "2")), r(2, "fun"), r(3, "var", i(nil, "x")) }),
            fmta([[\pdv[<>]{<>} <>]], { r(1, "order", i(nil, "2")), r(2, "var", i(nil, "x")), r(3, "fun") }),
        })
    ),

    -- partial derivative with subscript
    s(
        { trig = "ds", snippetType = "autosnippet", },
        c(1, {
            fmta([[\partial_{<>} ]], { r(1, "var", i(nil, "x")) }),
            fmta([[\partial^{<>}_{<>} ]], { i(1, "2"), r(2, "var", i(nil, "x")) }),
        }),
        { condition = tex.in_math, }
    ),

    -- dot derivative
    s(
        { trig = ".d", snippetType = "autosnippet", },
        t([[\dot]])
    ),

    -- nabla
    s(
        { trig = "/n", snippetType = "autosnippet", },
        { t([[\nabla ]]) },
        { condition = tex.in_math, }
    ),

    -- limits
    s(
        { trig = "lim", snippetType = "autosnippet", },
        fmta([[\lim_{<>\to <>} <>]], { i(1), i(2), i(3) }),
        { condition = tex.in_math, }
    ),

    -- integral
    s(
        { trig = "int", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\int <>]], { r(1, "integrand") }),
                fmta([[\int_{<>}^{<>} <>]], { i(1, "a"), i(2, "b"), r(3, "integrand") }),
            })
        },
        { condition = tex.in_math, }
    ),

    -- multiple integral
    s(
        { trig = "nint", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\int_{<>} <>]], { r(1, "domain"), r(2, "integrand") }),
                fmta([[\iint_{<>} <>]], { r(1, "domain"), r(2, "integrand") }),
                fmta([[\iiint_{<>} <>]], { r(1, "domain"), r(2, "integrand") }),
            })
        },
        { condition = tex.in_math, }
    ),

    -- closed integral
    s(
        { trig = "oint", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\oint_{<>} <>]], { r(1, "domain"), r(2, "integrand") }),
                fmta([[\oiint_{<>} <>]], { r(1, "domain"), r(2, "integrand") }),
                fmta([[\oiiint_{<>} <>]], { r(1, "domain"), r(2, "integrand") }),
            })
        },
        { condition = tex.in_math, }
    ),

    -- summation
    s(
        { trig = "su", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\sum_{<>}^{<>} <>]], { r(1, "bound"), i(2, "\\infty"), r(3, "sum") }),
                fmta([[\sum_{<>} <>]], { r(1, "bound"), r(2, "sum") }),
                fmta([[\sum <>]], { r(1, "sum") }),
            }),
        },
        { condition = tex.in_math, }
    ),

    -- complex conjugate
    s(
        { trig = "cj", snippetType = "autosnippet", },
        t([[\conj]]),
        { condition = tex.in_math, }
    ),

    -- subset
    s(
        { trig = "sst", snippetType = "autosnippet", wordTrig = false },
        t([[\subset]]),
        { condition = tex.in_mathzone, }
    ),
}
