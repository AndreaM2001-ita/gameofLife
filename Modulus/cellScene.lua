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

isUpdating = false -- Flag to track whether the update is running or not

local isDragging = false -- track if the button is being dragged
local touchOffsetX = 0 -- doifference in position and button center
local minSpeed = 1000 -- slowest time
local maxSpeed = 20 -- fastest time
local defaultSpeed = (minSpeed - maxSpeed) / 2
local currentSpeed = (minSpeed - maxSpeed) / 2 -- calculated with mathematical linearity bwteen position and speed

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

-- function that takes as input the user finger to determine position of speed circle
function onTouch(event)
    local target = event.target
    local phase = event.phase

    if phase == "began" then
        display.getCurrentStage():setFocus(target) -- get current position of draggable element
        target.isFocus = true

        -- Calculate the offset between touch position and button center
        touchOffsetX = event.x - target.x
        isDragging = true
    elseif target.isFocus then -- if the button is still clicked
        if phase == "moved" then
            target.x = event.x - touchOffsetX -- calculate difference between new and old position

            -- Limit the button's movement within a specific range
            local min = (width / 2) - 90 -- min position 
            local max = (width / 2) + 90 -- max position
            target.x = math.min(max, math.max(min, target.x)) -- only x is important as the slider moves orizontally

            currentSpeed = minSpeed + (maxSpeed - minSpeed) * (target.x - min) / (max - min) -- calculate next speed based on position of cursor

        elseif phase == "ended" or phase == "cancelled" then
            display.getCurrentStage():setFocus(nil) -- stop interaction with cursor
            target.isFocus = false
            isDragging = false

        end
    end
end
-- function to the reactngle and joystick to change speed
function speedMeter(x, y)
    display.newText(buttonGroup, "SPEED", 100, y - 30)
    display.newRect(buttonGroup, x, y, 200, 10)
    speed = widget.newButton({
        radius = 20, -- Radius of the circle
        shape = "circle",
        x = x,
        y = y,
        color = fillColor
    });
    speed:addEventListener("touch", onTouch)
    buttonGroup:insert(speed)
    return speed
end
-- function to create the rectangles in the grid
function createGrid(sceneGroup, grid, position)
    local rectWidth = 200 -- width of the rectangle
    local size = rectWidth / cellNumber;

    local zeroX = width / 2 - rectWidth / 2 + size / 2 -- x starting point of grid
    local zeroY = math.floor(((height / 4) - rectWidth / 2) + position) -- y starting point of grid

    local x = 1
    local counter = 1
    for i = zeroX, zeroX + (size * cellNumber - 1), size do
        local y = 1
        for j = zeroY, zeroY + (size * cellNumber - 1), size do
            local key = x .. "," .. y
            local rect = display.newRect(sceneGroup, i, j, size, size)
            if grid[key] == 1 then
                rect:setFillColor(1, 1, 1)
            elseif grid[key] == 0 then
                rect:setFillColor(0, 0, 0)
            end
            table.insert(group, counter, rect) -- insert in group
            sceneGroup:insert(rect)
            counter = counter + 1
            y = y + 1
        end
        counter = counter + 1
        x = x + 1
    end
    return sceneGroup
end
-- functiom that return group created for testing features
function returnGroup()
    if group then
        return group
    end
end
-- function to display grid 
function displayGrid(sceneGroup, grid)
    local counter = 1
    for x = 1, cellNumber do
        for y = 1, cellNumber do
            local key = x .. "," .. y
            local rect = group[counter] -- retrive group to display its next value. it is faster for scene rather than removing and creating a new grid
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
-- function to upgrade timer to new state
local function upgradeTimer()
    grid = updateGrid(grid) -- next state of grid
    displayGrid(sceneGroup, grid) -- recall grid repeadedly at an interval based on current speed--updated
    if defaultSpeed ~= currentSpeed then
        cancelTimer() -- if the 2 speed are different the user a=has moved the knob and the timer needs to be updated
        defaultSpeed = currentSpeed
        myTimer = timer.performWithDelay(defaultSpeed, upgradeTimer, 0) -- update timer
    end
end

function perform()
    removeElements(buttonGroup) -- remove current buttons when resume clicked or when get into the scene
    createGrid(sceneGroup, grid, 0) -- display the grid and create the elements of reactangles
    stopButton(width / 2, height / 1.7)
    speedMeter(width / 2, height / 1.3)

    if not isUpdating then
        myTimer = timer.performWithDelay(defaultSpeed, upgradeTimer, 0) -- create normal timer
        isUpdating = true
    end
end

-- create scene
function scene:create(event)
    sceneGroup = self.view

end

-- show()
function scene:show(event)
    local phase = event.phase
    local sceneGroup = self.view
    if (phase == "will") then
        defaultSpeed = (minSpeed - maxSpeed) / 2
        currentSpeed = (minSpeed - maxSpeed) / 2 -- calculated with mathematical linearity bwteen position and speed
        perform()
    elseif (phase == "did") then

    end
end

function scene:hide(event)
    local phase = event.phase
    if phase == "will" then
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

