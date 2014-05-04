

gravity = require("gravity")
local Satellite = {}
local satelliteMT = {__index = Satellite}

--spawn a new satellite with center of object at (x,y), 
--radius=r and density=d
function Satellite:linkObject(obj)
	self.object.link = obj
end



function Satellite:new(x,y,r,d)
	 local self = {}
	 setmetatable(self,satelliteMT)
	 local props = {radius=r,density=d}
	 self.object = display.newCircle(x,y,r)

	 physics.addBody(self.object,props)
	 self.object.gravityScale = 0
	 self.object.name = x+y

	local function satCollision(self,event)
		if "field" == event.other.name then
			if "began" == event.phase then
				self.link = event.other.link
			elseif "ended" == event.phase then
				self.link = nil
			end
		end
	end

	self.object.collision = satCollision
	self.object:addEventListener("collision",self.object)


	 return self
end
--link an satellite to an object to calculate Gravity
function Satellite:destroy()
	self.object:removeSelf()
end

function Satellite:enterFrame()
	if self.object.link ~= nil then
		local force = Gravity.calcForceG(self.object.link,self.object)
		self.object:applyForce(force.x,force.y)
	end
end



--Satellite.collision = 


return Satellite