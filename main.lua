function love.load()
  Object = require "classic/classic"
  require "sprite"

  sprite = Sprite(64,64)
end

function love.draw()
  sprite:draw(91,100,100)
end


