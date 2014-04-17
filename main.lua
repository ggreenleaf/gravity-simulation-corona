-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


physics = require("physics")
_H = display.contentHeight
_W = display.contentWidth
_Radius  = 20

planet = display.newCircle(_W/2,_H/2,_Radius)
physics.addBody(planet,"dynamic",{radius=_Radis,density=20.0})
planet.gravityScale=0

