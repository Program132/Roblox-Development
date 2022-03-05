------------------ BY PROGRAM (Program Entertainment) ------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


-- Script (in SSS):
local rs = game:GetService("ReplicatedStorage")

local function create()
	local p = Instance.new("Part")
	p.Name = "part"
	p.CanCollide = false
	p.Anchored = true
	p.Parent = workspace
	return p
end

rs.Create.OnServerInvoke = create

rs.Move.OnServerEvent:Connect(function(plr, part, position)
	part.Position = position
end)



--- LocalScript (In the tool):
local tool = script.Parent

local runs = game:GetService("RunService")
local rs = game:GetService("ReplicatedStorage")

local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()

local event
tool.Equipped:Connect(function()
	local part = rs.Create:InvokeServer()
	
	mouse.Button1Down:Connect(function()
		event = runs.Stepped:Connect(function()
			rs.Move:FireServer(part, mouse.Hit.Position + Vector3.new(0, (part.Size.Y / 2), 0))
		end)
	end)
	
	mouse.Button1Up:Connect(function()
		event:Disconnect()
	end)
end)

tool.Unequipped:Connect(function()
	event:Disconnect()
end)