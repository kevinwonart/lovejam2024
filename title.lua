Object = require "classic/classic"
local Sprite = require "sprite"
local Map = require "map"

Title = Object:extend()

function Title:new(onPlayPressed)
  self.sprite = Sprite
  self.image = love.graphics.newImage("src/title1.png")
  self.map = Map(12,9)
  self.playButtonIndex = 63
  self.playButtonHoverIndex = 62
  self.playButtonX = 352
  self.playButtonY = 240
  self.onPlayPressed = onPlayPressed
end

function Title:mousepressed(x, y, button)
  local isHovering = x > self.playButtonX and x < self.playButtonX + 64 and
                     y > self.playButtonY and y < self.playButtonY + 64

  if isHovering and button == 1 then
    if self.onPlayPressed then 
      self.onPlayPressed() 
    end
  end 
end

function Title:draw()
  local mx, my = love.mouse.getPosition()
  local isHovering = mx > self.playButtonX and mx < self.playButtonX + 64 and
                     my > self.playButtonY and my < self.playButtonY + 64
  self.map:draw(0,0)
  track:draw(416)
  love.graphics.draw(titleLogo, -2, 0)

  if isHovering then
    self.sprite:draw(self.playButtonIndex, self.playButtonX, self.playButtonY)
    self.sprite:draw(self.playButtonHoverIndex, self.playButtonX, self.playButtonY)
  else
    self.sprite:draw(self.playButtonIndex, self.playButtonX, self.playButtonY)
  end
end

return Title

