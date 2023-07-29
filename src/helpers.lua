-- General helper functions for the game

function clickInside(click, container)
  -- Return true if click coords are inside container coords, false otherwise
  if     (click.x > container.x 
      and click.x < container.x + container.w
      and click.y > container.y
      and click.y < container.y + container.h) then
    return true
  else
    return false
  end
end

-- From https://stackoverflow.com/a/26367080
-- Has certain limitations that I don't think apply to my purposes
function copyTable(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[copyTable(k, s)] = copyTable(v, s) end
  return res
end

toggleButtonPieceState = FunctionPieceState(
  function()
    for _, button in pairs(actionButtons) do
      button.show = not button.show
    end
  end
)

toggleTextboxPieceState = FunctionPieceState(
  function()
    textbox.show = not textbox.show
  end
)

toggleHeartsPieceState = FunctionPieceState(
  function()
    healthbar.show = not healthbar.show
  end
)