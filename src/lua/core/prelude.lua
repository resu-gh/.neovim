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

N.manager.path = N.fn.stdpath 'data' .. '/lazy/lazy.nvim'

N.manager.link = 'https://github.com/folke/lazy.nvim.git'

N.manager.download = function()
    if not N.loop.fs_stat(N.manager.path) then
        N.fn.system {
            'git',
            'clone',
            '--filter=blob:none',
            N.manager.link,
            '--branch=stable',
            N.manager.path,
        }
    end
    N.opt.rtp:prepend(N.manager.path)
end

N.manager.config = {
    -- lockfile = N.fn.stdpath 'data' .. "/lazy-lock.json",
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

-- plugins
N.plugin.list = {
    { 'rose-pine/nvim' },
    { 'ojroques/nvim-hardline' },
    { 'yamatsum/nvim-cursorline' },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },
    {
        'mrjones2014/nvim-ts-rainbow',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'numtostr/comment.nvim' },
    { 'kylechui/nvim-surround' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'nvim-telescope/telescope-fzy-native.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
    },
    { 'lewis6991/gitsigns.nvim' },
    { 'timuntersberger/neogit' },
    {
        'vonheikemen/lsp-zero.nvim',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'l3mon4d3/luasnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    },
    { 'mortepau/codicons.nvim' },
    { 'onsails/lspkind.nvim' },
    { 'smjonas/inc-rename.nvim' },
    { 'windwp/nvim-autopairs' },
    { 'kosayoda/nvim-lightbulb' },
    { 'ray-x/lsp_signature.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'folke/which-key.nvim' },
    { 'folke/trouble.nvim' },
    { 'kyazdani42/nvim-tree.lua' },
    {
        'folke/noice.nvim',
        dependencies = {
            'muniftanjim/nui.nvim',
        },
    },
}

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
