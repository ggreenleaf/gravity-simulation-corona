
Planet = require("planet")
Satellite = require("satellite")
Gravity = require("gravity")


local Game = {}
local gameMT = {__index = Game}

function Game:new()
	local self = {}
	setmetatable(self,gameMT)
	--p = Planet:new(CX,CY,25,1000)
	self.draw = "sat"
	self.satCount = 0
	return self
end

function Game:touch( event )
	if "sat" == self.draw then
		if "began" == event.phase then
			markX = event.x
			markY = event.y
			dx = 0
			dy = 0
		elseif "moved" == event.phase then
			display.remove(line)
			dx = event.x - markX
			dy = event.y - markY

			line = display.newLine(event.xStart,event.yStart
							,event.xStart-dx,event.yStart-dy)	
		elseif "ended" == event.phase then
			display.remove(line)
			sat = Satellite:new(markX,markY,5,100)
			sat.object:setLinearVelocity(-dx*2,-dy*2)
			Runtime:addEventListener("enterFrame",sat)
		end
	elseif "planet" == self.draw then
		if "began" == event.phase then
			markX = event.x
			markY = event.y
			dx = 0
			dy = 0
		elseif "moved" == event.phase then
			display.remove(line)
			dx = event.x - markX
			dy = event.y - markY
			line = display.newLine(event.xStart,event.yStart,
									event.xStart+dx, event.yStart+dy)
		elseif "ended" == event.phase then
			display.remove(line)
			local radius = math.sqrt(dx^2+dy^2)/2
			local center = {x=markX+dx/2,y=markY+dy/2}
			local planet = Planet:new(center.x,center.y,radius,100)
		end


	end
end

function Game:key(event)
	if "down" == event.phase then
		if "s" == event.keyName then
			self.draw = "sat"
		elseif "p" == event.keyName then
			self.draw = "planet"
		end
	end
end





return Game