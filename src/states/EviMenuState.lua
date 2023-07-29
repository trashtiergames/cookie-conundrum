-- Display menu for checking evidence

EviMenuState = Class{__includes = BaseState}

function EviMenuState:init()
  self.x = 240
  self.y = 60
  self.w = 800
  self.h = 600
  self.xPad = 28
  self.yPad = 50
  self.menuBarY = 100
  self.descrPad = 10
  self.descrX = self.x + self.xPad + self.descrPad
  self.descrY = self.y + self.h - self.yPad - 185 + self.descrPad
  self.descrLimit = self.w - (2 * self.xPad) - (2 * self.descrPad)
  self.img = love.graphics.newImage("art/ui/Evidence_Menu.png")
  self.cancelButton = CancelButton(self.x + 700, self.y)
  self.presentButton = PresentButton(self.x + self.w, self.y)
  self.descrToDisplay = "Click on evidence to get a description."
  self.containers = {}
end

function EviMenuState:enter()
  local contX = self.x
  local contY = self.y + self.yPad + self.menuBarY
  for _, item in pairs(inventory) do
    contX = contX + self.xPad
    table.insert(self.containers, EviContainer(item, contX, contY))
  end
end

function EviMenuState:exit()

end

function EviMenuState:update(dt)
  self.cancelButton:update()
  self.presentButton:update()
  click = love.mouse.wasPressed(1)
  if click and click.x then
    for _, container in pairs(self.containers) do
      if clickInside(click, container) then
        self.descrToDisplay = container.evidence.description
        if currentLocation.characters then
          self.presentButton.show = true
          self.presentButton.eviName = container.evidence.name
        end
      end
    end
  end
end

function EviMenuState:draw()
  love.graphics.draw(self.img, self.x, self.y)
  self.cancelButton:draw()
  self.presentButton:draw()

  for _, container in pairs(self.containers) do
    container:draw()

    -- Draw item name below container
    love.graphics.setColor(0,0,0,1)

    love.graphics.printf(
      container.evidence.name,
      quicksandSmall,
      container.x, 
      container.y + container.h - 5, 
      container.w,
      "center"
    )

    love.graphics.setColor(1,1,1,1)
  end

  -- Draw descriptions
  love.graphics.setColor(0,0,0,1)

  if #self.containers == 0 then
    love.graphics.printf(
      "You don't have any evidence yet.",
      quicksandMedium,
      self.descrX, 
      self.descrY, 
      self.descrLimit
    )
  else
    love.graphics.printf(
      self.descrToDisplay,
      quicksandMedium,
      self.descrX, 
      self.descrY, 
      self.descrLimit
    )
  end

  love.graphics.setColor(1,1,1,1)
end