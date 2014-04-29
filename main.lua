-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


physics = require("physics")
math = require("math")
gravity = require("gravity")
satellite = require("satellite")
CY = display.contentCenterY
CX = display.contentCenterX
planetProps = {radius=25,density=100}

physics.start()

planet = display.newCircle(CX,CY,planetProps.radius)
physics.addBody(planet,"static",{radius=25})
planet.mass = 100
planet.gravityScale = 0


function spawnSat(event)
	if event.phase == "began" then
		local sat = satellite:new(event.x,event.y,5,100)
		sat:link(planet)	
		sat.object:setLinearVelocity(-50,0)
		
		local function update()
			local force = gravity.calcForceG(sat.link,sat.object)
			sat.object:applyForce(force.x,force.y)

		end

		Runtime:addEventListener("enterFrame",function ()
				update(); end)
	end
end



Runtime:addEventListener("touch",spawnSat)












					







