-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- unit Testing execution, report on any function error
-----------------------------------------------------------------------------------------
-------------------testing of cellFile module--------------------------------------------
require("Modulus.cellFile") -- modulus for the function to read grid
require("Modulus.cellTable") -- modulus for the function to update grid
require("Tests.UnitTest")

local function printResults(errors)
    print("\n")
    print("RESULTS")
    print("=> " .. errors)
    print("\n")
end

function unitTesting()
    print("---------------------------------------------------------------------------------")
    print("---------------------------------Running Unit Testing----------------------------")
    print("\n")

    print("E=>Error")
    print("OK=>function return expected result")

    ---------------RUN tests----------------DEPRECATED
    --[[
    print("---------------------------Running tests for cellFile module---------------------")
    local errors = ""
    print("1 & 2) testing open and close file function")
    errors = openFile_Test(errors)
    print("3) testing read file function")
    errors = readFile_Test(errors)
    printResults(errors)
    ]] --
    local errors = ""
    printResults(errors)
    print("1 & 2) testing open and close file function")
    errors = openFile_Test(errors)
    print("3) testing read file function")
    errors = readWriteFile_Test(errors)
    errors = isJSONEmpty_Test(errors)
    printResults(errors)

    print("---------------------------Running tests for cellTable module---------------------")
    errors = ""
    -- local fileName = "Data/grid.txt" -- initiating needed variables for testing
    -- local grid = readFile(fileName)
    local fileName = "grid.json" -- initiating needed variables for testing
    local grid = createRandomGrid()

    print("1)testing addLogicalBorders function")
    errors, grid = addLogicalBorders_Test(errors, grid)
    print("2)testing function that adds values to of all neighbouring cells of 3,3 ")
    errors = sumMaskValues_Test(errors, grid)
    printResults(errors)

end
