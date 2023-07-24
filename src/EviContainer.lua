-- Evidence container to check for clicks

EviContainer = Class{}

function EviContainer:init(evidence, x, y)
  self.x = x
  self.y = y
  self.w = 165
  self.h = 165
  self.evidence = evidence
end

function EviContainer:update(dt) 
  
end

function EviContainer:draw()
  love.graphics.draw(self.evidence.img, self.x, self.y)
end