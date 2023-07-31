-- Display title image, play title theme and listen for game start

TitleState = Class{__includes = BaseState}

function TitleState:init()
  self.titleImage = love.graphics.newImage("art/title.png")
end

function TitleState:enter()
  music:play()
end

function TitleState:exit()
  music:stop()
end

function TitleState:update()
  if love.keyboard.wasPressed("s") then
    gStateStack:pop()
    gStateStack:push(PlayState())
  end
end

function TitleState:draw()
  love.graphics.draw(self.titleImage, 0, 0)
end