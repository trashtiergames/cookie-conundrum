LocationButton = Class{}

function LocationButton:init(position, location)
	self.x_padding = 20
	self.y_padding = 20
	self.name = location.name
	self.img = love.graphics.newImage("art/ui/Location_Frame.png")
	self.locImg = location.img
	self.locImgPadX = 10
	self.locImgPadY = 7
	self.descrPadX = 0
	self.descrPadY = 2
	self.textW  = quicksandSmall:getWidth(self.name)
	self.position = position
	self.w = 340
	self.h = 220
	
	self.x = 290
	if position == 2 or position == 4 then 
		self.x = self.x + self.w + self.x_padding
	end

	self.y = 180
	if position == 3 or position == 4 then 
		self.y = self.y + self.h + self.y_padding
	end

	self.descrX = self.x + self.locImgPadX + self.descrPadX
	self.descrY = self.y + self.locImgPadY + 180 + self.descrPadY

	self.show = true
	self.onClick = function() end

end

function LocationButton:update(dt) 
  click = love.mouse.wasPressed(1)
  if click and click.x then
    if clickInside(click, self) then
      self.onClick()
    end
  end
end

function LocationButton:draw()
	if self.show then
		love.graphics.draw(self.img, self.x, self.y)
		love.graphics.draw(
			self.locImg, 
			self.x + self.locImgPadX, 
			self.y + self.locImgPadY, 
			0, 0.25, 0.25
		)
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.print(
				self.name,
				quicksandSmall,
				self.descrX + (320 / 2),
				self.descrY,
				0, 1, 1,
				self.textW / 2
			)
		love.graphics.setColor(1, 1, 1, 1)
	end
end