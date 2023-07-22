-- Walks through narrative pieces and pops itself when done

PieceChainState = Class{__includes = BaseState}

function PieceChainState:init(pieces)
  self.pieces = pieces
  self.index = 1
  self.done = false
end

function PieceChainState:enter()
  if #self.pieces < 1 then
    print("No pieces in PieceChainState. Popping.")
    gStateStack:pop()
  else
    self.pieces[self.index]:enter()
  end
end

function PieceChainState:update(dt)
  if self.pieces[self.index].done then
    self:nextPiece()
    if self.done then
      return
    end
  end
  self.pieces[self.index]:update(dt)
end

function PieceChainState:draw()
  self.pieces[self.index]:draw()
end

function PieceChainState:nextPiece()
  self.pieces[self.index]:exit()
  self.index = self.index + 1
  if self.index > #self.pieces then
    gStateStack:pop()
    self.done = true
  else
    self.pieces[self.index]:enter()
  end
end