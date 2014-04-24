-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


physics = require("physics")
math = require("math")
_CY = display.contentCenterY
_CX = display.contentCenterX
planetRadius  = 50
satRadius = 5


physics.start()

local function calcVelocityVector(objOne,objTwo)
	local dX = objTwo.x - objOne.x
	local dY = objTwo.y - objOne.y
	local radius = math.sqrt(dY^2+dX^2)	
	force = 100000
	mass = 100
	local angle = math.asin(dX/radius)
	local velocity = {}
	velocity.mag = math.sqrt((force*mass)/radius)
	velocity.x = math.sin(angle)*velocity.mag
	velocity.y = math.cos(angle)*velocity.mag
	if dX > 0 then
		velocity.y = -1*math.cos(angle)*velocity.mag	
	end
	
	return velocity
end


local function calcForceG(objOne,objTwo)
	local dX = objTwo.x - objOne.x
	local dY = objTwo.y - objOne.y
	local radius = math.sqrt(dY^2+dX^2)	
	print(math.floor(dX).." "..math.floor(dY))
	local G = 1000
	local angle = math.asin(dY/radius)
	local force = {}
	force.mag = G*((objOne.mass*objTwo.mass)/(radius^2))
	force.x = math.cos(angle)*force.mag
	force.y = -math.sin(angle)*force.mag

	if dX >0 then
		force.x = -force.x
	end
	print(force.x.." "..force.y)	
	return force

end

planet = display.newCircle(_CX,_CY,planetRadius)
planetDetails = {radius=planetRadius,density=10}
physics.addBody(planet,"static", planetDetails); planet.gravityScale = 0
planet.mass = 100 --EarthMass


sat = display.newCircle(_CX-100,_CY,satRadius)
satProperties = {radius=satRadius,density=5}
physics.addBody(sat,satProperties); sat.gravityScale = 0

sat:setLinearVelocity(0,100)

--mOne is oribiting mOne
local function update(objOne, objTwo)
--	local velocity = calcVelocityVector(objOne,objTwo)
--	objTwo:setLinearVelocity(velocity.x,velocity.y)
	local force = calcForceG(planet,sat)
	objTwo:applyForce(force.x,force.y)
end

Runtime:addEventListener("enterFrame",
		function()
				update(planet,sat)
		end)





					






--calculate the force of gravity between two objects. 
