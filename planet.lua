


local Planet = {}
local planetMT = {__index = Planet}

--spawn a new satellite with center of object at (x,y), 
--radius=r and density=d


function Planet:new(x,y,r,m)
	 local self = {}
	 setmetatable(self,planetMT)


	  --group holds planet and gravity field object
	 self.group = display.newGroup()

	 self.gravField = display.newCircle(x,y,r*5);  self.gravField.alpha = 0.3
	 self.gravField.name = "field"
	 physics.addBody(self.gravField,"static",{isSensor=true,radius=r*5})


	 self.planetObj = display.newCircle(x,y,r)
	 physics.addBody(self.planetObj,"static",{radius=r})
	 self.planetObj.mass = m
	 self.planetObj.name = "planet"
	 self.planetObj.gravityScale = 0
	 --link the gravity field to the planet object
	 self.gravField.link = self.planetObj

	 return self
end




return Planet