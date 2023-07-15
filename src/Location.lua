Location = Class{}

function Location:init(name, img_path, items)
  self.name = name
  self.img = love.graphics.newImage(img_path)
end

function Location:update(dt) 
    
end

function Location:draw()
  love.graphics.draw(self.img, 0, 0)
end