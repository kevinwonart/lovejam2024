--Sprite = require "sprite"
function love.load()
  Object = require "classic/classic"
  require "train"
  player = Train()
end

function love.draw()
  --[[Sprite:draw(1,100,36)
  Sprite:draw(28,100,100)
  Sprite:draw(63,136,36)
  --]]
  --Sprite:draw(28, 100, 100)
  player:draw(200,100)
  player:draw(200,200)
end


