Object = require "classic/classic"

Sprite = Object:extend()
Sprite.image = love.graphics.newImage("src/sprites/spritesheetalpha-Sheet.png")
local spriteWidth, spriteHeight = 64, 64

--"src/sprites/spritesheetalpha-Sheet.png"




local imageWidth, imageHeight = Sprite.image:getDimensions()

Sprite.quads = {}
local cols = imageWidth / spriteWidth
local rows = imageHeight / spriteHeight

for i = 0, rows - 1 do
  for j = 0, cols - 1 do
    local quad = love.graphics.newQuad(j * spriteWidth, i * spriteHeight, spriteWidth, spriteHeight, imageWidth, imageHeight)
    table.insert(Sprite.quads, quad)
  end
end

function Sprite:draw(index, x, y)
  if index >=1 and index <= #Sprite.quads then
    love.graphics.draw(Sprite.image, Sprite.quads[index], x, y)
  end
end

--[[function Sprite:draw()
  love.graphics.draw(self.image, self.quads[1], 100, 100)
  end
--]]

return Sprite
