-- Emilia and April

Character = Class{}

function Character:init(name, dialogueOptions)
  self.name = name
  -- self.img = love.graphics.newImage(imgPath)
  self.dialOptions = dialogueOptions
  self.expectedEvi = ""
end

function Character:update(dt) 
  
end

function Character:draw()
  
end

function Character:checkGameOver()
  if healthbar.hp < 1 then
    print("Game over detected")
    gStateStack:push(PieceChainState({
      TextPieceState(
        self.name,
        "This has really ruined my whole day. I don't think it's good for any of us to keep fighting over this. Just let it be."
      ),
      TextPieceState(
        "Sam",
        "I guess I didn't really think about what I was saying..."
      ),
      TextPieceState(
        "",
        "Game over."
      ),
      FunctionPieceState(
        function()
          love.event.quit()
        end
      )
    }))
  end
end

function Character:correctEviResponse()
  gStateStack:push(PieceChainState({
    TextPieceState(
      self.name,
      "This is correct evidence."
    )
  }))
end

function Character:incorrectEviResponse()
  gStateStack:push(PieceChainState({
    TextPieceState(
      self.name,
      "Why are you showing me this? This has nothing to do with what we were talking about."
    ),
    FunctionPieceState(
      function()
        healthbar.hp = healthbar.hp - 1
        self:checkGameOver()
      end
    )
  }))
end

function Character:resetSuccessFunc()
  self.correctEviResponse = function(self) end
end

function Character:receiveEvi(eviName)
  if eviName == self.expectedEvi then
    self:correctEviResponse()
    self:resetSuccessFunc()
  else
    self:incorrectEviResponse()
  end
end

function Character:setExpectations(eviName, onCorrectFunc)
  self.expectedEvi = eviName
  self.correctEviResponse = copyTable(onCorrectFunc)
end