------------------ BY PROGRAM (Program Entertainment) ------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


-- Main :
local event = rs.RemoteEvent -- I use a remote event.
local rs = game:GetService("ReplicatedStorage")
local ss = game:GetService("ServerStorage")

event.OnClientEvent:Connect(function(humanoid)
	workspace.Camera.CameraSubject = humanoid
end)

--- LocalScript (With RemoteEvent)
event.OnClientEvent:Connect(function(humanoid)
	workspace.Camera.CameraSubject = humanoid
end)

--- Script (With RemoteEvent)
event.OnServerEvent:Connect(function(plr) -- plr -> player
    local morph = rs.Morph:Clone() -- My morph
    local char = plr.Character
	local animate = ss.Animate:Clone()
	
	morph.Parent = workspace
	morph.Name = plr.Name
	animate.Parent = morph

	
	morph:PivotTo(workspace[plr.Name].HumanoidRootPart.CFrame) 
	plr.Character = morph
	char:Destroy()
	
	local humanoid = morph.Humanoid
	
	event:FireClient(plr, humanoid)
	
	humanoid.died:Connect(function() 
		wait(game.Players.RespawnTime)
		plr:LoadCharacter() 
	end)
end)


--- LocalScript (In a button)
script.Parent.MouseButton1Click:Connect(function()
	event:FireServer()
end)

event.OnClientEvent:Connect(function(humanoid)
	workspace.Camera.CameraSubject = humanoid
end)