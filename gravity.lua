

math = require("math")
_CY = display.contentCenterY
_CX = display.contentCenterX
planetProperties = {radius=25,density=100}

satRadius = 5


local Gravity = {}
local gravityMT = {__index = Gravity}
Gravity.G = 1000 --gravitational constant

function Gravity.calcForceG(objOne,objTwo)
	local dX = objTwo.x - objOne.x
	local dY = objTwo.y - objOne.y
	local radius = math.sqrt(dY^2+dX^2)	
	local angle = math.asin(dY/radius)
	local force = {}
	force.mag = Gravity.G*((objOne.mass*objTwo.mass)/(radius^2))
	force.x = math.cos(angle)*force.mag
	force.y = -math.sin(angle)*force.mag

	if dX > 0 then
		force.x = -force.x
	end

	return force
end

return Gravity
--[[
local function calcVelocityVector(objOne,objTwo)
	local dX = objTwo.x - objOne.x
	local dY = objTwo.y - objOne.y
	local radius = math.sqrt(dY^2+dX^2)	
	force = 100
	mass = 100
	local angle = math.asin(dX/radius)
	local velocity = {}
	velocity.mag = math.sqrt((force*mass)/radius)
	velocity.x = math.sin(angle)*velocity.mag
	velocity.y = math.cos(angle)*velocity.mag
	if dX > 0 then
		velocity.y = -velocity.y	
	end
	
	return velocity
end
--]]



					






--calculate the force of gravity between two objects. 
