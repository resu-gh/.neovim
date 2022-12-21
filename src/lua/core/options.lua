N.option.set.tabstop = 4
N.option.set.shiftwidth = 4
N.option.set.autoread = true
N.option.set.softtabstop = 4
N.option.set.textwidth = 100
N.option.set.undofile = true
N.option.set.expandtab = true
N.option.set.infercase = true
N.option.set.modeline = false
N.option.set.swapfile = false
N.option.set.autoindent = true
N.option.set.smartindent = true
N.option.set.complete = '.,w,b,u,t,k'
N.option.set.formatoptions = 'tcqjrnl' -- 'jcroql'
N.option.set.guicursor = ''

N.option.set.exrc = true
N.option.set.more = true
N.option.set.mouse = 'a'
N.option.set.magic = true
N.option.set.ruler = true
N.option.set.title = true
N.option.set.cmdheight = 2
N.option.set.hidden = true
N.option.set.matchtime = 2
N.option.set.modelines = 0
N.option.set.paste = false
N.option.set.secure = true
N.option.set.backup = false
N.option.set.history = 1000
N.option.set.laststatus = 2
N.option.set.showcmd = true
N.option.set.ttyfast = true
N.option.set.showtabline = 2
N.option.set.smarttab = true
N.option.set.wildmenu = true
N.option.set.hlsearch = false
N.option.set.incsearch = true
N.option.set.showmatch = true
N.option.set.showmode = false
N.option.set.smartcase = true
N.option.set.timeoutlen = 500
N.option.set.updatetime = 50
N.option.set.autowrite = false
N.option.set.ignorecase = true
N.option.set.lazyredraw = false -- (noice)
N.option.set.shiftround = true
N.option.set.splitbelow = true
N.option.set.splitright = true
N.option.set.compatible = false
N.option.set.encoding = 'utf-8'
N.option.set.errorbells = false
N.option.set.visualbell = false
N.option.set.background = 'dark'
N.option.set.writebackup = false
N.option.set.termguicolors = true
N.option.set.inccommand = 'nosplit'
N.option.set.fileencodings = 'utf-8'
N.option.set.fileformats = 'unix,mac,dos'
N.option.set.clipboard = 'unnamedplus'
N.option.set.backspace = 'indent,eol,start'
N.option.set.wildmode = 'longest:full,full'
N.option.set.shortmess = 'atIc' -- 'filnxtToOF'
N.option.set.undodir = N.fn.stdpath 'data' .. '/.undodir'

N.option.set.diffopt = { 'internal' }
N.option.set.diffopt:append { 'filler' }
N.option.set.diffopt:append { 'iwhite' }
N.option.set.diffopt:append { 'closeoff' }
N.option.set.diffopt:append { 'vertical' }
N.option.set.diffopt:append { 'hiddenoff' }
N.option.set.diffopt:append { 'algorithm:patience' }

N.option.set.list = false
N.option.set.wrap = false
N.option.set.number = true
N.option.set.scrolloff = 8
N.option.set.foldlevel = 99
N.option.set.numberwidth = 4
N.option.set.conceallevel = 0
N.option.set.foldcolumn = '1'
N.option.set.linebreak = true
N.option.set.colorcolumn = '0'
N.option.set.cursorline = true
N.option.set.foldenable = true
N.option.set.sidescrolloff = 5
N.option.set.breakindent = true
N.option.set.signcolumn = 'yes'
N.option.set.foldmethod = 'expr'
N.option.set.relativenumber = true
N.option.set.foldexpr = 'ntreesitter#foldexpr()'

local statusline = ' '
statusline = statusline .. '[%n]'
statusline = statusline .. '[%F]'
statusline = statusline .. '(%{get(b:, "gitsigns_head","")})'
statusline = statusline .. '(%{get(b:, "gitsigns_status","")})'
statusline = statusline .. '%='
statusline = statusline .. '%m'
statusline = statusline .. '%r'
statusline = statusline .. '%h'
statusline = statusline .. '%w'
statusline = statusline .. '[%{&fenc?&fenc:&enc}]'
statusline = statusline .. '[%{&ff}]'
statusline = statusline .. '%y'
statusline = statusline .. '[%l:%v]'
statusline = statusline .. '[%p%%]'
statusline = statusline .. ' '
N.option.set.statusline = statusline
