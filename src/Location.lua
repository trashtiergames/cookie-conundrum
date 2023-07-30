Location = Class{}

function Location:init(name, img_path, clickables, characters)
  self.name = name
  self.img = love.graphics.newImage(img_path)
  self.visited = false
  self.characters = characters or nil
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
  if self.characters and #self.characters == 1 then
    for _, char in pairs(self.characters) do
      if char.show then
        char:draw()
      end
    end
  elseif self.characters and #self.characters == 2 then
    third = math.floor(1280 / 3)
    translateX = -math.floor(third / 2)
    for _, char in pairs(self.characters) do
      if char.show then
        love.graphics.translate(translateX, 0)
        char:draw()
        love.graphics.origin()
        translateX = translateX + third
      end
    end
  end
  for _, clickable in pairs(self.clickables) do
    clickable:draw()
  end
end

function Location:visit()
  self.visited = true
end