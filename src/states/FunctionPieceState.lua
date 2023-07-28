-- Executes a function and sets self to done

FunctionPieceState = Class{__includes = PieceState}

function FunctionPieceState:init(functionToExecute)
  PieceState:init() 
  self.functionToExecute = functionToExecute
end

function FunctionPieceState:enter()
  self.functionToExecute()
  self.done = true
end