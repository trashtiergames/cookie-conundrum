-- Investigate the scene

InvestigateState = Class{__includes = BaseState}

function InvestigateState:init()
end

function InvestigateState:enter()
  local handCursor = love.mouse.getSystemCursor("hand")
  love.mouse.setCursor(handCursor)
end

function InvestigateState:exit()
  local arrowCursor = love.mouse.getSystemCursor("arrow")
  love.mouse.setCursor(arrowCursor)
end

function InvestigateState:update(dt)
  currentLocation:update(dt)
end

function InvestigateState:draw()
end