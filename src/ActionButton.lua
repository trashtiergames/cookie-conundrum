ActionButton = Class{}

function ActionButton:init(type, position)
	self.x_padding = 64
	self.y_padding = 16
	self.type = type
	self.position = position
	self.w = 240
	self.h = 80
	self.x = (self.x_padding * self.position) + self.w * (self.position - 1)
	self.y = self.y_padding
	self.show = true
	self.onClick = function() end

	if self.type == "move" then
		self.img_path = "art/ui/Move_Button.png"
		self.onClick = function()
			gStateStack:push(MoveMenuState())
		end
	elseif self.type == "investigate" then
		self.img_path = "art/ui/Investigate_Button.png"
		self.onClick = function()
			gStateStack:push(InvestigateState())
		end
	elseif self.type == "present" then
		self.img_path = "art/ui/Present_Button.png"
	elseif self.type == "talk" then
		self.img_path = "art/ui/Talk_Button.png"
	elseif self.type == "evidence" then
		self.img_path = "art/ui/Evidence_Button.png"
		self.onClick = function()
			gStateStack:push(EviMenuState())
		end
	end
	self.img = love.graphics.newImage(self.img_path)
end

function ActionButton:update(dt) 
  click = love.mouse.wasPressed(1)
  if click and click.x then
    if clickInside(click, self) then
      self.onClick()
    end
  end
end

function ActionButton:draw()
	if self.show then
		love.graphics.draw(self.img, self.x, self.y)
	end
end