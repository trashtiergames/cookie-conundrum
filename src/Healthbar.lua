Healthbar = Class{}

function Healthbar:init()
  self.x = 0
  self.y = 0
  self.w = 32
  self.h = 32
  self.xPad = 16
  self.yPad = 16
  self.img = love.graphics.newImage("art/ui/heart.png")
  self.show = false
  self.hp = 5
end

function Healthbar:draw()
  if self.show then
    local heartX = self.x + self.xPad
    local heartY = self.y + self.yPad
    for i=1,self.hp do
      love.graphics.draw(self.img, heartX, heartY)
      heartY = heartY + self.h + self.yPad
    end
  end
end