-- Display title image, play title theme and listen for game start

PlayState = Class{__includes = BaseState}

function PlayState:init()
end

function PlayState:enter()
  dialogues = {
    "Oh man. What a night…",
    "…",
    "What are those?",
    "…",
    "I really need this right now.",
    "crunch crunch crunch",
    "CRUNCH CRUNCH CRUNCH"
  }
  
  options = {
    messageColor = {1, 1, 1, 1},
    oncomplete = function(dialog)
      currentLocation = locations.sams_room
      for i, button in pairs(self.buttons) do
        button.show = true
      end
      Talkies.say("Sam", {
        "*yawn*",
        "Oh? Did I fall asleep like this yesterday?",
        "I left those cookies out to cool yesterday, I should really put them away before anything happens to them.",
        "I should MOVE to the kitchen."
      })
    end
  }
  
  Talkies.say("???", dialogues, options)
  self.buttons = {
    ActionButton("move", 1),
    ActionButton("talk", 2),
    ActionButton("investigate", 3),
    ActionButton("evidence", 4)
  }
  for i, button in pairs(self.buttons) do
    button.show = false
  end
end

function PlayState:exit()
end

function PlayState:update(dt)
  for _, button in pairs(self.buttons) do
    button:update()
  end

  if love.keyboard.wasPressed("space") then Talkies.onAction()
  elseif love.keyboard.wasPressed("up") then Talkies.prevOption()
  elseif love.keyboard.wasPressed("down") then Talkies.nextOption()
  end
  Talkies.update(dt)
end

function PlayState:render()
  currentLocation:draw()
  for i, button in pairs(self.buttons) do
    button:draw()
  end
  Talkies.draw()
end