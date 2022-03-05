------------------ BY PROGRAM (Program Entertainment) ------------------
------------------------------------------------------------------------
------------------------------------------------------------------------



-------------------- Var & Send ----------------------------------------

local var = require(game:GetService("ServerScriptService").Variable)
local send = require(game:GetService("ServerScriptService").Print)
var.add("Ma Variable", 10)
print(var.show("Ma Variable"))
send.ex("Hello")
var.add("Hello", "Bonjour")
send.var("Hello")
var.update("Hello", "BYE BYE")
send.var("Hello")



------------------- Part -------------------------------------------------

local Part = require(game:GetService("ServerScriptService").Part)
Part:Create("ma part", workspace)
local p = Part:Get("ma part")
p.Transparency = 0.5
print(Part.PartChildren())
wait(2)

for i = 0, 10, 1 do
	Part:Move("ma part", p.Position + Vector3.new(i, 0, 0))
	wait(0.25)
end

wait(2)

Part:SetTransparency("ma part", 0)

wait(2)

Part:SetColor("ma part", Color3.new(0.541176, 0, 0))

wait(2)
Part:Delete("ma part")
print(Part.PartChildren())