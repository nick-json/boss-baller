local function checkRectCollision(rect1, rect2)
    local x1, y1, w1, h1 = rect1:getX(), rect1:getY(), rect1:getWidth(), rect1:getHeight()
    local x2, y2, w2, h2 = rect2:getX(), rect2:getY(), rect2:getWidth(), rect2:getHeight()

    return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

return checkRectCollision