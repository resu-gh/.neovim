local lsp = N.plugin.load 'lsp-zero'
local codicons = N.plugin.load 'codicons'
local kind = N.plugin.load 'lspkind'
local irename = N.plugin.load 'inc_rename'
local cmp = N.plugin.load 'cmp'
local autopairs = N.plugin.load 'nvim-autopairs'
local cmp_autopairs = N.plugin.load 'nvim-autopairs.completion.cmp'
local bulb = N.plugin.load 'nvim-lightbulb'
local snip = N.plugin.load 'luasnip'
local signature = N.plugin.load 'lsp_signature'

if not lsp then return end
if not codicons then return end
if not kind then return end
if not irename then return end
if not cmp then return end
if not autopairs then return end
if not cmp_autopairs then return end
if not bulb then return end
if not snip then return end
if not signature then return end

lsp.preset 'recommended'

lsp.ensure_installed(N.plugin.lsp.servers)

codicons.setup {}

local codicon = function(s) return codicons.get(s, 'icon') end

kind.init {
    preset = 'codicons',
    symbol_map = {
        Keyword = codicon 'key',
        Folder = codicon 'folder',
        Unit = codicon 'database',
        Key = codicon 'symbol-key',
        Text = codicon 'text-size',
        Package = codicon 'package',
        Enum = codicon 'symbol-enum',
        File = codicon 'symbol-file',
        Array = codicon 'symbol-array',
        Class = codicon 'symbol-class',
        Color = codicon 'symbol-color',
        Event = codicon 'symbol-event',
        Field = codicon 'symbol-field',
        Object = codicon 'symbol-misc',
        Null = codicon 'symbol-keyword',
        Method = codicon 'symbol-method',
        Module = codicon 'symbol-method',
        Reference = codicon 'references',
        String = codicon 'symbol-string',
        Value = codicon 'symbol-numeric',
        Number = codicon 'symbol-numeric',
        Boolean = codicon 'symbol-boolean',
        Function = codicon 'symbol-method',
        Snippet = codicon 'symbol-snippet',
        Struct = codicon 'symbol-structure',
        Constant = codicon 'symbol-constant',
        Operator = codicon 'symbol-operator',
        Property = codicon 'symbol-property',
        Variable = codicon 'symbol-variable',
        Constructor = codicon 'symbol-method',
        Interface = codicon 'symbol-interface',
        Namespace = codicon 'symbol-namespace',
        EnumMember = codicon 'symbol-enum-member',
        TypeParameter = codicon 'symbol-parameter',
    },
}

lsp.set_preferences {
    set_lsp_keymaps = false,
    sign_icons = {
        error = codicon 'error',
        warn = codicon 'warning',
        hint = codicon 'question',
        info = codicon 'info',
    },
}

irename.setup {}

lsp.on_attach(function(_, bufnr)
    local opts = N.keymap.opts 'ns'
    opts = N.tbl_extend('force', opts, { buffer = bufnr })

    N.keymap.set('n', 'K', function() N.lsp.buf.hover() end, opts)
    N.keymap.set('n', 'gd', function() N.lsp.buf.definition() end, opts)
    N.keymap.set('n', 'gD', function() N.lsp.buf.declaration() end, opts)
    N.keymap.set('n', 'gi', function() N.lsp.buf.implementation() end, opts)
    N.keymap.set('n', 'go', function() N.lsp.buf.type_definition() end, opts)
    N.keymap.set('n', 'gr', function() N.lsp.buf.references() end, opts)
    N.keymap.set('n', '<C-k>', function() N.lsp.buf.signature_help() end, opts)
    N.keymap.set('n', '<Leader>f', function() N.lsp.buf.format() end, opts)
    N.keymap.set('n', 'gl', function() N.diagnostic.open_float() end, opts)
    N.keymap.set('n', '<C-p>', function() N.diagnostic.goto_prev() end, opts)
    N.keymap.set('n', '<C-n>', function() N.diagnostic.goto_next() end, opts)

    N.keymap.set('n', '<F2>', ':IncRename ')
    -- N.keymap.set('n', '<F2>', function() N.lsp.buf.rename() end, opts)
    N.keymap.set('n', '<F3>', function() N.lsp.buf.code_action() end, opts)
end)

local cmp_mapping = lsp.defaults.cmp_mappings()
cmp_mapping['<C-y>'] = nil -- confirm
cmp_mapping['<C-n>'] = nil -- select next
cmp_mapping['<C-p>'] = nil -- select prev
cmp_mapping['<C-e>'] = nil -- toggle
cmp_mapping['<C-space>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.close()
        fallback()
    else
        cmp.complete()
    end
end)
cmp_mapping['<C-d>'] = nil -- snip next
cmp_mapping['<C-b>'] = nil -- snip prev
cmp_mapping['<C-j>'] = cmp.mapping(function(fallback)
    if snip.jumpable(1) then
        snip.jump(1)
    else
        fallback()
    end
end, { 'i', 's' })
cmp_mapping['<C-k>'] = cmp.mapping(function(fallback)
    if snip.jumpable(-1) then
        snip.jump(-1)
    else
        fallback()
    end
end, { 'i', 's' })

lsp.setup_nvim_cmp {
    documentation = {
        border = 'none',
        winhighlight = 'Normal:Pmenu,FloatBorder:PmenuSel,CursorLine:Visual,Search:None',
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = kind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
        },
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
    },
    mapping = cmp_mapping,
}

autopairs.setup {}
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done {})

N.cmd 'hi! link LspSignatureActiveParameter Visual'

signature.setup {
    doc_lines = 0,
    floating_window_off_x = 0,
    floating_window_off_y = 0,
    fix_pos = true,
    handler_opts = { border = 'none' },
    hint_enable = false,
    hint_prefix = '',
    max_width = 120,
}

lsp.setup {}

N.lsp.handlers['textDocument/hover'] = N.lsp.with(N.lsp.handlers.hover, { border = 'none' })
N.lsp.handlers['textDocument/signatureHelp'] = N.lsp.with(N.lsp.handlers.signature_help, { border = 'none' })

N.diagnostic.config {
    virtual_text = true,
    float = { border = 'none' },
}

bulb.setup { autocmd = { enabled = true } }
N.fn.sign_define('LightBulbSign', {
    text = codicon 'lightbulb',
    texthl = '',
    linehl = '',
    numhl = '',
})
