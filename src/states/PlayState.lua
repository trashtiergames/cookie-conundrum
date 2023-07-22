-- Display title image, play title theme and listen for game start

PlayState = Class{__includes = BaseState}

function PlayState:init()
  self.flags = {
    crime_scene_discovered = false
  }
end

function PlayState:enter()
  gStateStack:push(PieceChainState({
    p_night,
    p_samsr,
    p_wake,
    ToggleBtnPieceState()
  }))
end

function PlayState:exit()
end

function PlayState:update(dt)
  for _, button in pairs(actionButtons) do
    if button.show then
      button:update()
    end
  end
  if currentLocation.name == "Kitchen" 
      and not self.flags.crime_scene_discovered then
    self.flags.crime_scene_discovered = true
    gStateStack:push(PieceChainState({
      p_disc
    }))
  end
  currentLocation:update(dt)
end

function PlayState:draw()
  currentLocation:draw()
  for i, button in pairs(actionButtons) do
    button:draw()
  end
end