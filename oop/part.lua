local Part = {}
Part.__index = "Part Module"
Part.Object = {}

function Part:Create(name, par)
	local a = Instance.new("Part")
	a.Name = name
	a.Parent = par
	
	Part.Object[name] = a
	
	return a
end

function Part:Get(name)
	if Part.Object[name] then
		return Part.Object[name]
	else
		return false
	end
end

function Part:Delete(name)
	if Part.Object[name] then
		local part = self:Get(name)
		Part.Object[name] = nil
		part:Destroy()
	else
		return false
	end
end

function Part:Move(name, position)
	local p = self:Get(name)
	if p then
		p.Position = position
		return true
	else
		return false
	end
end

function Part:SetTransparency(name, value)
	local p = self:Get(name)
	if p then
		p.Transparency = value
		return true
	else
		return false
	end
end

function Part:SetColor(name, value)
	local p = self:Get(name)
	if p then
		p.Color = value
		return true
	else
		return false
	end
end

function Part.PartChildren()
	return Part.Object
end


return Part