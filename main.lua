Class = require("./lib/class")
anim8 = require("./lib/anim8")
push = require("./lib/push")

require("./src/util")
require("./src/board")
require("./src/player")
require("./src/AI")

function love.load()
    roundEnd = 0

    player = Player()
    player:init()

    bot = AI()

    board = Board()
    board:init()

    -- Keyboard input handler
    love.keyboard.keysPressed = {}
end

function love.draw()
    -- Ending a round with a prompt to user
    if (roundEnd == 1) then
        love.graphics.print("Player won!", 0, 0)
        love.graphics.print("Press R to restart!",0 , 30)
    elseif (roundEnd == 2) then
        love.graphics.print("Computer won!", 0, 0)
        love.graphics.print("Press R to restart!",0 , 30)
    end

    board:render()
end

function love.update(dt)

    if (roundEnd == 0) then
        -- Reset keyboard input
        player:update()
        roundEnd = board:checkVictory()
        bot:move()
    else
        -- Restart the game
        if (love.keyboard.wasPressed("r")) then
            board.m_Matrix = {
                {0, 0, 0},
                {0, 0, 0},
                {0, 0, 0}
            }

            roundEnd = 0
        end
    end

    love.keyboard.keysPressed = {}
end
