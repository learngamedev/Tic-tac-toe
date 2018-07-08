Board = Class {}

function Board:init()
    -- Board empty matrix
    self.m_Matrix = {
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0}
    }

    -- Drawing properties of board
    self.m_TopX, self.m_TopY = 200, 200
    self.m_Indent, self.m_Spacing = 50, 50
    self.m_Font = love.graphics.setNewFont("Fonts/Pixel-Miners.ttf", 14)
end

function Board:render()
    -- Render board variables
    for i = 0, 2 do
        for j = 0, 2 do
            -- Highlight the cell selected by player
            if (i + 1 == player.x) and (j + 1 == player.y) then
                love.graphics.setColor(0, 255, 0)
            end

            love.graphics.print(
                self.m_Matrix[i + 1][j + 1],
                self.m_TopX + self.m_Indent * j,
                self.m_TopY + self.m_Spacing * i
            )

            -- Set default white color back for remaining cells
            love.graphics.setColor(255, 255, 255)
        end
    end
end

function Board:checkVictory()

    for i = 1, 3 do
        if (self.m_Matrix[i][1] == "X") and (self.m_Matrix[i][2] == "X") and (self.m_Matrix[i][3] == "X") then
            return 1
        elseif (self.m_Matrix[i][1] == "O") and (self.m_Matrix[i][2] == "O") and (self.m_Matrix[i][3] == "O") then
            return 2
        end
    end

    for i = 1, 3 do
        if (self.m_Matrix[1][i] == "X") and (self.m_Matrix[2][i] == "X") and (self.m_Matrix[3][i] == "X") then
            return 1
        elseif (self.m_Matrix[1][i] == "O") and (self.m_Matrix[2][i] == "O") and (self.m_Matrix[3][i] == "O") then
            return 2
        end
    end

    if (self.m_Matrix[1][1] == "X") and (self.m_Matrix[2][2] == "X") and (self.m_Matrix[3][3] == "X") then
        return 1
    elseif (self.m_Matrix[1][1] == "O") and (self.m_Matrix[2][2] == "O") and (self.m_Matrix[3][3] == "O") then
        return 2
    end

    if (self.m_Matrix[1][3] == "X") and (self.m_Matrix[2][2] == "X") and (self.m_Matrix[3][1] == "X") then
        return 1
    elseif (self.m_Matrix[1][3] == "O") and (self.m_Matrix[2][2] == "O") and (self.m_Matrix[3][1] == "O") then
        return 2
    end

    return 0
end
