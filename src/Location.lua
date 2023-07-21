Location = Class{}

function Location:init(name, img_path, items)
  self.name = name
  self.img = love.graphics.newImage(img_path)
  self.visited = false
end

function Location:update(dt) 
    
end

function Location:draw()
  love.graphics.draw(self.img, 0, 0)
end

function Location:visit()
  self.visited = true
end