if vim.loop.os_uname().sysname == "Windows_NT" then
	require("rorycollins.powershell")
end

require("rorycollins.config.keymappings")
require("rorycollins.config.options")
require("rorycollins.core.bootstrap")
require("rorycollins.core.lazy")
require("rorycollins.config.colorscheme")
