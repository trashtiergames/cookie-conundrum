-- Display title image, play title theme and listen for game start

PlayState = Class{__includes = BaseState}

function PlayState:init()
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
end

function PlayState:draw()
  currentLocation:draw()
  for i, button in pairs(actionButtons) do
    button:draw()
  end
end