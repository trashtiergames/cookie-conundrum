-- Toggles buttons between shown and hidden

ToggleBtnPieceState = Class{__includes = PieceState}

function ToggleBtnPieceState:init()
  PieceState:init() 
end

function ToggleBtnPieceState:enter()
  for _, button in pairs(actionButtons) do
    button.show = not button.show
  end
  self.done = true
end