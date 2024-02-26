Object = require "classic/classic"
local Sprite = require "sprite"
local Map = require "map"

Game = Object:extend()

function Game:new()
  self.sprite = Sprite
  self.map = Map(12,9)

end

function Game:draw()
  self.map:draw(0,0)
  track:draw(128)
  track:draw(416)
end

return Game

