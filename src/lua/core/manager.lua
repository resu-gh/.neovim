N.manager.download()

N.cmd.packadd 'packer.nvim'

local packer = N.plugin.load 'packer'

if not packer then return end

packer.init(N.manager.config)

packer.startup {
    function(use)
        for _, plugin in pairs(N.plugin.list) do
            use(plugin)
        end
        if N.manager.boot then packer.sync() end
    end,
}
