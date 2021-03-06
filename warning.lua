require "collisions"

local warning = {}
warning.__index = warning

function newWarning(y)
	local n = {}
	n.type = "warning"
	n.width = 23
	n.height = 19
	n.x = SCREEN_WIDTH - 25
	n.y = y
	n.z = 4
	n.yspeed = 0
	n.t = 0

	n.anim = newAnimation(lutro.graphics.newImage(
			"assets/warning.png"),  23, 19, 1, 5)

	return setmetatable(n, warning)
end

function warning:update(dt)
	self.anim:update(dt)

	self.t = self.t + dt

	if self.t > 1 then
		for i=1, #entities do
			if entities[i] == self then
				table.remove(entities, i)
			end
		end
	end
end

function warning:draw()
	self.anim:draw(self.x, self.y)
end

function warning:on_collide(e1, e2, dx, dy)
end
