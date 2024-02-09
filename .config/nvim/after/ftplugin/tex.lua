vim.cmd("setlocal spelllang=en,es")
vim.cmd("setlocal spell")

-- automatically insert "\item" in newline when inside of itemize or enumerate
local function new_item()
    local in_itemize = vim.fn.searchpair( "begin{itemize}", "", "end{itemize}")
    local in_enumerate = vim.fn.searchpair( "begin{enumerate}", "", "end{enumerate}")

    if in_itemize + in_enumerate > 0 then
        return "\r\\item "
    else
        return "\r"
    end
end

vim.keymap.set("i", "<CR>", new_item, { buffer = true, expr = true })
