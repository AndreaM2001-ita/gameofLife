-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- menu scene to show all the different button of menu
-----------------------------------------------------------------------------------------
local composer = require("composer")
local scene = composer.newScene()

require("Modulus.cellTable") -- modulus for the function to update grid

require("Modulus.cellFile") -- modulus for the function to open grid

require("Modulus.cellScene") -- modulus for the function to show cell scene with iterating grid

require("Modulus.fetchScene") -- modulus that contains scene with methods for the fecth state

local widget = require("widget")

buttonGroup = display.newGroup(); -- initialise group of buttons on scene

-- function to change scene and craete a ranodm state of the grid
function randoming(event)

    local grid = createRandomGrid()
    switch(event)

end
-- button for random start state
function randomButton(where, x, y)
    random = widget.newButton({
        id = where,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 100,
        label = "RANDOM",
        color = fillColor
    });
    random:addEventListener("tap", randoming) -- listener
    buttonGroup:insert(random)
    return random
end

-- function to handle button of fetch 
function fetching(event)
    if isJSONEmpty(fileName) then -- if the current json file is empty there is no need to fetch an old state
        event.target.alpha = 0.2
        local text = display.newText("ERROR.. NO_GRID in system", width / 2, height / 2.5)
        buttonGroup:insert(text)
    else -- switch state to fetch scene if the json file has something in it
        switch(event)
    end
end

-- function to create fetch button
function fetchButton(where, x, y)
    fetch = widget.newButton({
        id = where,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 100,
        label = "FETCH STATE",
        color = fillColor
    });
    fetch:addEventListener("tap", fetching)
    buttonGroup:insert(fetch)
    return fetch
end
-- function to create button to switch scene to open scene where user can input initial state
function inputButton(where, x, y)
    inputB = widget.newButton({
        id = where,
        shape = "roundedRect",
        onRelease = switch,
        x = x,
        y = y,
        width = 200,
        height = 100,
        label = "INPUT STATE",
        color = fillColor
    });
    buttonGroup:insert(inputB)
    return inputB
end

function scene:create(event)
    sceneGroup = self.view
end
-- show()
function scene:show(event)
    local phase = event.phase
    local sceneGroup = self.view
    if (phase == "will") then
        local where = "Modulus.cellScene"
        randomButton(where, width / 2, height / 5) -- button of random input state
        local where = "Modulus.fetchScene"
        fetchButton(where, width / 2, height / 2.8) -- button to go to fetch scene and find initial state
        local where = "Modulus.inputScene"
        inputButton(where, width / 2, height / 1.95) -- button to open scene where user can input initial state

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
