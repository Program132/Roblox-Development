local var = {}
var.__index = var

function var.add(name, value)
	var[name] = value
	return var
end

function var.show(name)
	if var[name] then
		return var[name]
	else
		print(var)
		return "Did not find the variable."
	end
end

function var.delete(name)
	var[name] = nil
end

function var.get(name)
	if var[name] then
		return var[name]
	else
		return "Did not find the variable."
	end
end

function var.update(name, new_value)
	if var[name] then
		var[name] = new_value
	else
		return "Did not find the variable."
	end
end

return var