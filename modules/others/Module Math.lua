local Math = {}

function Math.add(a, b)
	return a + b
end

function Math.remove(a, b)
	return a - b
end

function Math.multi(a, b)
	return a * b
end

function Math.div(a, b)
	return a / b
end

function Math.power(a, b)
	return math.pow(a, b)
end

function Math.random(a, b)
	if a <= 0 then
		warn("Send a number upper 0 !")
	elseif a >= b then
		warn("Send a number who is equal and is not upper of the second value !")
	else
		return math.random(a, b)
	end
end

return Math
