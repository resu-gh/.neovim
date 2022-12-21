N.keymap.set('', '<Space>', '<Nop>', N.keymap.opts 'ns')
N.keymap.set({ 'n', 'i' }, '<F1>', '<Nop>', N.keymap.opts 'ns')
N.keymap.set({ 'n', 'i', 'v' }, '<C-j>', '<Nop>', N.keymap.opts 'ns')
N.keymap.set({ 'n', 'i', 'v' }, '<C-k>', '<Nop>', N.keymap.opts 'ns')
N.keymap.set({ 'n', 'i', 'v' }, '<C-n>', '<Nop>', N.keymap.opts 'ns')
N.keymap.set({ 'n', 'i', 'v' }, '<C-p>', '<Nop>', N.keymap.opts 'ns')
N.keymap.set({ 'n', 'v' }, 'H', '^', N.keymap.opts 'ns')
N.keymap.set({ 'n', 'v' }, 'L', 'g_', N.keymap.opts 'ns')

N.keymap.set('i', ' ', ' <C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '!', '!<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '(', '(<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', ')', ')<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', ',', ',<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '.', '.<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '<', '<<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '?', '?<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '[', '[<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', ']', ']<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '{', '{<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '}', '}<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '_', '_<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '@', '@<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '#', '#<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '$', '$<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '%', '%<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '~', '~<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '|', '|<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '^', '^<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '&', '&<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '*', '*<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '+', '+<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '-', '-<C-g>u', N.keymap.opts 'ns')
N.keymap.set('i', '=', '=<C-g>u', N.keymap.opts 'ns')

N.keymap.set('n', 'Q', '@q', N.keymap.opts 'ns')

N.keymap.set('n', 'J', 'mzJ`z', N.keymap.opts 'ns')

N.keymap.set('n', 'n', 'nzzzv', N.keymap.opts 'ns')
N.keymap.set('n', 'N', 'Nzzzv', N.keymap.opts 'ns')

N.keymap.set('n', 'p', 'mpp`p', N.keymap.opts 'ns')
N.keymap.set('n', 'P', 'mPP`P', N.keymap.opts 'ns')

N.keymap.set('n', 'U', '<C-r>', N.keymap.opts 'ns')

N.keymap.set('n', '<C-h>', '<C-w>W', N.keymap.opts 'ns')
N.keymap.set('n', '<C-l>', '<C-w>w', N.keymap.opts 'ns')

N.keymap.set('n', '<Leader>q', N.cmd.q, N.keymap.opts 'ns')

N.keymap.set('n', '<Leader>w', N.cmd.w, N.keymap.opts 'ns')

N.keymap.set('n', 'yp', 'yymap`aj:delmarks a<CR>', N.keymap.opts 'ns')
N.keymap.set('n', 'yP', 'yymaP`ak:delmarks a<CR>', N.keymap.opts 'ns')

N.keymap.set('n', '<CR>', ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", N.keymap.opts 'ns')

N.keymap.set('n', '<C-d>', '<C-d>zz', N.keymap.opts 'ns')
N.keymap.set('n', '<C-u>', '<C-u>zz', N.keymap.opts 'ns')

N.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", N.keymap.opts 'nsx')
N.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", N.keymap.opts 'nsx')

N.keymap.set('n', '<Tab>', N.cmd.bn, N.keymap.opts 'ns')
N.keymap.set('n', '<S-Tab>', N.cmd.bp, N.keymap.opts 'ns')
N.keymap.set('n', '<BS>', N.cmd.bd, N.keymap.opts 'ns')

N.keymap.set({ 'n', 'v' }, '<Leader>d', '"_d')

N.keymap.set('v', '<', '<gv', N.keymap.opts 'ns')
N.keymap.set('v', '>', '>gv', N.keymap.opts 'ns')

N.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", N.keymap.opts 'ns')
N.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", N.keymap.opts 'ns')

N.keymap.set('v', 'j', "v:count == 0 ? 'gj' : 'j'", N.keymap.opts 'nsx')
N.keymap.set('v', 'k', "v:count == 0 ? 'gk' : 'k'", N.keymap.opts 'nsx')

N.keymap.set('x', '<CR>', '"sy:let @/=@s<CR>cgn', N.keymap.opts 'ns')
N.keymap.set('x', '<Leader>p', '"_dP')

N.keymap.set('!', '<C-BS>', '<C-w>', N.keymap.opts 'ns')
N.keymap.set('!', '<C-h>', '<C-w>', N.keymap.opts 'ns')
