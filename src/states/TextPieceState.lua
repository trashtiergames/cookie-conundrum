-- Presents dialogue

TextPieceState = Class{__includes = PieceState}

function TextPieceState:init(title, messages, config)
  PieceState.init(self)
  self.title = title
  self.messages = messages
  self.config = config
end

function TextPieceState:enter()
  Talkies.clearMessages()
  self.dialogue = Talkies.say(self.title, self.messages, self.config)
end

function TextPieceState:update(dt)
  if love.keyboard.wasPressed("space") then Talkies.onAction()
  elseif love.keyboard.wasPressed("up") then Talkies.prevOption()
  elseif love.keyboard.wasPressed("down") then Talkies.nextOption()
  end
  Talkies.update(dt)
  if not self.dialogue:isShown() then 
    self.done = true
  end
end

function TextPieceState:draw()
  Talkies.draw()
end