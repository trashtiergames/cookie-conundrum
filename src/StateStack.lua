--[[
    Original author: Colton Ogden
    cogden@cs50.harvard.edu
    License: Attribution-NonCommercial-ShareAlike 4.0 International 
    https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
]]

StateStack = Class{}

function StateStack:init()
  self.states = {}
end

function StateStack:update(dt)
  if #self.states > 0 then
    self.states[#self.states]:update(dt)
  end
end

function StateStack:draw()
  for i, state in ipairs(self.states) do
    state:draw()
  end
end

function StateStack:clear()
  self.states = {}
end

function StateStack:push(state)
  table.insert(self.states, state)
  state:enter()
end

function StateStack:pop()
  self.states[#self.states]:exit()
  -- removes last element of array
  table.remove(self.states)
end