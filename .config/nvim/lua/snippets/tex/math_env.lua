local line_begin = require("luasnip.extras.expand_conditions").line_begin

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
        { trig = "document", },
        fmta([[
        \begin{document}
        <>
        \end{document}
        ]], { i(0) })
    ),

    -- any environment
    s(
        { trig = "==", snippetType = "autosnippet", },
        fmta([[
        \begin{<>}
            <>
        \end{<>}

        ]], { i(1), i(2), rep(1)}),
        { condition = line_begin, }
    ),

    -- common environments
    s(
        { trig = "=e", snippetType = "autosnippet", },
        new_env("equation", "eq")
    ),

    s(
        { trig = "=d", snippetType = "autosnippet", },
        new_env("displaymath")
    ),

    s(
        { trig = "=g", snippetType = "autosnippet", },
        new_env("gather*")
    ),

    s(
        { trig = "=a", snippetType = "autosnippet", },
        new_env("align*")
    ),

    s(
        { trig = "=m", snippetType = "autosnippet", },
        new_env("bmatrix")
    ),

    s(
        { trig = "=c", snippetType = "autosnippet", },
        new_env("cases")
    ),

    -- thoerem
    s(
        { trig = "=t", snippetType = "autosnippet", },
        {
            c(1, {
                new_env("theorem"),
                new_env("theorem", "thm"),
            })
        }
    ),
}
