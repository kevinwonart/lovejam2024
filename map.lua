Object = require "classic/classic"
local Sprite = require "sprite"

Map = Object:extend()

function Map:new(width, height)
  self.width = width
  self.height = height
  self.quadIndices = {1,1,1,6,7,7}
  self.tileSize = 64
  self.sprite = Sprite
  self.grid = self:generateGrid()
end

function Map:generateWeightedIndex()
  local weights = { 75, 5, 5, 5, 5, 5 }
  local sum = 0
  local cumulativeWeights = {}

  for i, weight in ipairs(weights) do
    sum = sum + weight
    table.insert(cumulativeWeights, sum)
  end

  local rand = math.random(0, sum)
  for i, cumWeight in ipairs(cumulativeWeights) do
    if rand <= cumWeight then
      return self.quadIndices[i]
    end
  end
end

function Map:generateGrid()
  local grid = {}
  for y = 1, self.height do
      grid[y] = {}
      for x = 1, self.width do
        grid[y][x] = self:generateWeightedIndex()
      end
  end
  return grid
end

function Map:draw(xOffset, yOffset)
  for y = 1, #self.grid do
    for x = 1, #self.grid[y] do
      local quadIndex = self.grid[y][x]
      local posX = xOffset + (x - 1) * self.tileSize
      local posY = yOffset + (y - 1) * self.tileSize
      self.sprite:draw(quadIndex, posX, posY)
    end
  end
end

return Map
