Object = require "classic/classic"

Sprite = Object:extend()

--"src/sprites/spritesheetalpha-Sheet.png"

function Sprite:new(spriteWidth, spriteHeight)
  self.image = love.graphics.newImage("src/sprites/spritesheetalpha-Sheet.png")
  local imageWidth, imageHeight = self.image:getDimensions()

  self.quads = {}
  local cols = imageWidth / spriteWidth
  local rows = imageHeight / spriteHeight

  for i = 0, rows - 1 do
    for j = 0, cols - 1 do
      local quad = love.graphics.newQuad(j * spriteWidth, i * spriteHeight, spriteWidth, spriteHeight, imageWidth, imageHeight)
      table.insert(self.quads, quad)
    end
  end
end

function Sprite:draw(index, x, y)
  if index >=1 and index <= #self.quads then
    love.graphics.draw(self.image, self.quads[index], x, y)
  end
end
