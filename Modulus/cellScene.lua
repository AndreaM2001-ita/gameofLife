-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- scene to create a randomised grid on screen (200x200)
-----------------------------------------------------------------------------------------
require("Modulus.cellTable")
require("Modulus.stopElements")
require("Modulus.manageScene")

composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local group = display.newGroup()

-- function to create a button on screen to stop iterations 
function stopButton(x, y)
    stop = widget.newButton({
        -- id = where,
        onRelease = stopSimulation,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 100,
        label = "STOP",
        color = fillColor
    });
    buttonGroup:insert(stop)
    return stop
end
-- funcgion to create the rectangles in the grid
function createGrid(sceneGroup, grid)
    local rectWidth = 200 -- width of the rectangle
    local size = rectWidth / cellNumber;

    local zeroX = width / 2 - rectWidth / 2 + size / 2 -- x starting point of grid
    local zeroY = math.floor((height / 4) - rectWidth / 2) -- y starting point of grid

    local y = 1
    local counter = 1
    for i = zeroX, zeroX + (size * cellNumber - 1), size do
        local x = 1
        for j = zeroY, zeroY + (size * cellNumber - 1), size do
            local key = x .. "," .. y
            local rect = display.newRect(sceneGroup, i, j, size, size)
            if grid[key] == 1 then
                rect:setFillColor(1, 1, 1)
            elseif grid[key] == 0 then
                rect:setFillColor(0, 0, 0)
            end
            table.insert(group, counter, rect)
            sceneGroup:insert(rect)
            counter = counter + 1
            x = x + 1
        end
        counter = counter + 1
        y = y + 1
    end
end
-- function to display grid 
function displayGrid(sceneGroup, grid)
    local counter = 1
    for x = 1, cellNumber do
        for y = 1, cellNumber do
            local key = x .. "," .. y
            local rect = group[counter]
            if grid[key] == 1 then
                rect:setFillColor(1, 1, 1)
            elseif grid[key] == 0 then
                rect:setFillColor(0, 0, 0)
            end
            counter = counter + 1
        end
        counter = counter + 1
    end
end

function perform()
    myTimer = timer.performWithDelay(100, function()
        grid = updateGrid(grid)
        displayGrid(sceneGroup, grid) -- recall grid repeadedly at an interval of 1 second
    end, 0)
end
-- create scene
function scene:create(event)
    sceneGroup = self.view

    local params = event.params
    if params and params.grid then
        grid = params.grid
    end

    if grid ~= nil then
        createGrid(sceneGroup, grid) -- display last grid
    end

end

-- show()
function scene:show(event)
    local phase = event.phase
    local sceneGroup = self.view
    if (phase == "will") then
        stopButton(width / 2, height / 1.7)
        perform()
    elseif (phase == "did") then

    end
end

function scene:hide(event)
    local phase = event.phase
    if phase == "will" then
        -- Before transitioning to a new scene, cancel or nil timers
        -- removeElements(sceneGroup) -- remove previous grid
        -- cancelTimer(myTimer) -----------------------------------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!
    end
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
-- -----------------------------------------------------------------------------------

return scene

