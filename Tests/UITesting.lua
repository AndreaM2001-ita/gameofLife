-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- User Interface testing functions
-----------------------------------------------------------------------------------------
require("Modulus.cellScene") -- modulus for the function to update grid
require("Modulus.cellFile") -- modulus for the function to read grid
function UITesting()
    print("---------------------------------------------------------------------------------------------")
    print("---------------------------------Running User Testing(UI) Testing----------------------------")
    print("\n")

    print("------------------Running tests to see how many rects are created in sceneGroup")
    local grid = createRandomGrid()
    local sceneGroup = display.newGroup()
    createGrid(sceneGroup, grid, 0)
    local group = returnGroup()
    print("the number of children is supposed to be " .. cellNumber * cellNumber)
    print("the number of children is " .. #group - cellNumber + 1)
    removeElements(sceneGroup) -- function called to delete scenegroup from screen

end
