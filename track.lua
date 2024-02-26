Object = require "classic/classic"
local Sprite = require "sprite"

Track = Object:extend()

function Track:new()
  self.spacing = 64
  self.sprite = Sprite
  self.index = 66
end

function Track:draw(y)
  for i = 0,11 do
    self.sprite:draw(self.index, i * self.spacing, y)
  end
end

return Track
