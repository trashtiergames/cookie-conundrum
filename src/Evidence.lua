-- Evidence item that can be obtained, viewed and presented

Evidence = Class{}

function Evidence:init(name, description, img)
  self.name = name
  self.description = description
  self.img = img
  self.w = 165
  self.h = 165
end

function Evidence:update(dt) 
  
end

function Evidence:draw()
  
end