-- Changes background

MovePieceState = Class{__includes = PieceState}

function MovePieceState:init(locationName)
  PieceState:init()
  self.locationName = locationName
end

function MovePieceState:enter()
  currentLocation = locations[self.locationName]
  self.done = true
end