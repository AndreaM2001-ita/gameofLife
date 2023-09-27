-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- unit Test functions
-----------------------------------------------------------------------------------------
-- testing of openFile function
function openFile_Test(errors)
    local fileName = "Data/grid.txt" -- name of the final contining initial grid

    local file = openFile(fileName) -- read the initial state of the grid
    if file then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end
    file = closeFile(file)
    if file then
        errors = errors .. "E "
    else
        errors = errors .. "OK "
    end
    return errors
end
-- testing of read function 
function readFile_Test(errors)
    local fileName = "Data/grid.txt"

    local grid = readFile(fileName) -- read the initial state of the grid

    if grid then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end

    return errors
end
-- test function which adds logical borders to the grid
function addLogicalBorders_Test(errors, grid)

    grid = addLogicalBorders(grid)

    if grid["0,0"] then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end
    return errors, grid
end

-- test function that sums the value of a mask of a position on the grid, 3,3 used for testing
function sumMaskValues_Test(errors, grid)
    print("\n")
    print("summing values for submask of cell in positon 3,3")
    local mask = createUnderGrid(grid, 3, 3)
    local counter = sumMaskValues(mask, 3, 3)

    if counter == 2 then
        print("\n")
        print("count is " .. counter .. "and it is correct. Remember that if cell is alive its value is not counted")
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end
    return errors

end

