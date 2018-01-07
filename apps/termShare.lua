local device     = _G.device
local multishell = _ENV.multishell
local os         = _G.os
local term       = _G.term

-- list this terminal in the devices list so it's available via
-- peripheral sharing

local args = { ... }
local name = args[1] or error('Syntax: termShare [device name] <title>')
local title = args[2]

device[name] = term.current()
device[name].name = name
device[name].side = name
device[name].type = 'terminal'

if title then
	multishell.setTitle(multishell.getCurrent(), title)
end
os.pullEvent('terminate')
os.queueEvent('peripheral_detach', name)
