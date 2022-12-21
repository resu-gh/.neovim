N.cmd [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 200 }
    augroup END
]]
