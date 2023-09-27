-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- mudule to contain all shared funciton of different scenes
-----------------------------------------------------------------------------------------
-- function used to remove all elements in the current scene so that they ca  be overwritten
function removeElements(sceneGroup)
    for i = sceneGroup.numChildren, 1, -1 do
        local child = sceneGroup[i]
        display.remove(child)
    end
end

-- function to calcel current timer
function cancelTimer()
    if myTimer then
        timer.cancel(myTimer)
        myTimer = nil
    end
end

-- create function of idling state of living cell
function stopSimulation()
    removeElements(buttonGroup) -- remove button elements of scene
    removeElements(sceneGroup) -- remove button elements of scene
    cancelTimer() -- null the timer to avoid incongruency if scene is recalled
    createGrid(sceneGroup, grid) -- display last grid

    buttonWidth = width / 2
    local where = "Modulus.cellScene"
    resumeButton(where, buttonWidth, height / 1.80)
    local where = "Modulus.menuScene"
    restartButton(where, buttonWidth, height / 1.6)
    saveButton(buttonWidth, height / 1.35)
end
-- switch function to change scene in case a button is pressed
function switch(event)
    local where = event.target.id

    removeElements(buttonGroup) -- remove button elements of scene
    cancelTimer() -- null the timer to avoid incongruency if scene is recalled

    local options = {
        effect = effect,
        time = 10,
        params = {
            grid = grid
        }
    }
    composer.gotoScene(where, options)
end

