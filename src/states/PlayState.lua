-- Display title image, play title theme and listen for game start

PlayState = Class{__includes = BaseState}

function PlayState:init()
  self.backgrounds = {
    ["sams_room"] = love.graphics.newImage("art/sams_room.png"),
    ["kitchen"] = love.graphics.newImage("art/kitchen.png"),
    ["emilias_door"] = love.graphics.newImage("art/emilias_door.png"),
    ["aprils_door"] = love.graphics.newImage("art/aprils_door.png"),
    ["balcony"] = love.graphics.newImage("art/balcony.png"),
    ["darkness"] = love.graphics.newImage("art/darkness.png")
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
  Talkies.say("???", dialogues, {messageColor = {1, 1, 1, 1}})
end

function PlayState:exit()
end

function PlayState:update()
end

function PlayState:render()
  love.graphics.draw(self.currentBackground, 0, 0)
end