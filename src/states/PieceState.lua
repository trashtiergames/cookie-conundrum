-- Superclass for a small piece of game narrative (like dialogue or getting
-- an item)

PieceState = Class{__includes = BaseState}

function PieceState:init()
  self.done = false
end