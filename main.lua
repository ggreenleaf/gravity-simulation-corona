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

local function calcForceG(mOne,mTwo)
	local dX = mOne.x - mTwo.x
	local dY = mOne.y - mTwo.y

	--forcetable for holding magnitude, x,y part of F
	forceG = {}
	forceG.magnitude = 0.01

	forceG.distance = math.sqrt(dY^2+dX^2)	
	local angle = math.asin(dY/forceG.distance)
	

	forceG.y = forceG.magnitude*math.sin(angle)
	forceG.x = forceG.magnitude*math.cos(angle)
	print(angle)
	print(forceG.x.." "..forceG.y)
	
	return forceG
end



planet = display.newCircle(_CX,_CY,planetRadius)
planetDetails = {radius=planetRadius}
physics.addBody(planet,"static", planetDetails); planet.gravityScale = 0
planet.mass = 100 --EarthMass


sat = display.newCircle(_CX-150,_CY,satRadius)
satProperties = {radius=satRadius}
physics.addBody(sat,satProperties); sat.gravityScale = 0
sat.mass = 1
sat.force = calcForceG(planet,sat)
sat:setLinearVelocity(0,-110)

--mOne is oribiting mOne
local function update(mOne, mTwo)
	local force = calcForceG(mOne,mTwo)
	mTwo:applyForce(force.x,force.y)
end

Runtime:addEventListener("enterFrame",
		function()
				update(planet,sat)
				if (sat.x > display.contentWidth) then
					physics.stop()
				end
		end)





					






--calculate the force of gravity between two objects. 
