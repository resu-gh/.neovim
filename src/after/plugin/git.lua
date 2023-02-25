local gitsigns = N.plugin.load 'gitsigns'
local neogit = N.plugin.load 'neogit'

if not gitsigns then return end
if not neogit then return end

gitsigns.setup {}

neogit.setup {}
