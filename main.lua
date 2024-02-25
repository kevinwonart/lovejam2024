function love.load()
  Object = require "classic/classic"
  require "sprite"

  sprite = Sprite(64,64)
end

function love.draw()
  sprite:draw(1,100,36)
  sprite:draw(28,100,100)
  sprite:draw(63,136,36)
end


