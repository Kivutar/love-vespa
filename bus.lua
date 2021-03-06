require "collisions"

local bus = {}
bus.__index = bus

function newBus(x, y, speed)
	local n = {}
	n.type = "bus"
	n.width = 113
	n.height = 35
	n.x = x
	n.y = y
	n.z = 1
	n.speed = speed

	n.stance = "normal"

	colors = {"white", "red"}

	n.color = colors[math.random(#colors)]

	n.anim = newAnimation(lutro.graphics.newImage(
			"assets/bus_" .. n.color ..".png"), 113, 55, 1, 10)

	return setmetatable(n, bus)
end

function bus:update(dt)
	self.x = self.x + self.speed
	self.anim:update(dt)

	if self.x < -self.width then
		for i=1, #entities do
			if entities[i] == self then
				table.remove(entities, i)
			end
		end
	end
end

function bus:draw()
	self.anim:draw(self.x, self.y - 20)
end

function bus:on_collide(e1, e2, dx, dy)
end
