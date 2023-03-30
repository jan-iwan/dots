-- highlight yank, autoresize window, etc

vim.cmd [[
    augroup _sitelen_wawa
        autocmd!
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
        autocmd BufWinEnter * :set formatoptions-=cro
    augroup end

    augroup _auto_resize
        autocmd!
        autocmd VimResized * tabdo wincmd = 
    augroup end

    augroup _markdown
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spelllang=en,es
        autocmd FileType markdown setlocal spell
    augroup end

    augroup _git
        autocmd!
        autocmd FileType gitcommit setlocal wrap
        autocmd FileType gitcommit setlocal spell
    augroup end
]]
