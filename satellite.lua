

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
	 self.object.name = "satellite"


	 return self
end
--link an satellite to an object to calculate Gravity
function Satellite:destroy()
	self.object:removeSelf()
end

function Satellite:collision(event)
	if event.object1.name == "field" then
		if event.phase == "began" then
			self.link = event.object1.link
		elseif event.phase == "ended" then
			self.link = nil
		end
	end
end

function Satellite:enterFrame(event)
	if self.link ~= nil then
		local force = Gravity.calcForceG(self.link,self.object)
		self.object:applyForce(force.x,force.y)
	end
end




return Satellite