-- Plays when getting evidence

EviPieceState = Class{__includes = PieceState}

function EviPieceState:init(message, name, description, imgPath)
  PieceState.init(self)
  self.message = message
  self.name = name
  self.description = description
  self.img = love.graphics.newImage(imgPath)
  self.iconSide = 165
  self.iconPad = 5
  self.iconX = 1280 - self.iconSide - (2 * self.iconPad)
  self.iconY = 720 - self.iconSide - (2 * self.iconPad)
end

function EviPieceState:enter()
  Talkies.clearMessages()
  self.dialogue = Talkies.say("Sam", self.message)
  table.insert(inventory, Evidence(name, description, imgPath))
end

function EviPieceState:update(dt)
  if love.keyboard.wasPressed("space") then Talkies.onAction()
  elseif love.keyboard.wasPressed("up") then Talkies.prevOption()
  elseif love.keyboard.wasPressed("down") then Talkies.nextOption()
  end
  Talkies.update(dt)
  if not self.dialogue:isShown() then 
    self.done = true
  end
end

function EviPieceState:draw()
  Talkies.draw()
  love.graphics.draw(self.img, self.iconX, self.iconY)
end