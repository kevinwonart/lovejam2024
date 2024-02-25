Object = require "classic/classic"
local Sprite = require "sprite"

Map = Object:extend()

function Map:new()
    self.quadIndices = {1,4,5,6,7,11}
    self.spacing = 64
    self.sprite = Sprite
end

function Map:draw(x, y)
  local quadIndices = { 64, 73, 64, 75 }
  local spacing = 64
  local wheelIndex = 92

  local wheelOffsetX = 0
  local wheelOffsetY = 12

  for i, index in ipairs(quadIndices) do
      local offsetX = (i - 1) * (self.sprite.image:getWidth() + self.spacing)
      self.sprite:draw(index, x + (i-1) * spacing, y)

      local wheelPosX = offsetX + wheelOffsetX
      local wheelPosY = y + wheelOffsetY
      self.sprite:draw(wheelIndex, wheelPosX, wheelPosY)
  end
end


