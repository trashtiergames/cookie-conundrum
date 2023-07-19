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