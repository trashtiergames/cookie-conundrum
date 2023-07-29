PresentButton = Class{}

function PresentButton:init(x, y)
  self.x_padding = 16
  self.y_padding = 0
  self.w = 208
  self.h = 150
  self.x = x + self.x_padding
  self.y = y + self.y_padding
  self.img = love.graphics.newImage("art/ui/Present_Bubble.png")
  self.show = false
  self.eviName = ""
end

function PresentButton:update(dt)
  if self.show then
    click = love.mouse.wasPressed(1)
    if click and click.x then
      if clickInside(click, self) then
        -- TODO
        print("You clicked the amazing PRESENT bubble. Good job broski.")
        print("If I had any real job, I would present " .. self.eviName)
      end
    end
  end 
end

function PresentButton:draw()
  if self.show then
    love.graphics.draw(self.img, self.x, self.y)
  end
end