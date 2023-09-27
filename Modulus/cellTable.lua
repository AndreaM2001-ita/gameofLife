-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- program used to contain all the function used to print and update grid logically
-----------------------------------------------------------------------------------------
---function to print out grid at current state on terminal
function printGrid(grid)

    print("-------------------------")
    for i = 1, cellNumber do
        for j = 1, cellNumber do
            local key = i .. "," .. j
            io.write(grid[key] .. " ")
        end
        io.write("\n")
    end
    print("-------------------------")
end

-- checks if we are calculating sum of neighbours in a border position of the matrix
function checkIfinRange(digit)
    if digit == 0 or digit == cellNumber + 1 then -- extremes of matrix coordinates
        return true
    end

end
-- add logical border to link top of matrix with its bottom, and its left side with its right side
function addLogicalBorders(grid)
    for i = 0, cellNumber + 1 do
        for j = 0, cellNumber + 1 do
            -- initiates nil value->create logical concatenation of grid
            local staticKey = i .. "," .. j -- initiating static key of current position
            if checkIfinRange(i) and checkIfinRange(j) then
                grid[staticKey] = "#" -- corners of matrix logical linking 
            elseif checkIfinRange(i) or checkIfinRange(j) then
                local compositeKey = ""
                if i == 0 then
                    compositeKey = (i + cellNumber) .. "," .. j -- link to bottom of matrix
                elseif j == 0 then
                    compositeKey = i .. "," .. j + cellNumber -- link to right side of matrix
                elseif i == cellNumber + 1 then
                    compositeKey = (i - cellNumber) .. "," .. j -- link to top side of matrix
                elseif j == cellNumber + 1 then
                    compositeKey = i .. "," .. j - cellNumber -- link to left side of matrix
                end
                grid[staticKey] = grid[compositeKey]
            end
        end
    end
    return grid
end

-- function used to create a 3x3 mask of the current cell for then calculate the sum of neighbors cells

function createUnderGrid(grid, tensDigit, onesDigit)
    local mask = {}
    for i = tensDigit - 1, tensDigit + 1 do -- use the previous and next positon to be sure that the mask is 3x3
        for j = onesDigit - 1, onesDigit + 1 do
            local key = i .. "," .. j
            mask[key] = grid[key]
        end
    end
    return mask
end

-- function used to sum the values of the mask currently created
function sumMaskValues(mask, tensDigit, onesDigit)
    local counter = 0
    for i = tensDigit - 1, tensDigit + 1 do -- sum values in 3x3 masks
        for j = onesDigit - 1, onesDigit + 1 do
            local key = i .. "," .. j
            if type(mask[key]) ~= "string" then
                counter = counter + mask[key] -- counts how many alive cells are around
            end
        end
    end
    if mask[tensDigit .. "," .. onesDigit] == 1 then -- the cell itself should't be counted
        counter = counter - 1
    end

    return counter
end

-- function to check value of sum of neighour cells of each cell, in order to calculate their next state
function checkValue(grid, tensDigit, onesDigit)
    if tensDigits == 1 or tensDigits == cellNumber or onesDigit == 1 or onesDigit == cellNumber then -- control only borders to improve efficiency
        grid = addLogicalBorders(grid, tensDigit, onesDigit) -- add logical border to create outer link
    end

    local mask = createUnderGrid(grid, tensDigit, onesDigit) -- create 3 by 3 undergrid to prepare for the sum
    local counter = sumMaskValues(mask, tensDigit, onesDigit) -- sum of neighbors cells
    return counter
end

-- function to update grid to next state 
----------------------updating phase--------------------------
function updateGrid(grid)
    local counter = 0
    local counter = {}
    for i = 1, cellNumber, 1 do
        counter[i] = {}
        for j = 1, cellNumber, 1 do
            counter[i][j] = checkValue(grid, i, j) -- check if the status of current cell is alive or dead and counts values of its neighbors
        end
    end
    local newGrid = {}
    for i = 1, cellNumber, 1 do
        for j = 1, cellNumber, 1 do
            local key = i .. "," .. j
            local count = counter[i][j]
            if type(grid[key]) ~= "string" then -- CHANGE STATUS
                if grid[key] == 0 and count == 3 then -- dead
                    newGrid[key] = 1
                elseif grid[key] == 1 and (count > 3 or count < 2) then
                    newGrid[key] = 0
                else
                    newGrid[key] = grid[key]
                end
            end

        end
    end

    return newGrid
end

function initiateGrid()

end
