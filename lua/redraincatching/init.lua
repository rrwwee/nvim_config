if vim.loop.os_uname().sysname == "Windows_NT" then
	require("redraincatching.powershell")
end

require("redraincatching.remap")
require("redraincatching.lazy")
require("redraincatching.options")
require("redraincatching.colorscheme")

