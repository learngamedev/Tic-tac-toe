math.randomseed(os.time())

AI = Class{}

function AI:move()
    while (player.moved) do
        -- Generate random moves
        local row = math.random(3)
        local column = math.random(3)

        -- Execute moves
        if (board.m_Matrix[row][column] == 0) then
            board.m_Matrix[row][column] = "O"
            player.moved = false
        end

        -- Check if no moves left
        local count = 0
        for i = 1, 3 do
            for i = 1, 3 do
                if (board.m_Matrix[row][column] == 0) then
                    count = count + 1
                end
            end
        end
        if (count == 0) then break end
    end
end
