-- Display title image, play title theme and listen for game start

PlayState = Class{__includes = BaseState}

function PlayState:init()
  locations = {
    ["sams_room"] =     Location("Sam's Room",    "art/bg/sams_room.png", {}),
    ["kitchen"] =       Location("Kitchen",    "art/bg/kitchen.png", {}),
    ["emilias_door"] =  Location("Emilia's Door", "art/bg/emilias_door.png", {}),
    ["aprils_door"] =   Location("April's Door",  "art/bg/aprils_door.png", {}),
    ["balcony"] =       Location("Balcony",       "art/bg/balcony.png", {}),
    ["darkness"] =      Location("Darkness",      "art/bg/darkness.png", {})
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
  self.currentLocation = locations.darkness
  options = {
    messageColor = {1, 1, 1, 1},
    oncomplete = function(dialog)
      self.currentLocation = locations.sams_room
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

function PlayState:update()
  for _, button in pairs(self.buttons) do
    button:update()
  end
end

function PlayState:render()
  self.currentLocation:draw()
  for i, button in pairs(self.buttons) do
    button:draw()
  end
end