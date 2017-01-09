function seedSlot()
  for _=1, turtle.select(16) and 16 or 9 do
    turtle.select(_)
    if turtle.getItemCount() > 0 or not turtle.getItemCount() == nil then
      if turtle.getItemDetail().name == "minecraft:wheat_seeds" then
        return turtle.getSelectedSlot(), true
      else
        return false
      end
    else
      return false
    end
  end
end

function harvest(length)
  if length == nil then
    print("Length not defined.")
    return false
  end
  for _=1, length do
    turtle.forward()
    local seeds,e = seedSlot()
    local s,data = turtle.inspectDown()
    if s and data.metadata == 7 then
      turtle.digDown()
      turtle.suckDown()
      if e then
        turtle.select(seeds)
        turtle.placeDown()
      end
    end
  end
  return true
end
