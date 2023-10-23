-----------------------------------------------------------------------------------------
-- Student Name: Andrea Marcosano
-- Student Number: 10541054
-- main.lua
-----------------------------------------------------------------------------------------
require("Modulus.menuScene") -- modulus for the function to update grid

require("Tests.unitTesting") -- modulus that contains all the unit testing required

require("Tests.blackBoxTesting") -- modulus that contains all the unit testing required

require("Tests.UITesting")

width = display.actualContentWidth
height = display.actualContentHeight

cellNumber = 30 -- number of cells per side 
fileName = "grid.json" -- name of the final contining initial grid

print("===============================START OF TESTING====================================")

unitTesting() -- start unitTesting
blackBoxTesting() -- start blackBoxTesting
UITesting() -- start user interface testing

print("=================================END OF TESTING====================================")

local composer = require("composer") -- composer module

local options = {
    effect = effect,
    time = 1000
}

composer.gotoScene("Modulus.menuScene", options) -- composer to go to the next scene containing table on screen

-- DELIVERABLE 8
--[[
print("Processing Structure 2b")
local fileName2b = "Data/grid2b.txt" -- name of the final contining initial grid
local grid2b = readFile(fileName2b) -- read the initial state of the grid

for i = 0, 4 do -- loop through 5 iterations
    printGrid(grid2b)
    grid2b = updateGrid(grid2b)
end

print("Processing Structure 2c")

local fileName2c = "Data/grid2c.txt" -- name of the final contining initial grid
local grid2c = readFile(fileName2c) -- read the initial state of the grid

for i = 0, 4 do -- loop through 5 iterations
    printGrid(grid2c)
    grid2c = updateGrid(grid2c)
end

print("Processing Structure 2d")

local fileName2d = "Data/grid2d.txt" -- name of the final contining initial grid
local grid2d = readFile(fileName2d) -- read the initial state of the grid

for i = 0, 4 do -- loop through 5 iterations
    printGrid(grid2d)
    grid2d = updateGrid(grid2d)
end]] --

