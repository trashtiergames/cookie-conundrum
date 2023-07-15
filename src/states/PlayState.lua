-- Display title image, play title theme and listen for game start

PlayState = Class{__includes = BaseState}

function PlayState:init()
  self.backgrounds = {
    ["sams_room"] = love.graphics.newImage("art/bg/sams_room.png"),
    ["kitchen"] = love.graphics.newImage("art/bg/kitchen.png"),
    ["emilias_door"] = love.graphics.newImage("art/bg/emilias_door.png"),
    ["aprils_door"] = love.graphics.newImage("art/bg/aprils_door.png"),
    ["balcony"] = love.graphics.newImage("art/bg/balcony.png"),
    ["darkness"] = love.graphics.newImage("art/bg/darkness.png")
  }
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
  self.currentBackground = self.backgrounds.darkness
  options = {
    messageColor = {1, 1, 1, 1},
    oncomplete = function(dialog)
      self.currentBackground = self.backgrounds.sams_room
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
    Button("move", 1),
    Button("talk", 2),
    Button("investigate", 3),
    Button("evidence", 4)
  }
  for i, button in pairs(self.buttons) do
    button.show = false
  end
end

function PlayState:exit()
end

function PlayState:update()
end

function PlayState:render()
  love.graphics.draw(self.currentBackground, 0, 0)
  for i, button in pairs(self.buttons) do
    button:draw()
  end
end