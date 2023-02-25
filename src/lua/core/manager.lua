N.manager.download()

local lazy = N.plugin.load 'lazy'
if not lazy then return end

lazy.setup { N.plugin.list, N.manager.config }
