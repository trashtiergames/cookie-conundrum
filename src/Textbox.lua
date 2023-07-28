Textbox = Class{}

function Textbox:init()
  self.x = 0
  self.y = 0
  self.img = love.graphics.newImage("art/ui/textbox.png")
  self.show = false
end

function Textbox:draw()
  if self.show then
    love.graphics.draw(self.img, self.x, self.y)
  end
end