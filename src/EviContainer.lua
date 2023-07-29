-- Evidence container to check for clicks

EviContainer = Class{}

EviContainer.w = 165
EviContainer.h = 165

function EviContainer:init(evidence, x, y)
  self.x = x
  self.y = y
  self.w = EviContainer.w
  self.h = EviContainer.h
  self.evidence = evidence
end

function EviContainer:update(dt) 
  
end

function EviContainer:draw()
  love.graphics.draw(self.evidence.img, self.x, self.y)
end