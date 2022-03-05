local send = {}
send.__index = send

function send.ex(message)
	if message then
		print(message)
	end
end

function send.var(name)
	local var = require(game:GetService("ServerScriptService").Variable)
	print(var.get(name))
end

return send