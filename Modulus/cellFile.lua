-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- program used to contain all the function used to deal with the file and the reading and writing of the old and new values
-----------------------------------------------------------------------------------------
------open files that contains grid
function openFile(fileName, mode)
    local path = system.pathForFile(fileName, system.DocumentDirectory)

    local file, errorString = io.open(path, mode) -- open file in read only mode

    if not file then
        print(errorString)
    end

    return file
end

-- function to close the file which contains the grid
function closeFile(file)
    io.close(file)
    file = nil
    return file
end

-- main function to read the file, used to 
-- open file
-- read file
-- close file
function readFile(fileName)

    local file = openFile(fileName, "r")

    local grid = {}
    local x = 1
    for line in file:lines() do
        local y = 1
        for digit in line:gmatch("%d") do
            local key = x .. "," .. y
            grid[key] = tonumber(digit) -- convert char to int
            y = y + 1
        end
        x = x + 1
    end

    closeFile(file)

    return grid

end

function writeRondomFile(fileName)

    local file = openFile(fileName, "w")

    for i = 0, cellNumber - 1 do
        for j = 0, cellNumber - 1 do
            local key = i .. "," .. j
            local randomNumber = math.random(1, 100)
            if randomNumber % 2 == 0 then
                file:write(1)
            else
                file:write(0)
            end

            -- file:write(grid[key])
        end
        file:write("\n")
    end

    closeFile(file)

end

