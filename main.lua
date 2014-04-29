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


local function drawVelocityVector(sPost,sVelo)


end

function spawnSat(event)
	if event.phase == "began" then
		markX = event.x
		markY = event.y
	end
	if event.phase == "moved" then
		display.remove(line)

		dx = event.x - markX
		dy = event.y - markY


		line = display.newLine(event.xStart,event.yStart
						,event.xStart-dx,event.yStart-dy)
		
		--line.exists = true
	end
	if event.phase == "ended" then
		display.remove(line)
		local sat = satellite:new(markX,markY,5,100)
		sat:link(planet)	
		sat.object:setLinearVelocity(-dx*2,-dy*2)

	local function update()
			local force = gravity.calcForceG(sat.link,sat.object)
			sat.object:applyForce(force.x,force.y)

	end

	Runtime:addEventListener("enterFrame",update)
	end
end



Runtime:addEventListener("touch",spawnSat)












					







