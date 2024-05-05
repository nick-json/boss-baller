local function move_camera()
    cam:lookAt(player.x, player.y)

    local width, height = love.graphics.getDimensions()
    local mapWidth, mapHeight = gameMap.width * gameMap.tilewidth, gameMap.height * gameMap.tileheight
    if cam.x < width/2 then -- left
        cam.x = width/2
    end
    if cam.y < height/2 then -- up
        cam.y = height/2
    end
    if cam.x > (mapWidth - width/2) then -- right
        cam.x = (mapWidth - width/2)
    end
    if cam.y > (mapHeight - height/2) then -- down
        cam.y = (mapHeight - height/2)
    end
end

return move_camera