Object = require "classic/classic"
local Sprite = require "sprite"

Game = Object:extend()

function Game:new(player)
  self.sprite = Sprite
  self.map = Map(12,9)
  self.player = player
end

function Game:update(dt)
  if self.player and self.player.x < 180 then
    self.player.x = self.player.x + self.player.speed * dt
  end
end

function Game:draw()
  self.map:draw(0,0)
  track:draw(128)
  track:draw(416)
  player:draw()
end

return Game

