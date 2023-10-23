-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- unit Test functions
-----------------------------------------------------------------------------------------
-- testing of openFile function   -------------DEPRECATED
--[[ 
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
]] --
function openFile_Test(errors)
    local fileName = "grid.json" -- name of the final contining initial grid

    print("--testing opening JSON file in read mode")
    local mode = "r"
    local file = openJSON(fileName, mode)
    if file then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end
    file = closeFile(file)
    print("--testing opening JSON file in write mode")
    local mode = "w"
    local file = openJSON(fileName, mode)
    if file then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end

    print("--testing closing of JSON file")
    file = closeFile(file)
    if file then
        errors = errors .. "E "
    else
        errors = errors .. "OK "
    end

    return errors
end
--[[
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
end]] --
-- testing read and write functions of json
function readWriteFile_Test(errors)
    local fileName = "grid.json" -- name of the final contining initial grid
    print("--create random grid")
    local grid = createRandomGrid()
    if grid then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end

    print("--saving new grid/writing")
    saveNewData(fileName, grid)
    print("--reading if new saved stated was saved")
    print("\n")
    local data = readWhole(fileName)
    if data then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end
    return errors
end
-- function that checks if the function to verify if the file is empty works, and the delete entire file function 
function isJSONEmpty_Test(errors)
    local fileName = "grid.json" -- initiating needed variables for testing
    print("--check if file is empty, but it is not as it was just written")
    if isJSONEmpty(fileName) then
        errors = errors .. "E "
    else
        errors = errors .. "OK "
    end
    print("--delete file")
    deleteJSON()
    if isJSONEmpty(fileName) then
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end
    return errors
end
-- function which adds logical borders to the grid
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
    local counter1 = sumMaskValues(mask, 3, 3)

    local counter = 0
    for i = 2, 4 do -- sum values in 3x3 masks
        for j = 2, 4 do
            local key = i .. "," .. j
            if type(mask[key]) ~= "string" then
                counter = counter + mask[key] -- counts how many alive cells are around
            end
        end
    end
    if mask[3 .. "," .. 3] == 1 then -- the cell itself should't be counted
        counter = counter - 1
    end

    if counter1 == counter then
        print("\n")
        print("count is " .. counter .. "and it is correct. Remember that if cell is alive its value is not counted")
        errors = errors .. "OK "
    else
        errors = errors .. "E "
    end
    return errors
end

