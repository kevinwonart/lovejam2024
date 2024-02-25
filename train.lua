Object = require "classic/classic"
local Sprite = require "sprite"

Train = Object:extend()

function Train:new()
    self.quadIndices = {64, 73, 64, 75}
    self.spacing = 64
    self.sprite = Sprite
end

function Train:draw(x, y)
  local quadIndices = { 64, 73, 64, 75}
  local spacing = 64
  for i, index in ipairs(quadIndices) do
      local offsetX = (i - 1) * (self.sprite.image:getWidth() + self.spacing)
      self.sprite:draw(index, x + (i-1) * spacing, y)
  end
end

return Train
