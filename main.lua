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
--function definitions

--[[local function calcForceG(mOne,mTwo)
	local dX = mOne.x - mTwo.x
	local dY = mOne.y - mTwo.y
	print(dX.." "..dY)
	
	--forcetable for holding magnitude, x,y part of F
	local forceG = {}
	forceG.magnitude = 0.01

	forceG.distance = math.sqrt(dY^2+dX^2)	
	local angle = math.asin(dY/forceG.distance)
	

	forceG.y = forceG.magnitude*math.sin(angle)
	forceG.x = forceG.magnitude*math.cos(angle)
	--print(forceG.x.." "..forceG.y)
	
	return forceG
end--]]


local function calcVelocityVector(objOne,objTwo)
	local dX = objTwo.x - objOne.x
	local dY = objTwo.y - objOne.y
	local radius = math.sqrt(dY^2+dX^2)	
	force = 5000
	mass = 100
	if dX > 0 then
		local angle = math.acos(dX/radius)
	end
	local angle = math.asin(dY/radius)
	local velocity = {}
	velocity.mag = math.sqrt((force*mass)/radius)
	velocity.x = math.sin(angle)*velocity.mag
	velocity.y = math.cos(angle)*velocity.mag
	if dX > 0 then
		velocity.y = -1*math.cos(angle)*velocity.mag
	
	end
	
	return velocity

end


planet = display.newCircle(_CX,_CY,planetRadius)
planetDetails = {radius=planetRadius}
physics.addBody(planet,"static", planetDetails); planet.gravityScale = 0
planet.mass = 100 --EarthMass


sat = display.newCircle(_CX-100,_CY,satRadius)
satProperties = {radius=satRadius}
physics.addBody(sat,satProperties); sat.gravityScale = 0

--centripetal force. 

--mOne is oribiting mOne
local function update(objOne, objTwo)
	local velocity = calcVelocityVector(objOne,objTwo)
	objTwo:setLinearVelocity(velocity.x,velocity.y)
end

Runtime:addEventListener("enterFrame",
		function()
				update(planet,sat)
				if (sat.x > display.contentWidth) then
					physics.stop()
				end
		end)





					






--calculate the force of gravity between two objects. 
