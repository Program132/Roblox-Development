------------------ BY PROGRAM (Program Entertainment) ------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

------------------ Warning: this centry do not shoot ! -----------------
------------------------------------------------------------------------
------------------------------------------------------------------------

local tourelle = workspace.Tourelle
local point = workspace.Point

local runs = game:GetService("RunService")
local plrs = game:GetService("Players")

plrs.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local hrp = char.HumanoidRootPart
		runs.Stepped:Connect(function()
			point.CFrame = CFrame.new(
				point.Position, 
				Vector3.new(hrp.Position.X, point.Position.Y, hrp.Position.Z)
			)
			tourelle.CFrame = point.CFrame * CFrame.new(0,0,-tourelle.size.z/2)
		end)
	end)
end)