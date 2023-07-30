-- An area that can be clicked while investigating

Clickable = Class{}

function Clickable:init(x, y, w, h, consumable, pieceChainState)
  -- Pass in a pieceChainState that will play when the clickable is clicked
  self.x = x
  self.y = y 
  self.w = w
  self.h = h 
  self.consumable = consumable
  self.consumed = false
  self.pieceChainState = pieceChainState
  self.debug = true
end

function Clickable:update(dt) 
  click = love.mouse.wasPressed(1)
  if click and click.x then
    if clickInside(click, self) then
      self:onClick()
    end
  end
end

function Clickable:draw()
  if self.debug == true then
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
  end
end

function Clickable:onClick()
  if self.consumable then
    self.consumed = true
  end
  gStateStack:push(copyTable(self.pieceChainState))
end