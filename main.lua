-- This is the main script for Cookie Conundrum

require "src/dependencies"

function love.load()
  math.randomseed(os.time())

  -- Prepare window
  love.window.setTitle("Cookie Conundrum")
  love.window.setMode(1920, 1080, {fullscreen=true})

  gStateStack = StateStack()
  gStateStack:push(TitleState())

  love.keyboard.keysPressed = {}

  Talkies.font = love.graphics.newFont("font/open_sans.ttf", 40)
  Talkies.height = 180
  Talkies.messageBackgroundColor = {0, 0, 0, 0}
  Talkies.messageColor = {0, 0, 0}
  Talkies.titleBackgroundColor = {0, 0, 0, 0.8}
  Talkies.titleBorderColor = {0, 0, 0, 1}
end

function love.keypressed(key)
  if key == "escape" then
      love.event.quit()
  end

  if key == "t" then
    testStrings = {
      "Hi! Welcome to the game.",
      "I hope you make yourself comfortable.",
      "Maybe get some snacks. I hear those ranch chips are banger."
    }
    Talkies.say("Title", testStrings)
  end

  if key == "space" then Talkies.onAction()
  elseif key == "up" then Talkies.prevOption()
  elseif key == "down" then Talkies.nextOption()
  end

  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  -- This allows us to check in update() if a key was pressed last frame
  return love.keyboard.keysPressed[key]
end

function love.update(dt)
  gStateStack:update()
  Talkies.update(dt)
  
  love.keyboard.keysPressed = {}
end

function love.draw()
  gStateStack:render()
  Talkies.draw()
end