local utils = require("snippets.utils")
local tex = require("snippets.utils.tex")

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
            \label{%s:<>}
            <>
        \end{%s}
        ]], name, label, name), { i(2), i(1) })
    end
end

return {
    s(
        { trig = "lab", },
        fmta([[
        \label{<>:<>}
        ]], { i(1), i(2) }
        )
    ),

    s(
        { trig = "document", },
        fmta([[
        \begin{document}
        <>
        \end{document}
        ]], { i(0) }),
        { condition = utils.line_begin, }
    ),

    -- any environment
    s(
        { trig = "==", snippetType = "autosnippet", },
        fmta([[
        \begin{<>}
            <>
        \end{<>}

        ]], { i(1), i(2), rep(1)}),
        { condition = utils.line_begin, }
    ),

    -- common environments
    s(
        { trig = "=e", snippetType = "autosnippet", },
        new_env("equation", "eq"),
        { confition = tex.in_text }
    ),

    s(
        { trig = "=d", snippetType = "autosnippet", },
        new_env("displaymath"),
        { confition = tex.in_text }
    ),

    s(
        { trig = "=g", snippetType = "autosnippet", },
        new_env("gather*"),
        { confition = tex.in_text }
    ),

    s(
        { trig = "=a", snippetType = "autosnippet", },
        new_env("align*"),
        { confition = tex.in_text }
    ),

    s(
        { trig = "=m", snippetType = "autosnippet", },
        new_env("bmatrix"),
        { condition = tex.in_math, }
    ),

    s(
        { trig = "=c", snippetType = "autosnippet", },
        new_env("cases"),
        { condition = tex.in_math, }
    ),

    -- thoerem
    s(
        { trig = "=t", snippetType = "autosnippet", },
        {
            c(1, {
                new_env("theorem"),
                new_env("theorem", "thm"),
            })
        },
        { confition = tex.in_text }
    ),

    s(
        { trig = "=i", snippetType = "autosnippet", },
        fmta([[
        \begin{itemize}
            \item<>
        \end{itemize}
        ]], {
            c(1, {
                fmta("<><>", { t(" "), r(1, "item") }),
                fmta("[<>] <>", { i(1), r(2, "item") })
            })
        }),
        { confition = utils.line_begin }
    ),

    s(
        { trig = "=n", snippetType = "autosnippet", },
        fmta([[
        \begin{enumerate}<>
            \item<>
        \end{enumerate}
        ]], {
            c(1, {
                t(""),
                fmta([[
                [label=(\<>*)]
                ]], c(1, {
                    t("roman"), t("Roman"), t("alph"), t("Alph"), i(1)
                })),
            }),
            c(2, {
                fmta("<><>", { t(" "), r(1, "item") }),
                fmta("[<>] <>", { i(1), r(2, "item") })
            })
        }),
        { confition = utils.line_begin }
    ),
}
