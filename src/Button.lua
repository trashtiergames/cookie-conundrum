Button = Class{}

function Button:init(type, position)
    self.x_padding = 64
    self.y_padding = 16
    self.type = type
    self.position = position
    self.w = 240
    self.h = 80
    self.x = (self.x_padding * self.position) + self.w * (self.position - 1)
    self.y = self.y_padding
    self.show = true

    if self.type == "move" then
        self.img_path = "art/buttons/Move_Button.png"
    elseif self.type == "investigate" then
        self.img_path = "art/buttons/Investigate_Button.png"
    elseif self.type == "present" then
        self.img_path = "art/buttons/Present_Button.png"
    elseif self.type == "talk" then
        self.img_path = "art/buttons/Talk_Button.png"
    elseif self.type == "evidence" then
        self.img_path = "art/buttons/Evidence_Button.png"
    end
    self.img = love.graphics.newImage(self.img_path)
end

function Button:update(dt) 
    
end

function Button:draw()
    if self.show then
        love.graphics.draw(self.img, self.x, self.y)
    end
end