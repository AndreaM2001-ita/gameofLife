-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- scene created to show all the initial state saved
-----------------------------------------------------------------------------------------
local composer = require("composer")
local scene = composer.newScene()

require("Modulus.cellTable") -- modulus for the function to update grid

require("Modulus.cellFile") -- modulus for the function to open grid

require("Modulus.cellScene") -- modulus for the function to show cell scene with iterating grid

local widget = require("widget")

local contentGroups
local eventListeners

-- function to delete data from json file 
local function deleting(event)
    deleteJSON(fileName) -- delete file 
    if isJSONEmpty(fileName) then -- verify that it has been deleted
        print("JSON file empty")
    end
    switch(event) -- go back to menu
end

-- function to create delete button
local function deleteButton(where, x, y)
    deleteB = widget.newButton({
        id = where,
        label = "DELETE",
        shape = "roundedRect",
        onRelease = deleting,
        x = x,
        y = y,
        width = 80,
        height = 80
    });

    buttonGroup:insert(deleteB)
    return deleteB
end
-- function to create button to go back to menu wihtout deleting
local function backButton(where, x, y)
    backB = widget.newButton({
        id = where,
        label = "BACK",
        shape = "roundedRect",
        onRelease = switch,
        x = x,
        y = y,
        width = 80,
        height = 80
    });
    buttonGroup:insert(backB)
    return backB
end
-- create scrollable list of states
local function createScrollView(sceneGroup, width, height)
    scrollView = widget.newScrollView({
        top = -105,
        left = 0,
        width = width,
        height = display.actualContentHeight - 100,
        horizontalScrollDisabled = true, -- Disable horizontal scrolling
        verticalScrollingDisabled = false,
        isBounceEnabled = false
    })
    sceneGroup:insert(scrollView)
    return scrollView
end

-- function to initialise current state of grid to an old saved state of grid
function useGrid(event)
    local tappedContent = event.target
    grid = tappedContent.grid -- Update the grid with the grid that was touched
    switch(event) -- switch to cell scene

end
function scene:create(event)
    local sceneGroup = self.view
end
-- show()
function scene:show(event)
    local phase = event.phase
    local sceneGroup = self.view
    if (phase == "will") then
        local currentData = readWhole(fileName) -- read json file

        local scrollView = createScrollView(sceneGroup, display.actualContentWidth, #currentData * 400) -- create the scrollable list
        local position = 10 -- position to be updated

        contentGroups = {} -- create list of groups for each state of grid displayed
        for counter, obj in pairs(currentData) do
            contentGroups[counter] = display.newGroup() -- create new empty group as parent for the grid saved
            local content = createGrid(contentGroups[counter], obj.grid, position) -- craete grid

            content.id = "Modulus.cellScene" -- give it an id for switching
            content.grid = obj.grid -- give its grid value for easy trasnfer when switching

            sceneGroup:insert(content) -- insert in current scene
            scrollView:insert(content) -- insert in scrollview
            content:addEventListener("tap", useGrid) -- add event listener to change scene with the grid clicked

            position = position + 250

        end
        local spacer = display.newRect(scrollView, 0, position + 200, display.actualContentWidth, 100) -- craete spacer for corret working of scrollview
        spacer:setFillColor(0, 0, 0, 0) -- Set fill color to transparent
        sceneGroup:insert(spacer)
        scrollView:insert(spacer)

        while #currentData > 0 do -- delete value in objectof current data to avoid erranous results in case back or delete button are clicked
            table.remove(currentData)
        end
        local where = "Modulus.menuScene"
        deleteButton(where, width / 2, height / 1.3)
        backButton(where, width / 1.3, height / 1.3)

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

