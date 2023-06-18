-- This is the main script for Cookie Conundrum

require "src/dependencies"

function love.load()
  math.randomseed(os.time())

  -- Prepare window
  love.window.setTitle("Cookie Conundrum")
  love.window.setMode(1920, 1080, {fullscreen=true})

  gStateStack = StateStack()
  gStateStack:push(TitleState())

  gBackgrounds = {
    ["sams_room"] = love.graphics.newImage("art/sams_room.png")
  }

  gCurrentBackground = gBackgrounds["sams_room"]

  love.keyboard.keysPressed = {}
end

function love.keypressed(key)
  if key == "escape" then
      love.event.quit()
  end

  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  -- This allows us to check in update() if a key was pressed last frame
  return love.keyboard.keysPressed[key]
end

function love.update(dt)
  gStateStack:update()
  love.keyboard.keysPressed = {}
end

function love.draw()
  love.graphics.draw(gCurrentBackground, 0, 0)
  gStateStack:render()
end