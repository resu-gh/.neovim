local telescope = N.plugin.load 'telescope'
local builtin = N.plugin.load 'telescope.builtin'
local actions = N.plugin.load 'telescope.actions'

if not telescope then return end
if not builtin then return end
if not actions then return end

telescope.setup {
    defaults = {
        borderchars = {
            prompt = { '', '', '', '', '', '', '', '' },
            results = { '', '', '', '', '', '', '', '' },
            preview = { '', '', '', '', '', '', '', '' },
        },
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}

telescope.load_extension 'fzy_native'

N.keymap.set('n', '<Leader>sf', builtin.find_files, N.keymap.opts 'ns')
N.keymap.set('n', '<Leader>ss', builtin.git_files, N.keymap.opts 'ns')
N.keymap.set('n', '\\', function() builtin.grep_string { search = N.fn.input '@ ' } end, N.keymap.opts 'ns')
N.keymap.set('n', '<Leader>sv', builtin.commands, N.keymap.opts 'ns')

N.cmd 'hi! clear TelescopeBorder'
N.cmd 'hi! link TelescopeBorder Pmenu'
N.cmd 'hi! clear TelescopeNormal'
N.cmd 'hi! link TelescopeNormal Pmenu'
N.cmd 'hi! clear TelescopeResultsTitle'
N.cmd 'hi! link TelescopeResultsTitle PmenuSel'
