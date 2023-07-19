-- Display menu for moving between locations

MoveMenuState = Class{__includes = BaseState}

function MoveMenuState:init()
  self.x = 240
  self.y = 60
  self.w = 800
  self.h = 600
  self.img = love.graphics.newImage("art/ui/Move_Menu.png")
  self.cancelButton = CancelButton(self.x + 700, self.y)
  self.locationButtons = {
    LocationButton(1, locations["kitchen"]),
    LocationButton(2, locations["aprils_door"]),
    LocationButton(3, locations["emilias_door"]),
    LocationButton(4, locations["balcony"])
  }
end

function MoveMenuState:enter()
  if currentLocation.name == "Sam's Room" then
    self.locationButtons = {
      LocationButton(1, locations["kitchen"])
    }
  elseif currentLocation.name == "Kitchen" then
    self.locationButtons = {
      LocationButton(1, locations["sams_room"]),
      LocationButton(2, locations["aprils_door"]),
      LocationButton(3, locations["emilias_door"]),
      LocationButton(4, locations["balcony"])
    }
  elseif currentLocation.name == "April's Door" then
    self.locationButtons = {
      LocationButton(1, locations["kitchen"]),
      LocationButton(3, locations["emilias_door"])
    }
  elseif currentLocation.name == "Emilia's Door" then
    self.locationButtons = {
      LocationButton(1, locations["kitchen"]),
      LocationButton(2, locations["aprils_door"])
    }
  elseif currentLocation.name == "Balcony" then
    self.locationButtons = {
      LocationButton(1, locations["kitchen"])
    }
  end
end

function MoveMenuState:exit()

end

function MoveMenuState:update(dt)
  self.cancelButton:update()
  for _, btn in pairs(self.locationButtons) do
    btn:update()
  end
end

function MoveMenuState:render()
  love.graphics.draw(self.img, self.x, self.y)
  self.cancelButton:draw()
  for _, btn in pairs(self.locationButtons) do
    btn:draw()
  end
end