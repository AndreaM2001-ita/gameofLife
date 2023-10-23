-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- unit Testing execution, report on any function error
-----------------------------------------------------------------------------------------
-------------------testing of cellFile module--------------------------------------------
require("Modulus.cellFile") -- modulus for the function to read grid
require("Modulus.cellTable") -- modulus for the function to update grid
require("Tests.BlackBox")

function blackBoxTesting()
    print("---------------------------------------------------------------------------------")
    print("---------------------------------Running BlackBox Testing----------------------------")
    print("\n")

    ---------------RUN tests----------------DEPRECATED
    --[[
    print("---------------------------Running tests for cellTable module---------------------")
    local fileName = "Data/grid.txt" -- initiating needed variables for testing
    local grid = readFile(fileName)
    print("1)testing creating 3x3 matrix for each cell to calculate sum function")
    createUnderGrid_Test(grid)
    print("2)testing function that updates grid, by printing next state ")
    updateGrid_test(grid)
    ]] --
    local fileName = "grid.json" -- initiating needed variables for testing
    local a = cellNumber -- storing usual value of cellNumber
    cellNumber = 5 -- changing value of cellnumber to make tetsing more accessible 
    local grid = createRandomGrid()
    printGrid(grid)

    print("1)testing creating 3x3 matrix for each cell to calculate sum function")
    createUnderGrid_Test(grid)
    print("2)testing function that updates grid, by printing next state ")
    updateGrid_test(grid)
    cellNumber = a

end

