require "collisions"

local hole_up = {}
hole_up.__index = hole_up

function newHoleUp(x)
	local n = {}
	n.type = "hole"
	n.width = 256 - 64
	n.height = 50
	n.x = x + SCREEN_WIDTH
	n.y = 78
	n.z = 0

	n.anim = newAnimation(lutro.graphics.newImage(
			"assets/hole_up.png"),  256, 66, 1, 10)

	return setmetatable(n, hole_up)
end

function hole_up:update(dt)
	self.x = self.x - SPEED

	if self.x < -self.width then
		for i=1, #entities do
			if entities[i] == self then
				table.remove(entities, i)
			end
		end
	end
end

function hole_up:draw()
	self.anim:draw(self.x - 32, self.y)
end

function hole_up:on_collide(e1, e2, dx, dy)
end
