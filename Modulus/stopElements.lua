-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- stop module created to handle user interaction after they have pressed stop, in order to save the
-- iterations, restart simulation, or save current state of simulation
-----------------------------------------------------------------------------------------
local widget = require("widget")

require("Modulus.manageScene")
require("Modulus.cellFile")
-- function to create a restart button when the iteration is stopped
function resumeButton(where, x, y)
    resume = widget.newButton({
        id = where,
        label = "RESUME",
        value = "RESUME",
        onRelease = perform,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 45,
        color = fillColor
    });
    buttonGroup:insert(resume)
    return resume
end

-- button to restart with a new state of grid
function restartButton(where, x, y)
    restart = widget.newButton({
        id = where,
        label = "RESTART",
        onRelease = switch,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 45,
        color = fillColor
    });
    buttonGroup:insert(restart)
    return restart
end
function saving(event)
    event.target.alpha = 0.2 -- make the save button fade
    event.target:removeEventListener("tap", saving) -- remove its listener to avoid same state more than once
    saveNewData(fileName, grid)
end
-- button to save current state of grid
function saveButton(x, y)
    saveB = widget.newButton({
        -- id = where,
        label = "SAVE",
        shape = "roundedRect",
        x = x,
        y = y,
        width = 80,
        height = 80
    });
    saveB:addEventListener("tap", saving)
    buttonGroup:insert(saveB)
    return save
end
