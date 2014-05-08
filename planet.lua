


local Planet = {}
local planetMT = {__index = Planet}

--spawn a new satellite with center of object at (x,y), 
--radius=r and density=d
--Planet.count = 0

function Planet:new(x,y,r)
	 local self = {}
	 setmetatable(self,planetMT)


	  --group holds planet and gravity field object
	 self.group = display.newGroup()

	 self.gravField = display.newCircle(x,y,r*3);  self.gravField.alpha = 0.0
	 --self.count = self.count + 1
	 self.gravField.name = "field"--..Planet.count
	 physics.addBody(self.gravField,"static",{isSensor=true,radius=r*3})


	 self.planetObj = display.newCircle(x,y,r)
	 physics.addBody(self.planetObj,"static",{radius=r})
	 self.planetObj.mass = r*20
	 self.planetObj.name = "planet"
	 self.planetObj.gravityScale = 0
	 --link the gravity field to the planet object
	 self.gravField.link = self.planetObj
	 
	 local function fieldDisplay ()
	 	local field  = display.newCircle(x,y,r); field.alpha = 0.2
	 	field:toBack()
	 	field:setFillColor(0,255,0)
	 	transition.scaleBy(field,{xScale=2.0,yScale=2.0,time=1500})
	 	transition.fadeOut(field,{time=1500})
	 end
	 timer.performWithDelay(1000,fieldDisplay,-1)
	 return self
end




return Planet