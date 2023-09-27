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
        onRelease = switch,
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
        onRelease = function(event)
            writeRondomFile(fileName)
            grid = readFile(fileName) -- read the initial state of the grid
            switch(event)
        end,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 200,
        height = 45,
        color = fillColor
    });
    restart:addEventListener("tap", switch)
    buttonGroup:insert(restart)
    return restart
end
-- button to save current state of grid
function saveButton(x, y)
    save = widget.newButton({
        -- id=where,
        onRelease = switch,
        shape = "roundedRect",
        x = x,
        y = y,
        width = 70,
        height = 70,
        label = "SAVE",
        color = fillColor

    });
    buttonGroup:insert(save)
    return save
end
