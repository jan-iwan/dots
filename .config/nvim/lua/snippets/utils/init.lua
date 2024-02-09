local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

M = {}

function M.get_selection(_, parent)
    local selected = parent.snippet.env.SELECT_RAW
    if #selected > 0 then
        return sn(nil, i(1, selected))
    else
        return sn(nil, i(1))
    end
end

return M
