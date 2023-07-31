-- This is the main script for Cookie Conundrum

require "src/dependencies"

function love.load()
  -- Initialize system stuff
  math.randomseed(os.time())
  testTimer = 0
  testTimerMax = 1
  love.keyboard.keysPressed = {}
  quicksandSmall = love.graphics.newFont("font/quicksand.ttf", 20)
  quicksandMenu = love.graphics.newFont("font/quicksand.ttf", 32)
  quicksandMedium = love.graphics.newFont("font/quicksand.ttf", 40)

  -- Prep music
  music = love.audio.newSource("audio/meditative.wav", "stream")
  music:setVolume(0.5)
  music:setLooping(true)

  -- Prepare state stack
  gStateStack = StateStack()
  gStateStack:push(TitleState())

  -- Prepare window
  love.window.setTitle("Cookie Conundrum")
  love.window.setMode(1280, 720, {fullscreen=false})

  -- Initialize location
  currentLocation = locations.darkness

  -- Initialize buttons
  actionButtons = {
    ActionButton("move", 1),
    ActionButton("talk", 2),
    ActionButton("investigate", 3),
    ActionButton("evidence", 4)
  }

  for i, button in pairs(actionButtons) do
    button.show = false
  end

  -- Initialize inventory
  inventory = {}

  -- Configure dialogue library
  Talkies.font = quicksandMedium
  Talkies.height = 175
  Talkies.messageBackgroundColor = {0, 0, 0, 0}
  Talkies.messageColor = {0, 0, 0}
  Talkies.titleBackgroundColor = {0, 0, 0, 0.8}
  Talkies.titleBorderColor = {0, 0, 0, 1}
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  love.keyboard.keysPressed[key] = true
end

function love.mousepressed(x, y, button)
  love.mouse.btnsPressed[button] = {x=x, y=y}
end

function love.keyboard.wasPressed(key)
  -- This allows us to check in update() if a key was pressed last frame
  return love.keyboard.keysPressed[key]
end

function love.mouse.wasPressed(btn)
  return love.mouse.btnsPressed[btn]
end

function love.update(dt)
  gStateStack:update(dt)
  love.keyboard.keysPressed = {}
  love.mouse.btnsPressed = {}
end

function love.draw()
  gStateStack:draw()
end