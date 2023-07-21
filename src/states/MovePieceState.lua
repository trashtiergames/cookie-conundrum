-- Changes background

MovePieceState = Class{__includes = PieceState}

function MovePieceState:init(locationName)
  PieceState:init()
  self.locationName = locationName
end

function MovePieceState:enter()
  currentLocation = locations[self.locationName]
  currentLocation:visit()
  self.done = true
end