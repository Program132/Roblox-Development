------------------ BY PROGRAM (Program Entertainment) ------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


---- Example: Team

local ProximityPromptService = game:GetService("ProximityPromptService")

ProximityPromptService.PromptTriggered:Connect(function(pp, player)
	if pp.Name == "RaiderButton" then
		player.TeamColor = BrickColor.new("Lime green")
	end
end)