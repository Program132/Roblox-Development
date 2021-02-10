local toolbar = plugin:CreateToolbar("Mon premier plugin")

local boutonCreateScript = toolbar:CreateButton(
	"Create new script",
	"Create new script",
	"rbxassetid://4458901886"
)

boutonCreateScript.Click:Connect(function()
	local newScript = Instance.new("Script")
	newScript.Source = ""
	newScript.Parent = game:GetService("ServerScriptService")
end)