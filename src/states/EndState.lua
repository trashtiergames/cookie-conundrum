-- Display title image, play title theme and listen for game start

EndState = Class{__includes = BaseState}

function EndState:init()
  self.titleImage = love.graphics.newImage("art/cookies_restored.png")
end

function EndState:enter()
end

function EndState:exit()
end

function EndState:update()
  if love.keyboard.wasPressed("q") then
    love.event.quit()
  end
end

function EndState:draw()
  love.graphics.draw(self.titleImage, 0, 0)
end