local CHS = game:GetService("ChangeHistoryService")

local toolbar = plugin:CreateToolbar("Gui Plugin")

local boutonCreateScript = toolbar:CreateButton(
	"Create new script",
	"Create new script",
	"rbxassetid://4458901886"
)

boutonCreateScript.Click:Connect(function()
	local newScript = Instance.new("Script")
	newScript.Source = ""
	newScript.Parent = game:GetService("ServerScriptService")
	CHS:SetWaypoint("New script added!")
end)

script.Parent.ScreenGui.Parent = game.CoreGui