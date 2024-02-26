--enemy:draw(x,109)
--player:draw(x,397)
--Sprite = require "sprite"
local gameState = "title"

function love.load()
  Object = require "classic/classic"
  require "train"
  require "map"
  require "track"
  require "title"
  require "game"

  math.randomseed(os.time())
  titleLogo = love.graphics.newImage("src/title1.png")
  title = Title(function()
    gameState = "game"
    print("works")
  end)
  player = Train(-224, 397)
  map = Map(12, 9)--12x64,9x64 tiles
  track = Track()
  game = Game(player)
end

function love.update(dt)
  if gameState == "title" then
    --title:update(dt)
  elseif gameState == "game" then
    game:update(dt)
  end
end

function love.draw()
  --[[Sprite:draw(1,100,36)
  Sprite:draw(28,100,100)
  Sprite:draw(63,136,36)
  --]]
  --Sprite:draw(28, 100, 100)
  if gameState == "title" then
    title:draw()
  elseif gameState == "game" then
    game:draw(player)
  end
end

function love.mousepressed(x, y, button)
  if gameState == "title" then
    title:mousepressed(x, y, button)
  end
end
