local function init()
    -- collider setup
    local collider = world:newBSGRectangleCollider(200, 200, 50, 80, 10)
    collider:setFixedRotation(true)

    -- animations setup
    local FRAME_WIDTH, FRAME_HEIGHT = 12, 18
    local spriteSheet = love.graphics.newImage("sprites/player-sheet.png")
    local grid = anim8.newGrid(FRAME_WIDTH, FRAME_HEIGHT, spriteSheet:getWidth(), spriteSheet:getHeight())

    local animations = {
        down = anim8.newAnimation(grid("1-4", 1), 0.2),
        left = anim8.newAnimation(grid("1-4", 2), 0.2),
        right = anim8.newAnimation(grid("1-4", 3), 0.2),
        up = anim8.newAnimation(grid("1-4", 4), 0.2)
    }

    return {
        x = 0,
        y = 0,
        speed = 20000,
        anim = animations.down,

        update = function (self, dt)
            -- handle movement
            local vx = 0
            local vy = 0
            local isMoving = false
            if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
                vx = self.speed * -1 * dt
                self.anim = animations.left
                isMoving = true
            end
            if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
                vx = self.speed * dt
                self.anim = animations.right
                isMoving = true
            end
            if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
                vy = self.speed * -1 * dt
                self.anim = animations.up
                isMoving = true
            end
            if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
                vy = self.speed * dt
                self.anim = animations.down
                isMoving = true
            end

            collider:setLinearVelocity(vx, vy)

            self.x = collider:getX()
            self.y = collider:getY()

            if not isMoving then
                self.anim:gotoFrame(2)
            end

            self.anim:update(dt)
        end,
        draw = function (self)
            self.anim:draw(spriteSheet, self.x, self.y, nil, 5, 5, FRAME_WIDTH/2, FRAME_HEIGHT/2)
        end
    }
end

return init()