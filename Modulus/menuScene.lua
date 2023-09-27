local composer = require("composer")
local scene = composer.newScene()

require("Modulus.cellTable") -- modulus for the function to update grid

require("Modulus.cellFile") -- modulus for the function to open grid

require("Modulus.cellScene") -- modulus for the function to show cell scene with iterating grid

local widget = require("widget")

function randomButton(where, x, y)
    random = widget.newButton({
        id = where,
        onRelease = switch,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 100,
        label = "RANDOM",
        color = fillColor
    });
    buttonGroup:insert(random)
    return stop
end

function scene:create(event)
    sceneGroup = self.view
    buttonGroup = display.newGroup(); -- initialise group of buttons on scene

    writeRondomFile(fileName)
    grid = readFile(fileName) -- read the initial state of the 

    local where = "Modulus.cellScene"
    randomButton(where, width / 2, height / 5)

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
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
