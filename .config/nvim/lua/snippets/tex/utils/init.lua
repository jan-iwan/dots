-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local events = require("luasnip.util.events")
-- local r = require("luasnip.extras").rep
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta

M = {}

function M.in_math()
    local mat = vim.fn["vimtex#syntax#in_mathzone"]()
    print(mat)
    return mat == 1
end

function M.out_math()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

function M.comment()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

function M.in_env(name)
    -- VimTex returns the line and column of the '\begin{env}'.
    -- If the cursor is outside of an environment it returns ("0", "0").
    local line, col = unpack(vim.fn["vimtex#env#is_inside"](name))
    return line ~= "0" and col ~= "0"
end

function M.in_preamble()
    return not M.in_env("document")
end

function M.in_text()
	return M.in_env("document") and not M.in_math()
end

return M
