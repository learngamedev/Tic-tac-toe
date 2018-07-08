Player = Class {}

function Player:init()
    self.x, self.y = 1, 1
    self.moved = false
end

function Player:render()
end

function Player:update()
    if (love.keyboard.wasPressed("left")) then
        self.y = math.max(self.y - 1, 1)
    elseif (love.keyboard.wasPressed("right")) then
        self.y = math.min(self.y + 1, 3)
    end

    if (love.keyboard.wasPressed("up")) then
        self.x = math.max(self.x - 1, 1)
    elseif (love.keyboard.wasPressed("down")) then
        self.x = math.min(self.x + 1, 3)
    end

    if (love.keyboard.wasPressed("space")) then
        if (board.m_Matrix[self.x][self.y] == 0) then
            board.m_Matrix[self.x][self.y] = "X"
            self.moved = true
        end
    end
end
