local trouble = N.plugin.load 'trouble'
local which = N.plugin.load 'which-key'
local tree = N.plugin.load 'nvim-tree'
local codicons = N.plugin.load 'codicons'

if not trouble then return end
if not which then return end
if not tree then return end
if not codicons then return end

local codicon = function(s) return codicons.get(s, 'icon') end

trouble.setup {
    fold_open = codicon 'chevron-down',
    fold_closed = codicon 'chevron-right',
    padding = false,
    icons = true,
    use_diagnostic_signs = true,
}

N.keymap.set('n', '<Down>', N.cmd.TroubleToggle, N.keymap.opts 'ns')

which.setup {}

tree.setup {
    renderer = {
        icons = {
            glyphs = {
                default = codicon 'file',
                symlink = codicon 'file-symlink-file',
                bookmark = codicon 'bookmark',
                folder = {
                    arrow_closed = codicon 'chevron-right',
                    arrow_open = codicon 'chevron-down',
                    default = codicon 'folder',
                    open = codicon 'folder-opened',
                    empty = codicon 'root-folder',
                    empty_open = codicon 'root-folder-opened',
                    symlink = codicon 'file-symlink-directory',
                    symlink_open = codicon 'file-symlink-directory',
                },
                git = {
                    unstaged = codicon 'diff-modified',
                    staged = codicon 'diff-added',
                    unmerged = codicon 'git-merge',
                    renamed = codicon 'diff-renamed',
                    untracked = codicon 'star-empty',
                    deleted = codicon 'diff-removed',
                    ignored = codicon 'diff-ignored',
                },
            },
        },
    },
    diagnostics = {
        icons = {
            hint = codicon 'question',
            info = codicon 'info',
            warning = codicon 'warning',
            error = codicon 'error',
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}

N.keymap.set('n', '<Left>', N.cmd.NvimTreeToggle)
