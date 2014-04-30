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
widget = require("widget")
planet = require("planet")
CY = display.contentCenterY
CX = display.contentCenterX


physics.start()
display.setStatusBar(display.HiddenStatusBar)

local widget = require( "widget" )

-- Function to handle button events



p = planet:new(CX,CY,25,1000)



function spawnSat(event)
	if event.phase == "began" then
		markX = event.x
		markY = event.y
	
	elseif event.phase == "moved" then
		display.remove(line)

		dx = event.x - markX
		dy = event.y - markY
		line = display.newLine(event.xStart,event.yStart
						,event.xStart-dx,event.yStart-dy)
		
		
	elseif event.phase == "ended" then
		display.remove(line)
		local sat = satellite:new(markX,markY,5,100)	
		sat.object:setLinearVelocity(-dx*2,-dy*2)





		local function update()
			if sat.object.link ~= nil then
				local force = gravity.calcForceG(sat.object.link,sat.object)
				sat.object:applyForce(force.x,force.y)
			end
		end

	
	Runtime:addEventListener("enterFrame",update)
	end
end





Runtime:addEventListener("touch",spawnSat)












					







