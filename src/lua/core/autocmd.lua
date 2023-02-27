N.autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = N._augroup 'checktime',
    command = 'checktime',
})

N.autocmd('TextYankPost', {
    group = N._augroup 'highlight_yank',
    callback = function() N.highlight.on_yank { timeout = 200 } end,
})

N.autocmd('VimResized', {
    group = N._augroup 'resize_splits',
    callback = function() N.cmd 'tabdo wincmd =' end,
})

N.autocmd('BufReadPost', {
    group = N._augroup 'last_loc',
    callback = function()
        local mark = N.api.nvim_buf_get_mark(0, '"')
        local lcount = N.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then pcall(N.api.nvim_win_set_cursor, 0, mark) end
    end,
})

N.autocmd('FileType', {
    group = N._augroup 'close_with_q',
    pattern = {
        'qf',
        'help',
        'man',
        'notify',
        'lspinfo',
        'spectre_panel',
        'startuptime',
        'tsplayground',
    },
    callback = function(e)
        N.bo[e.buf].buflisted = false
        N.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = e.buf, silent = true })
    end,
})

N.autocmd('FileType', {
    group = N._augroup 'wrap_spell',
    pattern = {
        'gitcommit',
        'markdown',
    },
    callback = function()
        N.opt_local.wrap = true
        N.opt_local.spell = true
    end,
})
