local walls = {}
if gameMap.layers["walls"] then
    for _, obj in ipairs(gameMap.layers["walls"].objects) do
        local wall = world:newRectangleCollider(math.floor(obj.x), math.floor(obj.y), math.floor(obj.width), math.floor(obj.height))
        wall:setType("static")
        walls[#walls+1] = wall -- table.insert, but faster
    end
end

return walls