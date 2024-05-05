love = require("love")

function love.load()
    wf = require("libraries.windfield")
    world = wf.newWorld(0, 0)

    camera = require("libraries.camera")
    cam = camera.new()

    sti = require("libraries.sti")
    gameMap = sti("sprites/map.lua")

    love.graphics.setBackgroundColor(0.5, 0.6, 0.9) -- light blue

    player = require("scripts.player")
    move_camera = require("scripts.utils.move_camera")

    walls = require("scripts.boot.load_walls")
end

function love.update(dt)
    world:update(dt)
    player:update(dt)
    move_camera()
end

function love.draw()
    cam:attach()
        gameMap:drawLayer(gameMap.layers["ground"])
        player:draw()
        gameMap:drawLayer(gameMap.layers["trees"])
        --world:draw() -- decomment to debug hitboxes
    cam:detach()
end