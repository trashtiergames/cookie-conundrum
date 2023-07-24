Location = Class{}

function Location:init(name, img_path, clickables)
  self.name = name
  self.img = love.graphics.newImage(img_path)
  self.visited = false
  self.clickables = clickables
  self.defaultInvestigateMessage = PieceChainState({
    TextPieceState(
      "Sam",
      "Seems like there's nothing to find here."
    )
  })
end

function Location:update(dt) 
  click = love.mouse.wasPressed(1)
  if click and click.x then
    gStateStack:pop()
    local iToRemove = nil
    local clickableClicked = false
    for i, clickable in ipairs(self.clickables) do
      if clickInside(click, clickable) then
        clickableClicked = true
        clickable:onClick()
        if clickable.consumed then
          iToRemove = i
        end
      end
    end
    if iToRemove then
      table.remove(self.clickables,iToRemove)
    end
    if not clickableClicked then
      gStateStack:push(copyTable(self.defaultInvestigateMessage))
    end
  end
end

function Location:draw()
  love.graphics.draw(self.img, 0, 0)
  for _, clickable in pairs(self.clickables) do
    clickable:draw()
  end
end

function Location:visit()
  self.visited = true
end