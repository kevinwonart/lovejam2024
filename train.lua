Object = require "classic/classic"
local Sprite = require "sprite"

Train = Object:extend()

function Train:new()
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
end

function Train:draw(x, y)
  for i, index in ipairs(quadIndices) do
    --Draws wheels head
    if index == 75 then
      self.headWheelPosX = (x + (i - 1) * spacing) + self.headWheelOffsetX
      self.headWheelPosY = y + wheelOffsetY
      self.sprite:draw(self.headWheelIndex, self.headWheelPosX, self.headWheelPosY)
    end

    --Draws wheels body
    if index == 64 or index == 73 then
      local wheelPosX = (x + (i - 1) * spacing) + self.wheelOffsetX
      local wheelPosY = y + self.wheelOffsetY
      self.sprite:draw(self.wheelIndex, self.wheelPosX, self.wheelPosY)
    end
    --[[
      --Debug console:
        print("cart posx: " .. (x + (i - 1) * spacing))
        print("cart posy: " .. y)
        print("wheel posx: " .. wheelOffsetX
        print("wheel posy: " .. wheelPosY)
    --]]

    ---Draws Train Body
    self.sprite:draw(index, x + (i - 1) * spacing, y)

    --Draws turret
    if index == 73 then
      local turretPosX = (x + (i - 1) * spacing) + self.turretOffsetX
      local turretPosY = y + self.turretOffsetY
      self.sprite:draw(self.turretIndex, turretPosX, turretPosY)
    end

  end
end

return Train
