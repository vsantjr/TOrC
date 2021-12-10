--[=====[ 


MUTANT D
	
TTR:

Strength = 3
Total = 120

FindBestImages: 

Limit = 0.85

Simulation Time

20

--]=====] 
function get_tuple(t)
   local valf = {}
   if t == 1 then
     valf = {1, 1, 1, 4, 4}
   elseif t == 2 then
     valf = {1, 1, 2, 3, 3}
   elseif t == 3 then
     valf = {1, 1, 3, 2, 4}
   elseif t == 4 then
     valf = {1, 1, 4, 1, 1}
   elseif t == 5 then
     valf = {1, 1, 5, 2, 2}
   elseif t == 6 then
     valf = {1, 2, 1, 2, 1}
   elseif t == 7 then
     valf = {1, 2, 2, 4, 4}
   elseif t == 8 then
     valf = {1, 2, 3, 1, 3}
   elseif t == 9 then
     valf = {1, 2, 4, 4, 3}
   elseif t == 10 then
     valf = {1, 2, 5, 3, 2}
   elseif t == 11 then
     valf = {1, 3, 1, 2, 3}
   elseif t == 12 then
     valf = {1, 3, 2, 1, 2}
   elseif t == 13 then
     valf = {1, 3, 3, 3, 1}
   elseif t == 14 then
     valf = {1, 3, 4, 3, 1}
   elseif t == 15 then
     valf = {1, 3, 5, 1, 4}
   elseif t == 16 then
     valf = {1, 4, 1, 2, 2}
   elseif t == 17 then
     valf = {1, 4, 2, 1, 1}
   elseif t == 18 then
     valf = {1, 4, 3, 1, 4}
   elseif t == 19 then
     valf = {1, 4, 4, 4, 4}
   elseif t == 20 then
     valf = {1, 4, 5, 3, 3}
   elseif t == 21 then
     valf = {1, 5, 1, 3, 4}
   elseif t == 22 then
     valf = {1, 5, 2, 2, 2}
   elseif t == 23 then
     valf = {1, 5, 3, 1, 3}
   elseif t == 24 then
     valf = {1, 5, 4, 4, 2}
   elseif t == 25 then
     valf = {1, 5, 5, 4, 1}
   elseif t == 26 then
     valf = {2, 1, 1, 1, 3}
   elseif t == 27 then
     valf = {2, 1, 2, 2, 2}
   elseif t == 28 then
     valf = {2, 1, 3, 4, 1}
   elseif t == 29 then
     valf = {2, 1, 4, 3, 4}
   elseif t == 30 then
     valf = {2, 1, 5, 2, 4}
   elseif t == 31 then
     valf = {2, 2, 1, 4, 2}
   elseif t == 32 then
     valf = {2, 2, 2, 3, 1}
   elseif t == 33 then
     valf = {2, 2, 3, 2, 3}
   elseif t == 34 then
     valf = {2, 2, 4, 1, 2}
   elseif t == 35 then
     valf = {2, 2, 5, 4, 4}
   elseif t == 36 then
     valf = {2, 3, 1, 3, 4}
   elseif t == 37 then
     valf = {2, 3, 2, 4, 3}
   elseif t == 38 then
     valf = {2, 3, 3, 3, 2}
   elseif t == 39 then
     valf = {2, 3, 4, 2, 1}
   elseif t == 40 then
     valf = {2, 3, 5, 1, 3}
   elseif t == 41 then
     valf = {2, 4, 1, 1, 1}
   elseif t == 42 then
     valf = {2, 4, 2, 2, 4}
   elseif t == 43 then
     valf = {2, 4, 3, 4, 3}
   elseif t == 44 then
     valf = {2, 4, 4, 3, 3}
   elseif t == 45 then
     valf = {2, 4, 5, 2, 1}
   elseif t == 46 then
     valf = {2, 5, 1, 2, 1}
   elseif t == 47 then
     valf = {2, 5, 2, 1, 1}
   elseif t == 48 then
     valf = {2, 5, 3, 1, 4}
   elseif t == 49 then
     valf = {2, 5, 4, 4, 3}
   elseif t == 50 then
     valf = {2, 5, 5, 3, 2}
   elseif t == 51 then
     valf = {3, 1, 1, 4, 1}
   elseif t == 52 then
     valf = {3, 1, 2, 1, 1}
   elseif t == 53 then
     valf = {3, 1, 3, 1, 4}
   elseif t == 54 then
     valf = {3, 1, 4, 2, 3}
   elseif t == 55 then
     valf = {3, 1, 5, 4, 2}
   elseif t == 56 then
     valf = {3, 2, 1, 3, 3}
   elseif t == 57 then
     valf = {3, 2, 2, 4, 2}
   elseif t == 58 then
     valf = {3, 2, 3, 3, 4}
   elseif t == 59 then
     valf = {3, 2, 4, 2, 2}
   elseif t == 60 then
     valf = {3, 2, 5, 1, 1}
   elseif t == 61 then
     valf = {3, 3, 1, 4, 2}
   elseif t == 62 then
     valf = {3, 3, 2, 3, 1}
   elseif t == 63 then
     valf = {3, 3, 3, 2, 1}
   elseif t == 64 then
     valf = {3, 3, 4, 1, 4}
   elseif t == 65 then
     valf = {3, 3, 5, 3, 3}
   elseif t == 66 then
     valf = {3, 4, 1, 2, 4}
   elseif t == 67 then
     valf = {3, 4, 2, 1, 3}
   elseif t == 68 then
     valf = {3, 4, 3, 3, 2}
   elseif t == 69 then
     valf = {3, 4, 4, 4, 1}
   elseif t == 70 then
     valf = {3, 4, 5, 3, 4}
   elseif t == 71 then
     valf = {3, 5, 1, 1, 2}
   elseif t == 72 then
     valf = {3, 5, 2, 2, 4}
   elseif t == 73 then
     valf = {3, 5, 3, 4, 3}
   elseif t == 74 then
     valf = {3, 5, 4, 3, 1}
   elseif t == 75 then
     valf = {3, 5, 5, 2, 1}
   elseif t == 76 then
     valf = {4, 1, 1, 2, 1}
   elseif t == 77 then
     valf = {4, 1, 2, 4, 4}
   elseif t == 78 then
     valf = {4, 1, 3, 3, 3}
   elseif t == 79 then
     valf = {4, 1, 4, 1, 2}
   elseif t == 80 then
     valf = {4, 1, 5, 3, 1}
   elseif t == 81 then
     valf = {4, 2, 1, 1, 4}
   elseif t == 82 then
     valf = {4, 2, 2, 2, 3}
   elseif t == 83 then
     valf = {4, 2, 3, 4, 2}
   elseif t == 84 then
     valf = {4, 2, 4, 3, 1}
   elseif t == 85 then
     valf = {4, 2, 5, 2, 3}
   elseif t == 86 then
     valf = {4, 3, 1, 2, 2}
   elseif t == 87 then
     valf = {4, 3, 2, 1, 1}
   elseif t == 88 then
     valf = {4, 3, 3, 4, 4}
   elseif t == 89 then
     valf = {4, 3, 4, 4, 3}
   elseif t == 90 then
     valf = {4, 3, 5, 3, 2}
   elseif t == 91 then
     valf = {4, 4, 1, 4, 3}
   elseif t == 92 then
     valf = {4, 4, 2, 3, 2}
   elseif t == 93 then
     valf = {4, 4, 3, 2, 1}
   elseif t == 94 then
     valf = {4, 4, 4, 1, 2}
   elseif t == 95 then
     valf = {4, 4, 5, 4, 4}
   elseif t == 96 then
     valf = {4, 5, 1, 3, 2}
   elseif t == 97 then
     valf = {4, 5, 2, 4, 1}
   elseif t == 98 then
     valf = {4, 5, 3, 3, 1}
   elseif t == 99 then
     valf = {4, 5, 4, 2, 4}
   elseif t == 100 then
     valf = {4, 5, 5, 1, 3}
   elseif t == 101 then
     valf = {5, 1, 1, 3, 2}
   elseif t == 102 then
     valf = {5, 1, 2, 2, 1}
   elseif t == 103 then
     valf = {5, 1, 3, 1, 2}
   elseif t == 104 then
     valf = {5, 1, 4, 4, 4}
   elseif t == 105 then
     valf = {5, 1, 5, 4, 3}
   elseif t == 106 then
     valf = {5, 2, 1, 2, 4}
   elseif t == 107 then
     valf = {5, 2, 2, 1, 4}
   elseif t == 108 then
     valf = {5, 2, 3, 4, 1}
   elseif t == 109 then
     valf = {5, 2, 4, 4, 4}
   elseif t == 110 then
     valf = {5, 2, 5, 3, 3}
   elseif t == 111 then
     valf = {5, 3, 1, 1, 3}
   elseif t == 112 then
     valf = {5, 3, 2, 2, 4}
   elseif t == 113 then
     valf = {5, 3, 3, 4, 3}
   elseif t == 114 then
     valf = {5, 3, 4, 3, 2}
   elseif t == 115 then
     valf = {5, 3, 5, 2, 1}
   elseif t == 116 then
     valf = {5, 4, 1, 3, 1}
   elseif t == 117 then
     valf = {5, 4, 2, 4, 2}
   elseif t == 118 then
     valf = {5, 4, 3, 3, 4}
   elseif t == 119 then
     valf = {5, 4, 4, 2, 3}
   elseif t == 120 then
     valf = {5, 4, 5, 1, 2}
   end

   return valf
end

function sel_values(i)
   
   --pcv = {0.01, 0.1, 0.2, 0.5, 1.0}
   --dcv = {1.2, 1.5, 2.0, 2.5, 3.5}
   --wcv = {0.6, 0.8, 0.9, 1.0, 1.2}
   --rpsv = {100, 50, 75, 100}
   --rv = {100, 50, 75, 200}
   -- Values
   
   
   -- plantCover = Choice{min = 0.01, max = 1}: [0.92831678 0.70914366 0.21934725 0.75899904]
   -- dryCoeff = Choice{min = 1.2, max = 3.5}: [2.93645044 2.60452924 3.22446598 3.2803284 ]
   -- wetCoeff = Choice{min = 0.6, max = 1.2}: [1.0936453  0.85010717 0.8534501  1.01838802]
   -- rainfallPlantSurvival = 100: [67.61273751 136.14181267  77.56816499] (int)
   -- rainfall = 100: [ 57.69383444  61.33035242  83.64490872]
   
   pcv = {0.13, 0.92, 0.70, 0.21, 0.45}
   dcv = {1.5, 2.93, 2.60, 3.22, 1.88}
   wcv = {0.6, 1.09,  0.85, 0.75,  1.01}
   rpsv = {100, 67, 136,  77}
   rv = {100, 57,  61,  183}
   
      
   return pcv[i[1]], dcv[i[2]], wcv[i[3]], rpsv[i[4]], rv[i[5]]
end

local function plotPerfil(model)
	local perfil = {x = {}, state = {}}

	forEachCell(model.cs, function(cell)
		table.insert(perfil.x, cell.x)
		table.insert(perfil.state, cell.state)
	end)

	local perfilMean = DataFrame{elevation = {}, plantCover = {}}
	local sum
	for i = 0, 49 do
		sum = 0
		for j = 1, 2500 do
			if perfil.x[j] == i and perfil.state[j] == "plants" then
				sum = sum + 1
			end
		end

		perfilMean:add{plantCover = sum / 50, elevation = i}
	end

	Chart{
		target = perfilMean,
		select = "plantCover",
		xAxis = "elevation",
		yLabel = "Plant Cover",
		xLabel = "Elevation (un)",
		symbol = "square",
	}
end

local function init(model)
	model.cell = Cell{
		state = Random{plants = model.plantCover, empty = 1 - model.plantCover},
		water = 0,
		init = function(cell)
			-- cell elevation is defined based on dimension: equally on x axis and varying on y
			cell.elevation = 50 - cell.y
		end,
		evapotranspiration = function(cell) -- annual loss of water by evapotranspiration
			if cell.state == "plants" then
				cell.water = 10
			else
				cell.water = 0
			end
		end,
		plantSurvival = function(cell)
		    
		    
			if cell.water < model.dryCoeff * model.rainfallPlantSurvival and cell.state == "plants" then
				-- plant cells too dry become empty
				cell.state = "empty"
			-- Mutation 1: Relational Operator Replacement (ROR1)	
			-- elseif cell.water >= model ... original
			elseif cell.water < model.wetCoeff * model.rainfallPlantSurvival and cell.state == "empty" then
				-- empty cells too wet become plant
				cell.state = "plants"
			end
		end,
		rain = function(cell)
			cell.water = cell.water + model.rainfall
		end,
		waterPartition = function(cell)
		    
		    		    
			if cell.state == "empty" then -- empty case
				-- all water except 10 mm goes downslope
				forEachNeighbor(cell, function(neigh)
				    -- Mutation 2:  Relational Operator Replacement (ROR1)
				    -- if neigh.elevation < cell ... original
					if neigh.elevation <= cell.elevation then
						neigh.water = neigh.water + (cell.water - 10)
					end
				end)

				-- 10 mm of water stays in the soil
				cell.water = 10
				return
			end

			-- plant case
			-- calculate 10% of cell water to give to each neighbor
			local tenPercent = cell.water * 0.1
			-- remember first cell
			local donorCell = cell

			-- distribute water downslope
			forEachNeighbor(cell, function(neigh)
				if neigh.elevation < cell.elevation then
					-- gives neighbor 10% of cell's water
					neigh.water = neigh.water + tenPercent
					-- remove 10% water from cell
					cell.water = cell.water - tenPercent
				end
			end)

			-- distribute water to neighbors
			if not model.distributeLaterally then return end

			forEachNeighbor(cell, function(neigh)
				if neigh.elevation ~= cell.elevation then return end

				neigh.water = neigh.water + tenPercent -- gives neighbor 10% of cell's water
				cell.water = cell.water - tenPercent -- remove 10% water from cell

				if not model.distributeToSecondNeighbors then return end

				forEachNeighbor(neigh, function(n)
					-- neighbor elevation same as cell guarantees that neighbor is sharing laterally
					-- neighbor different from donor cell guarantees that model doesnt try to share water from donorcell to itself
					if n.elevation == neigh.elevation and n ~= donorCell then
						n.water = n.water + tenPercent / 2 -- gives neighbor 5% of donor cell's water
						donorCell.water = donorCell.water - tenPercent / 2 -- remove 10% water from cell
					end
				end)
			end)
		end
	}

	model.cs = CellularSpace{
		xdim = 50,
		instance = model.cell
	}

    
	model.cs:createNeighborhood{
		strategy = "vonneumann"
	}

	model.traj = Trajectory{
		target = model.cs,
		greater = function(cell1, cell2) return cell1.elevation > cell2.elevation end
	}

	model.map = Map{
		target = model.cs,
		select = "state",
		value = {"plants", "empty"},
		color = {"darkGreen", "lightGray"}
	}

	model.timer = Timer{
		Event{action = model.cs},
		Event{action = function()
				model.cs:rain()
				model.traj:waterPartition()
				model.cs:plantSurvival()
				model.cs:evapotranspiration()
			end},
		Event{action = model.map},
		Event{start = 11, action = function()
			if model.rainDecrease then
				model.rainfall = model.rainfall - 2
				if model.rainfall < 0 then
					model.rainfall = 0
				end
			end
		end},
		Event{start = model.finalTime, priority = "low", action = function()
			plotPerfil(model)

			model.plantCoverFinal = #model.cs:split("state").plants / 2500
			return false
		end}
	}
end

--- Banded vegetation model based on Dunkerley (1997) Banded vegetation: development under uniform
-- rainfall from a simple cellular automaton model. Plant Ecology 129(2):103-111.
-- This model was implemented by Ana Claudia Rorato, Karina Tosto and Ricardo Dal'Agnol da Silva.
-- @arg data.plantCover Initial percentage of plant cover. A number from 0.01 to 1.
-- @arg data.dryCoeff A coefficient beteeen 1.2 and 3.5 to change the state of a cell to dry .
-- @arg data.wetCoeff A coefficient beteeen 0.6 and 1.2 to change the state of a cell to wet.
-- @arg data.rainfallPlantSurvival A value that multiplies dry and wet coefficients. The default value is 100.
-- @arg data.rainfall Amount of rain in each time step. The default value is 100.
-- @arg data.distributeLaterally Distribute water to lateral neighbors? The default value is true.
-- @arg data.distributeToSecondNeighbors Distribute water to the neighbors of lateral neighbors? The default value is true. It only works if distributeLaterally is activated.
-- @arg data.rainDecrease A boolean value indicating whether the rain decreases after time 10. The default value is true.
-- @arg data.finalTime Final simulation tome. The default value is 20.
-- @output plantCoverFinal The percentage of plant cover in the end of the simulation.
-- @image banded-vegetation.bmp
BandedVegetation = Model{
	plantCover = Choice{min = 0.01, max = 1},
	dryCoeff = Choice{min = 1.2, max = 3.5},
	wetCoeff = Choice{min = 0.6, max = 1.2},
	rainfallPlantSurvival = 100,
	rainfall = 100,
	distributeLaterally = true,
	distributeToSecondNeighbors = true,
	rainDecrease = true,
	finalTime = 20,
	init = init
}






for i=1,120 do
 
  
  
  local value = "D"
  pcov, dcoef, wcoef, rps, rf = 0.0, 0.0, 0.0, 0, 0
  
  arr = {}
  arr = get_tuple(i)
  pcov, dcoef, wcoef, rps, rf = sel_values(arr)
  scene = BandedVegetation{plantCover = pcov,
	dryCoeff = dcoef,
	wetCoeff = wcoef,
	rainfallPlantSurvival = rps,
	rainfall = rf,
	distributeLaterally = true,
	distributeToSecondNeighbors = true,
	rainDecrease = true,
	finalTime = 20,
  }
  
  scene:run() 

  scene.map:save("BandedVegetation_mutant_" .. value .. i .. ".png") 

end


  
  