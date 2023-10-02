-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- program used to contain all the function used to deal with the file and the reading and writing of the old and new values
-----------------------------------------------------------------------------------------
local json = require("json")

-- function to close the file which contains the grid
function closeFile(file)
    io.close(file)
    file = nil
    return file
end

-- function to open json file in requested mode
function openJSON(fileName, mode)

    local path
    path = system.pathForFile(fileName, system.DocumentsDirectory)

    local file, errorString = io.open(path, mode) -- open file in  mode

    if not file then
        print("error")
    end
    return file

end

-- return true if json file is empty
function isJSONEmpty(fileName)
    -- Open the file for reading
    local file = openJSON(fileName, "r")
    if file then
        -- Read the contents of the file
        local content = file:read("*a")
        closeFile(file)

        local data = json.decode(content)

        if data == nil then -- check if file is empty
            return true -- JSON file is empty
        else
            return false -- JSON file is not empty
        end
    else
        return true -- Unable to open the file, consider it empty
    end
end

-- function to create a random grid of the right dimension
function createRandomGrid()
    grid = {}
    for i = 1, cellNumber do
        for j = 1, cellNumber do
            local key = i .. "," .. j
            local randomNumber = math.random(1, 100)
            if randomNumber % 2 == 0 then
                grid[key] = 1
            else
                grid[key] = 0
            end
        end
    end
    return grid
end

-- function to write/APPEND a random grid onto the json file
function writeJSON(fileName, data)

    local file = openJSON(fileName, "w")

    if file then
        local contents = json.encode(data)
        local success = file:write(contents .. "\n")
        closeFile(file)

        if success then
            print("JSON data has been saved to " .. fileName)
        end
    else
        print("Error opening file for writing")
    end
end

function findID(data)
    -- Check if the parsed data is a table and has an array field
    if data then
        if type(data) == "table" and data[1] then
            local numObjects = #data
            print("Number of objects in the JSON file: " .. numObjects)
            return numObjects
        else
            print("The JSON file does not contain an array of objects.")

        end
    end
    return 0
end

function saveNewData(fileName, grid)
    local file = openJSON(fileName, "r")
    if file then
        local content = file:read("*a") -- read current file
        closeFile(file)

        local currentData = json.decode(content) -- decode json in a table
        if not currentData then
            currentData = {} -- Initialize as an empty table if JSON decoding fails
        end
        local num = findID(currentData) -- find how many objects already in json

        local newObj = {{ -- create new obj
            id = num + 1,
            grid = grid
        }}

        table.insert(currentData, newObj[1]) -- insert new obj in data table

        writeJSON(fileName, currentData)

    else
        print("Error opening file for reading")
    end

end

function readWhole(fileName)
    local file = openJSON(fileName, "r")
    local data = {} -- Initialize an empty table to store the data

    if file then
        local jsonString = file:read("*a")

        closeFile(file)

        local content = json.decode(jsonString) -- decode json in a table

        for _, obj in pairs(content) do
            local current = {} -- Create a new entry for each object
            current.id = obj.id
            current.grid = obj.grid
            table.insert(data, current) -- Add the entry to the data table
        end
        print("JSON data read from" .. fileName)
    else
        print("Error opening file for reading")
    end
    return data
end

-- function to delete content of json 
function deleteJSON(event)
    -- Open the file in write mode ("w") 

    local file = openJSON(fileName, "w")

    if file then
        closeFile(file)
        print("JSON file content has been deleted: " .. fileName)
    else
        print("Error opening file for deletion")
    end
end
Runtime:addEventListener("system", deleteJSON)

--------------------------------------------------------DEPRECATED USING NORMAL FILE
-- main function to read the file, used to 
-- open file
-- read file
-- close file
--[[function readFile(fileName)

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

end]] --

--[[function writeRondomFile(fileName)

    local file = openFile(fileName, "w")

    for i = 0, cellNumber - 1 do
        for j = 0, cellNumber - 1 do
            local randomNumber = math.random(1, 100)
            if randomNumber % 2 == 0 then
                file:write(1)
            else
                file:write(0)
            end
        end
        file:write("\n")
    end

    closeFile(file)

end]] --

--[[function writeNew()

    local filePath = "Data/new.txt"
    local file, errorString = io.open(filePath, "w")

    if file then
        for i = 0, cellNumber - 1 do
            for j = 0, cellNumber - 1 do
                local key = i .. "," .. j
                file:write(grid[key])
            end
            file:write("\n")
        end
        closeFile(file)
    else
        print("Error: Unable to write new file")
    end
end]] --
------open files that contains grid
--[[
function openFile(fileName, mode)
    local path = system.pathForFile(fileName, system.DocumentDirectory)

    local file, errorString = io.open(path, mode) -- open file in  mode

    if not file then
        print(errorString)
    end

    return file
end]] --
