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
  end)
  player = Train()
  map = Map(12, 9)--12x64,9x64 tiles
  track = Track()
  --
  --gameMap = Map()
end

function love.update(dt)
  if gameState == "title" then
    --gameTitle.call
  elseif gameState == "game" then
    --gameState.call
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
    game:draw()
  end
end

function love.mousepressed(x, y, button)
  if gameState == "title" then
    title:mousepressed(x, y, button)
  end
end
