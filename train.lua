Object = require "classic/classic"
local Sprite = require "sprite"

Train = Object:extend()

function Train:new(x, y)
  self.x = x
  self.y = y
  self.spacing = 64
  self.sprite = Sprite
  self.quadIndices = { 64, 73, 64, 75 }
  self.spacing = 64
  self.headWheelIndex =  76
  self.wheelIndex = 77
  self.wheelOffsetX = 6
  self.wheelOffsetY = 19
  self.headWheelOffsetX = 5
  self.headWheelOffsetY = 19
  self.turretIndex = 78
  self.turretOffsetX = 19
  self.turretOffsetY = -20
  self.speed = 120
end

function Train:draw()
  for i, index in ipairs(self.quadIndices) do
    --Draws wheels head
    if index == 75 then
      local headWheelPosX = (self.x + (i - 1) * self.spacing) + self.headWheelOffsetX
      local headWheelPosY = self.y + self.wheelOffsetY
      self.sprite:draw(self.headWheelIndex, headWheelPosX, headWheelPosY)
    end

    --Draws wheels body
    if index == 64 or index == 73 then
      local wheelPosX = (self.x + (i - 1) * self.spacing) + self.wheelOffsetX
      local wheelPosY = self.y + self.wheelOffsetY
      self.sprite:draw(self.wheelIndex, wheelPosX, wheelPosY)
    end

    ---Draws Train Body
    self.sprite:draw(index, self.x + (i - 1) * self.spacing, self.y)

    --Draws turret
    if index == 73 then
      local turretPosX = (self.x + (i - 1) * self.spacing) + self.turretOffsetX
      local turretPosY = self.y + self.turretOffsetY
      self.sprite:draw(self.turretIndex, turretPosX, turretPosY)
    end
  end
end

return Train
