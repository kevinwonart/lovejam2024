Object = require "classic/classic"
local Sprite = require "sprite"
local Map = require "map"

Title = Object:extend()

function Title:new()
  self.sprite = Sprite
  self.image = love.graphics.newImage("src/title1.png")
  self.map = Map(12,9)
end

function Title:draw()
  self.map:draw(0,0)
  track:draw(416)
  love.graphics.draw(titleLogo, -2, 0)
end

return Title

