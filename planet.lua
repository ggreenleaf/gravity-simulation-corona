


local Planet = {}
local planetMT = {__index = Satellite}

--spawn a new satellite with center of object at (x,y), 
--radius=r and density=d


function Planet:new(x,y,r,m)
	 local self = {}
	 setmetatable(self,planetMT)


	  --group holds planet and gravity field object
	  self.group = display.newGroup()

	 self.field = display.newCircle(x,y,r*5);  self.field.alpha = 0.3
	 self.field.name = "field"
	 physics.addBody(self.field,"static",{isSensor=true,radius=r*5})


	 self.object = display.newCircle(x,y,r)
	 physics.addBody(self.object,"static",{radius=r})
	 self.object.mass = m
	 self.object.gravityScale = 0

	 self.field.planetLink = self.object

	 return self
end




return Planet