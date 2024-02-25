Object = require "classic/classic"
local Sprite = require "sprite"

Train = Object:extend()

function Train:new()
    self.spacing = 64
    self.sprite = Sprite
end

function Train:draw(x, y)
  local quadIndices = { 64, 73, 64, 75 }
  local spacing = 64
  local headWheelIndex =  77
  local wheelIndex = 76
  local wheelOffsetX = 2
  local wheelOffsetY = 19
  local headWheelOffsetX = 12
  local headWheelOffsetY = 15
  local turretIndex = 78
  local turretOffsetX = 19
  local turretOffsetY = -20

  for i, index in ipairs(quadIndices) do
    --Draws wheels head
    if index == 75 then
      local headWheelPosX = (x + (i - 1) * spacing) + headWheelOffsetX
      local headWheelPosY = y + wheelOffsetY
      self.sprite:draw(headWheelIndex, headWheelPosX, headWheelPosY)
    end

    --Draws wheels body
    if index == 64 or index == 73 then
      local wheelPosX = (x + (i - 1) * spacing) + wheelOffsetX
      local wheelPosY = y + wheelOffsetY
      self.sprite:draw(wheelIndex, wheelPosX, wheelPosY)
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
      local turretPosX = (x + (i - 1) * spacing) + turretOffsetX
      local turretPosY = y + turretOffsetY
      self.sprite:draw(turretIndex, turretPosX, turretPosY)
    end

  end
end

return Train
