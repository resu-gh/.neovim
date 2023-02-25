local rosepine = N.plugin.load 'rose-pine'
local palette = N.plugin.load 'rose-pine.palette'
local hardline = N.plugin.load 'hardline'
local cursorline = N.plugin.load 'nvim-cursorline'

if not rosepine then return end
if not palette then return end
if not hardline then return end
if not cursorline then return end

rosepine.setup {
    dark_variant = 'moon',
    bold_vert_split = true,
    disable_background = false,
}

N.cmd.colorscheme 'rose-pine'

hardline.setup {
    bufferline = true,
    theme = 'custom',
    custom_theme = {
        text = { gui = palette.base },
        normal = { gui = palette.rose },
        insert = { gui = palette.iris },
        replace = { gui = palette.pine },
        inactive_comment = { gui = palette.muted },
        inactive_cursor = { gui = palette.base },
        inactive_menu = { gui = palette.overlay },
        visual = { gui = palette.foam },
        command = { gui = palette.love },
        alt_text = { gui = palette.rose },
        warning = { gui = palette.gold },
    },
}

cursorline.setup {
    cursorline = {
        timeout = 0,
    },
    cursorword = {
        min_length = 1,
        hl = {
            underline = false,
            bg = palette.overlay,
            -- link = 'PmenuSel'
        },
    },
}
