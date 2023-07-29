-- Get the narrative rolling and render background and UI stuff

PlayState = Class{__includes = BaseState}

function PlayState:init()
  self.flags = {
    crime_scene_discovered = false
  }
  textbox = Textbox()
  healthbar = Healthbar()
end

function PlayState:enter()
  gStateStack:push(PieceChainState({
    p_night,
    p_samsr,
    toggleTextboxPieceState,
    p_wake,
    toggleButtonPieceState,
    toggleHeartsPieceState
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
end

function PlayState:draw()
  currentLocation:draw()
  textbox:draw()
  for i, button in pairs(actionButtons) do
    button:draw()
  end
  healthbar:draw()
end