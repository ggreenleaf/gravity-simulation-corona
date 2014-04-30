


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

	 local function onCollision(self,event)
	 	if event.other.name == "field" then
	 		if (event.phase == "began" ) then
	 			self.link = event.other.planetLink
	 		elseif (event.phase == "ended") then
	 			self.link = nil
	 		end
	 	end	
	 end

	 self.object.collision = onCollision
	 self.object:addEventListener("collision",self.object)

	 return self
end
--link an satellite to an object to calculate Gravity


function Satellite:destroy()
	self.object:removeSelf()
end




return Satellite