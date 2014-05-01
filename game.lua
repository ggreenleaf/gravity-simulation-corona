
Planet = require("planet")
Satellite = require("satellite")
Gravity = require("gravity")


local Game = {}
local gameMT = {__index = Game}

function Game:new()
	local self = {}
	setmetatable(self,gameMT)
	p = Planet:new(CX,CY,25,1000)

	return self
end

function Game:touch( event )
	if event.phase == "began" then
		markX = event.x
		markY = event.y
		dx = 0
		dy = 0
	elseif event.phase == "moved" then
		display.remove(line)
		dx = event.x - markX
		dy = event.y - markY

		line = display.newLine(event.xStart,event.yStart
						,event.xStart-dx,event.yStart-dy)	
	elseif event.phase == "ended" then
		display.remove(line)
		local sat = Satellite:new(markX,markY,5,100)	
		sat.object:setLinearVelocity(-dx*2,-dy*2)
		Runtime:addEventListener("collision",sat)
		Runtime:addEventListener("enterFrame",sat)
	end
end





return Game