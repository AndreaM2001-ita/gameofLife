-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- mudule to contain all shared funciton of different scenes
-----------------------------------------------------------------------------------------
-- function used to remove all elements in the current scene so that they ca  be overwritten
function removeElements(groups)
    for i = groups.numChildren, 1, -1 do
        local child = groups[i]
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
    if isUpdating then
        cancelTimer() -- null the timer to avoid incongruency if scene is recalled
        isUpdating = false
    end

    -----------display buttons 
    buttonWidth = width / 2
    saveButton(buttonWidth, height / 1.35)
    local where = "Modulus.cellScene"
    resumeButton(where, buttonWidth, height / 1.80)
    local where = "Modulus.menuScene"
    restartButton(where, buttonWidth, height / 1.6)

end
-- switch function to change scene in case a button is pressed
function switch(event)
    local where = event.target.id

    if isUpdating then
        cancelTimer() -- null the timer to avoid incongruency if scene is recalled
        isUpdating = false
    end

    removeElements(sceneGroup) -- remove grid elements of scene
    removeElements(buttonGroup) -- remove button elements of scene

    composer.gotoScene(where)
end

