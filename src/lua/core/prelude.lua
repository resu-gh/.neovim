N = vim

N.builtin = {}
N.builtin.disable = function(b) N.g['loaded' .. b] = 1 end

N.option = {}
N.option.set = N.opt

N.keymap.opts = function(o)
    return {
        remap = not string.find(o, 'n') and true or false,
        silent = string.find(o, 's') and true or false,
        expr = string.find(o, 'x') and true or false,
    }
end

N.manager = {}

N.manager.path = N.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

N.manager.repo = 'https://github.com/wbthomason/packer.nvim'

N.manager.boot = nil

N.manager.download = function()
    if N.fn.empty(N.fn.glob(N.manager.path)) > 0 then
        N.manager.boot = N.fn.system {
            'git',
            'clone',
            '--depth',
            '1',
            N.manager.repo,
            N.manager.path,
        }
    end
end

N.manager.config = {
    display = {
        open_fn = function()
            return require('packer.util').float {
                border = 'none',
            }
        end,
    },
    profile = {
        enable = true,
        threshold = 0,
    },
}

N.plugin = {}

N.plugin.load = function(n)
    local s, m = pcall(require, n)
    if not s then
        N.api.nvim_echo({ { 'unable to load ' .. n } }, true, {})
        return nil
    end
    return m
end

N.plugin.list = {}

N.plugin.list.packer = { 'wbthomason/packer.nvim' } -- packer

-- theme.lua
N.plugin.list.rose_pine = { 'rose-pine/nvim' } -- colorscheme
N.plugin.list.hardline = { 'ojroques/nvim-hardline' } -- status & buffer lines
N.plugin.list.cursorline = { 'yamatsum/nvim-cursorline' } -- cursorline

-- treesitter.lua
N.plugin.list.treesitter = {
    'nvim-treesitter/nvim-treesitter', -- treesitter
    requires = {
        { 'nvim-lua/plenary.nvim' },
    },
    as = 'treesitter',
}
N.plugin.list.name = {
    'p00f/nvim-ts-rainbow', -- treesitter ext (rainbow parens)
    after = { 'treesitter' },
}
N.plugin.list.name = {
    'nvim-treesitter/nvim-treesitter-context', -- treesitter ext (context)
    after = { 'treesitter' },
}
N.plugin.list.indent = { 'lukas-reineke/indent-blankline.nvim' } -- indent
N.plugin.list.comment = { 'numtostr/comment.nvim' } -- comment
N.plugin.list.surround = { 'kylechui/nvim-surround' } -- surround

-- telescope.lua
N.plugin.list.telescope = {
    'nvim-telescope/telescope.nvim', -- telescope
    requires = {
        { 'nvim-lua/plenary.nvim' },
    },
    as = 'telescope',
}
N.plugin.list.telescope_fzy_native = {
    'nvim-telescope/telescope-fzy-native.nvim', -- telescope ext (fzy sorter)
    after = { 'telescope' },
}

-- git.lua
N.plugin.list.gitsigns = { 'lewis6991/gitsigns.nvim' } -- git signs
N.plugin.list.neogit = { 'timuntersberger/neogit' } -- git console

-- lsp.lua
N.plugin.list.lsp_zero = {
    'vonheikemen/lsp-zero.nvim', -- lsp config
    requires = {
        { 'neovim/nvim-lspconfig' }, -- lsp support
        { 'williamboman/mason.nvim' }, -- lsp installer
        { 'williamboman/mason-lspconfig.nvim' }, -- lsp installer binds
        { 'hrsh7th/nvim-cmp' }, -- autocompletion
        { 'hrsh7th/cmp-buffer' }, -- completions srcs (buffer)
        { 'hrsh7th/cmp-path' }, -- completions srcs (path)
        { 'saadparwaiz1/cmp_luasnip' }, -- completions srcs (luasnip)
        { 'hrsh7th/cmp-nvim-lsp' }, -- completions srcs (lsp)
        { 'hrsh7th/cmp-nvim-lua' }, -- completions srcs (lua)
        { 'l3mon4d3/luasnip' }, -- snippets engine
        { 'rafamadriz/friendly-snippets' }, -- snippets lib
    },
}
N.plugin.list.codicons = { 'mortepau/codicons.nvim' } -- pictograms (icons)
N.plugin.list.lspkind = { 'onsails/lspkind.nvim' } -- completion pictograms
N.plugin.list.inc_rename = { 'smjonas/inc-rename.nvim' } -- inc-rename
N.plugin.list.autopairs = { 'windwp/nvim-autopairs' } -- autopairs
N.plugin.list.lightbulb = { 'kosayoda/nvim-lightbulb' } -- code-action-bulb
N.plugin.list.signature = { 'ray-x/lsp_signature.nvim' } -- signature

-- ui.lua
N.plugin.list.devicons = { 'kyazdani42/nvim-web-devicons' }
N.plugin.list.which = { 'folke/which-key.nvim' } -- which key
N.plugin.list.trouble = { 'folke/trouble.nvim' } -- qfix/loc lists
N.plugin.list.tree = { 'kyazdani42/nvim-tree.lua' } -- file exporer
N.plugin.list.noice = { 'folke/noice.nvim', requires = { { 'muniftanjim/nui.nvim' } } } -- enhanced ui

-- treesitter parsers
N.plugin.treesitter = {}
N.plugin.treesitter.parsers = {
    'bash',
    'bibtex',
    'c',
    'cmake',
    'comment',
    'cpp',
    'css',
    'dockerfile',
    'glsl',
    'go',
    'gomod',
    'html',
    'javascript',
    'json',
    'latex',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'ninja',
    'python',
    'regex',
    'rust',
    'toml',
    'typescript',
    'vim',
    'yaml',
}

-- lsp servers
N.plugin.lsp = {}
N.plugin.lsp.servers = {
    'cmake',
    'gopls',
    'clangd',
    'lua_ls',
    'pyright',
    'tsserver',
    'rust_analyzer',
}

return N
