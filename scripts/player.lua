local function init()
    local checkCollision = require("scripts.utils.check_rect_collision")

    local collider = world:newRectangleCollider(200, 200, 40, 40)
    collider:setFixedRotation(true)

    return {
        x = 0,
        y = 0,
        speed = 20000,
        collider = collider,

        update = function (self, dt)
            -- handle movement
            local vx = 0
            local vy = 0
            if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
                vx = self.speed * -1 * dt
            end
            if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
                vx = self.speed * dt
            end
            if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
                vy = self.speed * -1 * dt
            end
            if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
                vy = self.speed * dt
            end
            self.collider:setLinearVelocity(vx, vy)


            self.x = self.collider:getX()
            self.y = self.collider:getY()
        end,
        draw = function (self)
            love.graphics.circle("fill", self.x, self.y, 20)
        end
    }
end

return init()