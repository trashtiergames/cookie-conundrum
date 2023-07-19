CancelButton = Class{}

function CancelButton:init(x, y)
  self.x_padding = 5
  self.y_padding = 10
  self.w = 80
  self.h = 80
  self.x = x + self.x_padding
  self.y = y + self.y_padding
  self.img = love.graphics.newImage("art/ui/Cancel_Button.png")
end

function CancelButton:update(dt) 
  click = love.mouse.wasPressed(1)
  if click and click.x then
    if clickInside(click, self) then
      gStateStack:pop()
    end
  end
end

function CancelButton:draw()
  love.graphics.draw(self.img, self.x, self.y)
end