local treesitter = N.plugin.load 'nvim-treesitter.configs'
local context = N.plugin.load 'treesitter-context'
local indent = N.plugin.load 'indent_blankline'
local comment = N.plugin.load 'Comment'
local surround = N.plugin.load 'nvim-surround'

if not treesitter then return end
if not context then return end
if not indent then return end
if not comment then return end
if not surround then return end

treesitter.setup {
    ensure_installed = { N.plugin.treesitter.parsers },
    autopairs = { enable = true },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }, -- p00f/nvim-ts-rainbow
}

context.setup {}

indent.setup {
    show_current_context = true,
    show_current_context_start = false,
}

comment.setup {}

surround.setup {}
