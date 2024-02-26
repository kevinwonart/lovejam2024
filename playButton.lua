Object = require "classic/classic"
local Sprite = require "sprite"

PlayButton = Object:extend()

function PlayButton:new(x, y)
  self.x = x
  self.sprite = Sprite
  self.index = 63
  self.hoverIndex = 78
end

function PlayButton:draw(y)
  self.sprite:draw(self.index, self.x, self.y)
end

return Track

