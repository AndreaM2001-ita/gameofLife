-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- BlackBox Testing functions
-----------------------------------------------------------------------------------------
-- function to test if the mask for positon 3x3 is created correctly
function createUnderGrid_Test(grid)
    print("create undergrid for positon 3,3")
    mask = createUnderGrid(grid, 3, 3)
    print("printing mask for posiotn 3,3")

    for i = 2, 4 do
        for j = 2, 4 do
            local key = i .. "," .. j
            io.write(grid[key] .. " ")
        end
        io.write("\n")
    end

end
-- function to check the main function to upgrade grid to next state
function updateGrid_test(grid)
    grid = updateGrid(grid)
    printGrid(grid)

end

