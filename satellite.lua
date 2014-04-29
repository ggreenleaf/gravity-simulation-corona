


local Satellite = {}
local satelliteMT = {__index = Satellite}

--spawn a new satellite with center of object at (x,y), 
--radius=r and density=d


function Satellite:new(x,y,r,d)
	 local self = {}
	 setmetatable(self,satelliteMT)
	 local props = {radius=r,density=d}
	 self.object = display.newCircle(x,y,r)

	 physics.addBody(self.object,props)
	 self.object.gravityScale = 0

	 return self
end
--link an satellite to an object to calculate Gravity
function Satellite:link(obj)
	self.link = obj
end

function Satellite:destroy()
	self.object:removeSelf()
end




return Satellite