-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- scene to insert initial state from user
-----------------------------------------------------------------------------------------
local composer = require("composer")
local scene = composer.newScene()

require("Modulus.cellScene") -- modulus for the function to show cell scene with iterating grid

local widget = require("widget")

buttonGroup = display.newGroup(); -- initialise group of buttons on scene

local group = display.newGroup() -- create group to store rect of grid

local touchInProgress = false -- Flag to track if touch is working

-- createa grid empty in order to initialise by the user
local function createEmptyGrid(sceneGroup)
    local rectWidth = width - width / 10 -- width of the rectangle
    local size = rectWidth / cellNumber;

    local zeroX = width / 2 - rectWidth / 2 + size / 2 -- x starting point of grid
    local zeroY = math.floor(((height / 4) - rectWidth / 2)) -- y starting point of grid

    local counter = 1
    for i = zeroX, zeroX + (size * cellNumber - 1), size do
        for j = zeroY, zeroY + (size * cellNumber - 1), size do
            local rect = display.newRect(sceneGroup, i, j, size, size)
            rect:setFillColor(0, 0, 0)
            rect.id = 0
            rect.strokeWidth = 0.6 -- Set the stroke width for the border
            rect:setStrokeColor(0.5, 0.5, 0.5) -- grey
            table.insert(group, counter, rect)
            sceneGroup:insert(rect)
            counter = counter + 1
        end
        counter = counter + 1
    end
    return sceneGroup
end
-- function to prepare grid to be used in next scene
local function getGrid()
    local counter = 1
    local grid = {}
    for x = 1, cellNumber do
        for y = 1, cellNumber do
            local key = x .. "," .. y -- create key
            local rect = group[counter] -- find current grid
            grid[key] = rect.id -- value of the grid stored in rect.id
            counter = counter + 1
        end
        counter = counter + 1
    end
    return grid
end
-- function to change scene and generate grid for cellScene
local function using(event)
    grid = getGrid()
    switch(event)
end
-- function to create button to go to next scene
local function useButton(where, x, y)
    use = widget.newButton({
        id = where,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 100,
        label = "USE STATE",
        color = fillColor
    });
    use:addEventListener("tap", using)
    buttonGroup:insert(use)
    return use
end
-- function to get rectangle pressed based on its position on screen
local function getRectangle(x, y, group)
    local rectangle -- initialise local variable to report the rectangle obj

    local numChildren = group.numChildren -- take the children in sceneGroup which are all the rectangles of the grid
    for counter = 1, numChildren do -- loop throguh objects
        local child = group[counter]
        local bounds = child.contentBounds -- take the values of their borders

        if x >= bounds.xMin and x <= bounds.xMax and y >= bounds.yMin and y <= bounds.yMax then -- check them
            rectangle = child -- if the value reported corresponded to the current rectangle it mens that it has been pressed
        end
    end

    return rectangle
end
-- based on current positon of user finger the program needs to get the current rectangles obj and color the, 
local function colorCellPosition(x, y, sceneGroup)
    local touchedRect = getRectangle(x, y, sceneGroup)
    if touchedRect then
        touchedRect.id = 1 -- Set the cell to alive
        touchedRect:setFillColor(1, 1, 1) -- color cell
    end
end
-- Function to handle touch events
local function touchHandler(event)
    local sceneGroup = event.target

    if event.phase == "began" then -- deal with clicking of one rectangle
        touchInProgress = true
        colorCellPosition(event.x, event.y, sceneGroup)
    elseif event.phase == "moved" then -- deal ith movement of user finger
        if touchInProgress then
            local dx = event.x - event.xStart -- take differential valeu of x coordinate
            local dy = event.y - event.yStart -- take differential valeu of yMax coordinate
            local distance = math.sqrt(dx * dx + dy * dy) -- pitagora

            if distance >= 1 then
                local steps = math.floor(distance) -- calculate distance between initial and final point

                for i = 1, steps do -- loop through every rect crossed in distance
                    local fraction = i / steps
                    local cx = event.xStart + fraction * dx -- find its x position
                    local cy = event.yStart + fraction * dy -- find its y position

                    colorCellPosition(cx, cy, sceneGroup) -- color rects
                end
            end
        end
    elseif event.phase == "ended" then -- touch ended
        touchInProgress = false
    end
    return true
end
function scene:create(event)
    sceneGroup = self.view

end
-- show()
function scene:show(event)
    local phase = event.phase
    local sceneGroup = self.view
    if (phase == "will") then
        sceneGroup = createEmptyGrid(sceneGroup) -- create initial empty grid
        sceneGroup:addEventListener("touch", touchHandler) -- add listener to color it
        useButton("Modulus.cellScene", width / 2, height / 1.7) -- button to change scene
    elseif (phase == "did") then

    end
end
-- hide()
function scene:hide(event)

    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif (phase == "did") then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end

-- destroy()
function scene:destroy(event)

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
