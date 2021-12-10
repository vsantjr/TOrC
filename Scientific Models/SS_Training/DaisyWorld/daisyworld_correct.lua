--[=====[ 
TTR:

Strength = 3
Total = 120

FindBestImages: 

Limit = 0.85

Simulation Time

50

--]=====] 

function get_tuple(t)
   local valf = {}
   if t == 1 then
     valf = {5, 1, 6, 1, 1, 1, 4}
   elseif t == 2 then
     valf = {3, 1, 2, 1, 2, 4, 5}
   elseif t == 3 then
     valf = {3, 1, 3, 1, 3, 5, 4}
   elseif t == 4 then
     valf = {4, 1, 6, 1, 4, 3, 1}
   elseif t == 5 then
     valf = {3, 1, 4, 1, 5, 2, 3}
   elseif t == 6 then
     valf = {1, 1, 3, 1, 6, 2, 1}
   elseif t == 7 then
     valf = {2, 1, 1, 1, 7, 1, 4}
   elseif t == 8 then
     valf = {2, 1, 3, 2, 1, 2, 1}
   elseif t == 9 then
     valf = {4, 1, 3, 2, 2, 3, 3}
   elseif t == 10 then
     valf = {1, 1, 1, 2, 3, 1, 5}
   elseif t == 11 then
     valf = {1, 1, 4, 2, 4, 5, 2}
   elseif t == 12 then
     valf = {2, 1, 5, 2, 5, 4, 3}
   elseif t == 13 then
     valf = {3, 1, 6, 2, 6, 2, 3}
   elseif t == 14 then
     valf = {3, 1, 2, 2, 7, 5, 4}
   elseif t == 15 then
     valf = {4, 1, 4, 3, 1, 1, 2}
   elseif t == 16 then
     valf = {2, 1, 1, 3, 2, 2, 5}
   elseif t == 17 then
     valf = {5, 1, 2, 3, 3, 5, 3}
   elseif t == 18 then
     valf = {1, 1, 3, 3, 4, 4, 5}
   elseif t == 19 then
     valf = {1, 1, 6, 3, 5, 5, 4}
   elseif t == 20 then
     valf = {3, 1, 5, 3, 6, 5, 1}
   elseif t == 21 then
     valf = {5, 1, 4, 3, 7, 2, 4}
   elseif t == 22 then
     valf = {3, 1, 1, 4, 1, 4, 3}
   elseif t == 23 then
     valf = {1, 1, 4, 4, 2, 3, 4}
   elseif t == 24 then
     valf = {1, 1, 5, 4, 3, 5, 5}
   elseif t == 25 then
     valf = {2, 1, 6, 4, 4, 2, 2}
   elseif t == 26 then
     valf = {5, 1, 1, 4, 5, 1, 1}
   elseif t == 27 then
     valf = {4, 1, 4, 4, 6, 2, 5}
   elseif t == 28 then
     valf = {4, 1, 3, 4, 7, 4, 1}
   elseif t == 29 then
     valf = {4, 1, 2, 5, 1, 4, 3}
   elseif t == 30 then
     valf = {5, 1, 3, 5, 2, 5, 2}
   elseif t == 31 then
     valf = {5, 1, 6, 5, 3, 4, 4}
   elseif t == 32 then
     valf = {4, 1, 5, 5, 4, 2, 4}
   elseif t == 33 then
     valf = {3, 1, 4, 5, 5, 4, 5}
   elseif t == 34 then
     valf = {5, 1, 1, 5, 6, 3, 3}
   elseif t == 35 then
     valf = {1, 1, 4, 5, 7, 4, 3}
   elseif t == 36 then
     valf = {2, 1, 5, 6, 1, 5, 5}
   elseif t == 37 then
     valf = {4, 1, 6, 6, 2, 2, 1}
   elseif t == 38 then
     valf = {4, 1, 3, 6, 3, 3, 5}
   elseif t == 39 then
     valf = {5, 1, 4, 6, 4, 3, 5}
   elseif t == 40 then
     valf = {1, 1, 1, 6, 5, 3, 4}
   elseif t == 41 then
     valf = {5, 1, 2, 6, 6, 1, 3}
   elseif t == 42 then
     valf = {3, 1, 5, 6, 7, 3, 2}
   elseif t == 43 then
     valf = {1, 1, 2, 7, 1, 3, 4}
   elseif t == 44 then
     valf = {5, 1, 5, 7, 2, 3, 2}
   elseif t == 45 then
     valf = {2, 1, 4, 7, 3, 2, 1}
   elseif t == 46 then
     valf = {3, 1, 3, 7, 4, 1, 3}
   elseif t == 47 then
     valf = {4, 1, 2, 7, 5, 2, 1}
   elseif t == 48 then
     valf = {2, 1, 1, 7, 6, 4, 2}
   elseif t == 49 then
     valf = {5, 1, 6, 7, 7, 5, 5}
   elseif t == 50 then
     valf = {1, 2, 5, 1, 1, 2, 2}
   elseif t == 51 then
     valf = {5, 2, 1, 1, 2, 5, 3}
   elseif t == 52 then
     valf = {2, 2, 6, 1, 3, 4, 5}
   elseif t == 53 then
     valf = {3, 2, 4, 1, 4, 4, 2}
   elseif t == 54 then
     valf = {5, 2, 3, 1, 5, 2, 4}
   elseif t == 55 then
     valf = {3, 2, 1, 1, 6, 2, 4}
   elseif t == 56 then
     valf = {5, 2, 2, 1, 7, 3, 1}
   elseif t == 57 then
     valf = {3, 2, 4, 2, 1, 1, 4}
   elseif t == 58 then
     valf = {1, 2, 1, 2, 2, 4, 3}
   elseif t == 59 then
     valf = {5, 2, 3, 2, 3, 4, 5}
   elseif t == 60 then
     valf = {2, 2, 5, 2, 4, 1, 2}
   elseif t == 61 then
     valf = {1, 2, 6, 2, 5, 1, 1}
   elseif t == 62 then
     valf = {2, 2, 2, 2, 6, 3, 5}
   elseif t == 63 then
     valf = {4, 2, 4, 2, 7, 1, 5}
   elseif t == 64 then
     valf = {2, 2, 3, 3, 1, 3, 4}
   elseif t == 65 then
     valf = {1, 2, 2, 3, 2, 1, 1}
   elseif t == 66 then
     valf = {4, 2, 3, 3, 3, 2, 1}
   elseif t == 67 then
     valf = {5, 2, 6, 3, 4, 5, 1}
   elseif t == 68 then
     valf = {5, 2, 5, 3, 5, 4, 5}
   elseif t == 69 then
     valf = {5, 2, 4, 3, 6, 1, 3}
   elseif t == 70 then
     valf = {1, 2, 1, 3, 7, 5, 2}
   elseif t == 71 then
     valf = {2, 2, 2, 4, 1, 5, 1}
   elseif t == 72 then
     valf = {2, 2, 5, 4, 2, 1, 3}
   elseif t == 73 then
     valf = {4, 2, 6, 4, 3, 3, 4}
   elseif t == 74 then
     valf = {3, 2, 3, 4, 4, 5, 5}
   elseif t == 75 then
     valf = {4, 2, 1, 4, 5, 4, 2}
   elseif t == 76 then
     valf = {1, 2, 3, 4, 6, 3, 3}
   elseif t == 77 then
     valf = {5, 2, 4, 4, 7, 2, 3}
   elseif t == 78 then
     valf = {1, 2, 1, 5, 1, 1, 5}
   elseif t == 79 then
     valf = {4, 2, 6, 5, 2, 1, 2}
   elseif t == 80 then
     valf = {3, 2, 5, 5, 3, 3, 3}
   elseif t == 81 then
     valf = {2, 2, 2, 5, 4, 2, 3}
   elseif t == 82 then
     valf = {5, 2, 2, 5, 5, 5, 4}
   elseif t == 83 then
     valf = {4, 2, 4, 5, 6, 4, 1}
   elseif t == 84 then
     valf = {3, 2, 3, 5, 7, 4, 4}
   elseif t == 85 then
     valf = {5, 2, 2, 6, 1, 4, 2}
   elseif t == 86 then
     valf = {3, 2, 3, 6, 2, 2, 5}
   elseif t == 87 then
     valf = {1, 2, 4, 6, 3, 4, 2}
   elseif t == 88 then
     valf = {4, 2, 1, 6, 4, 3, 1}
   elseif t == 89 then
     valf = {3, 2, 2, 6, 5, 1, 3}
   elseif t == 90 then
     valf = {4, 2, 5, 6, 6, 5, 2}
   elseif t == 91 then
     valf = {2, 2, 6, 6, 7, 5, 3}
   elseif t == 92 then
     valf = {4, 2, 4, 7, 1, 2, 5}
   elseif t == 93 then
     valf = {2, 2, 4, 7, 2, 5, 5}
   elseif t == 94 then
     valf = {2, 2, 3, 7, 3, 5, 4}
   elseif t == 95 then
     valf = {5, 2, 2, 7, 4, 1, 2}
   elseif t == 96 then
     valf = {2, 2, 1, 7, 5, 1, 3}
   elseif t == 97 then
     valf = {3, 2, 6, 7, 6, 3, 1}
   elseif t == 98 then
     valf = {1, 2, 5, 7, 7, 4, 4}
   elseif t == 99 then
     valf = {5, 3, 6, 1, 1, 5, 3}
   elseif t == 100 then
     valf = {2, 3, 6, 1, 2, 3, 2}
   elseif t == 101 then
     valf = {1, 3, 4, 1, 3, 1, 4}
   elseif t == 102 then
     valf = {2, 3, 3, 1, 4, 2, 1}
   elseif t == 103 then
     valf = {4, 3, 1, 1, 5, 1, 3}
   elseif t == 104 then
     valf = {4, 3, 2, 1, 6, 4, 1}
   elseif t == 105 then
     valf = {3, 3, 5, 1, 7, 2, 5}
   elseif t == 106 then
     valf = {1, 3, 4, 2, 1, 4, 1}
   elseif t == 107 then
     valf = {5, 3, 5, 2, 2, 1, 1}
   elseif t == 108 then
     valf = {2, 3, 5, 2, 3, 5, 4}
   elseif t == 109 then
     valf = {5, 3, 6, 2, 4, 3, 3}
   elseif t == 110 then
     valf = {4, 3, 2, 2, 5, 5, 5}
   elseif t == 111 then
     valf = {4, 3, 3, 2, 6, 4, 2}
   elseif t == 112 then
     valf = {2, 3, 1, 2, 7, 3, 1}
   elseif t == 113 then
     valf = {1, 3, 3, 3, 1, 2, 3}
   elseif t == 114 then
     valf = {4, 3, 1, 3, 2, 5, 4}
   elseif t == 115 then
     valf = {3, 3, 6, 3, 3, 1, 2}
   elseif t == 116 then
     valf = {3, 3, 5, 3, 4, 1, 4}
   elseif t == 117 then
     valf = {5, 3, 4, 3, 5, 3, 1}
   elseif t == 118 then
     valf = {3, 3, 1, 3, 6, 3, 5}
   elseif t == 119 then
     valf = {2, 3, 2, 3, 7, 4, 3}
   elseif t == 120 then
     valf = {4, 3, 1, 4, 1, 2, 4}
   end

   return valf
end



function sel_values(i)
   
   lsp = {5, 1, 3, 10, 15}
   tmin = {0, 2, 4, 6, 8, 10}
   tmax = {100, 90, 92, 94, 96, 98}
   awhite = {0.2, 0.0, 0.1, 0.25, 0.3, 0.4, 0.5}
   ablack = {0.7, 0.5, 0.6, 0.75, 0.8, 0.9, 1}
   pempty = {0.7, 0.4, 0.45, 0.5, 0.6}
   pwhite = {0.18, 0.1, 0.15, 0.2, 0.3}
   
  
     
   return lsp[i[1]], tmin[i[2]], tmax[i[3]], awhite[i[4]], ablack[i[5]], pempty[i[6]], pwhite[i[7]]
end


--- Implementation of a 2D Daisy World model.
-- We have three type of cells: White daisies, Black daisies and soil, with a given albedo for each of them.
-- The cells are placed randomly in the cellular space depending on the given percentage of soil and white daisies, in the remaining there are placed black daisies. Each of them is given with a random initial age, to control the population of daisies, because when they are old (given age) they die.
-- Each cell is also given a random initial value for soil heat between the range of possible values of temperature.
-- Each time step for CA, the temperature will be calculated as follows: Each cell temperature will be calculated according to the daisy albedo and the previous temperature, also the mean neighbours temperature is calculated and this value is used to calculate the mean between the temperature from the cell itself and the mean of the neighbours.
-- If there is an empty cell with a daisy as neighbour, and the conditions for reproduction are fulfilled, a new daisy will be born in the empty cell.
-- The conditions for reproduction are that the daisy's ground has to be inside the range of temperatures, and if it is in the given perfect temperature to reproduce it will have 100 % of chances to reproduce, and less chances the further it is from the perfect temperature. The new born daisy will be the same type as the maximum neighbourhood type (black or white).
-- The daisies will die on a certain (given) age.
-- The first version of this implementation was developed by Nourhan, Shahin and Aida, as final work for Environmental Modeling course in
-- Erasmus Mundus program, Munster University, 2014. It still needs further development.
-- @arg data.proportion A table with two indexes, empty and white, describing the initial proportions of empty and white cells.
-- @arg data.reproduceTemperature A table with temperatures related to reproduction.
-- @arg data.temperature A table with the temperatures: max for maximum temperature, min for minimum temperature, reproduceMin for the minimum
-- temperature that makes the daisies reproductible, reproducePerfect for the temperature daisies will reproduce with a probability of 100%,
-- and reproduceMax for the maximum temperature where daisies can reproduce.
-- @arg data.finalTime The final simulation time.
-- @arg data.lifeSpan How long does a daisy live?
-- @arg data.dim The x and y dimensions of space.
-- @arg data.albedo A table with white and black albedos.
-- @image daisy.bmp
 

DaisyWorld = Model{
   
	dim = 50,
	finalTime = 50,
	lifeSpan = 5,
	temperature = {
		min = 0,
		max = 100
	},
	albedo = {
		white = 0.2,
		black = 0.7
	},
	reproduceTemperature = {
		max = 70,
		min = 40,
		perfect = 50
	},
	proportion = {
		empty = 0.7,
		white = 0.6 * 0.3
	},
	random = true,
	interface = function()
		return {
			{"number", "proportion", "albedo"},
			{"temperature", "reproduceTemperature"},
		}
	end,
	init = function(self)
		local function calculateProbRepro(soilHeat)
			local diff = math.abs(self.reproduceTemperature.perfect - soilHeat)
			return 100 - diff
		end

		self.rand = Random{seed = 1}

		self.proportion.black = 1 - self.proportion.empty - self.proportion.white

		self.cell = Cell{
			soilHeat = 50,
			lifeSpan = Random{min = 0, max = 4, step = 1},
			daisy = Random(self.proportion),
			die = function(cell)
				cell.lifeSpan = 0
				cell.daisy = "empty"
			end,
			born = function(cell)
				local blackDaisyCounter = 0
				local whiteDaisyCounter = 0

				forEachNeighbor(cell, function(neigh)
					if neigh.past.daisy == "black" then
						blackDaisyCounter = blackDaisyCounter + 1
					elseif neigh.past.daisy == "white" then
						whiteDaisyCounter = whiteDaisyCounter + 1
					end
				end)

				cell.lifeSpan = 0

				if whiteDaisyCounter > blackDaisyCounter then
					cell.daisy = "white"
				elseif whiteDaisyCounter < blackDaisyCounter then
					cell.daisy = "black"
				elseif whiteDaisyCounter > 0 then  -- equal
					if self.rand:number(0, 1) < 0.5 then
						cell.daisy = "white"
					else
						cell.daisy = "black"
					end
				end
			end,
			calculateSoilHeat = function(cell)
				local selfHeat

				if cell.past.daisy == "white" then  --increment or decrement temperature depending on the daisy
					selfHeat = cell.past.soilHeat - cell.past.soilHeat * self.albedo.white
				elseif cell.past.daisy == "black"  then
					selfHeat = cell.past.soilHeat + cell.past.soilHeat * self.albedo.black
				else
					selfHeat = cell.past.soilHeat
				end

				local neigbourHeat = 0 --change temperature to make it similar to the neigbours
				local neighbourCount = 0

				forEachNeighbor(cell, function(neigh)
					neighbourCount = neighbourCount + 1
					neigbourHeat = neigbourHeat + neigh.past.soilHeat
				end)

				neigbourHeat = neigbourHeat / neighbourCount -- calculate the mean of the neighbours
				local heat = (selfHeat + neigbourHeat) / 2

				heat = math.min(heat, self.temperature.max) --make heat value inside the valid range
				heat = math.max(heat, self.temperature.min)

				return heat
			end,
			execute = function(cell)
				if cell.past.daisy ~= "empty" then
					cell.lifeSpan = cell.lifeSpan + 1
				end

				if cell.past.lifeSpan >= self.lifeSpan then
					 cell:die()
				end

				cell.soilHeat = cell:calculateSoilHeat()

				if cell.past.daisy == "empty" and cell.past.soilHeat > self.reproduceTemperature.min and cell.past.soilHeat< self.reproduceTemperature.max then
					local probabilityReproduce = calculateProbRepro(cell.past.soilHeat)
					if self.rand:number() * 100 < probabilityReproduce then
						cell:born()
					end
				end
			end
		}

		self.cs = CellularSpace{
			xdim = self.dim,
			instance = self.cell,
			blackDaisy = function(cs) return #cs:split("daisy").black end,
			whiteDaisy = function(cs) return #cs:split("daisy").white end,
			emptySpace = function(cs) return #cs:split("daisy").empty end
		}

		self.cs:createNeighborhood{
			strategy = "vonneumann",
			wrap = true
		}

		--self.map1 = Map{
		--	target = self.cs,
		--	select = "soilHeat",
		--	slices = 6,
		--	max = self.temperature.max,
		--	min = self.temperature.min,
		--	color = {"yellow", "red"}
		--}

		self.map2 = Map{
			target = self.cs,
			select = "daisy",
			value = {"black", "white", "empty"},
			color = {"black", "white", "green"}
		}

		--self.chart = Chart{
		--	target = self.cs,
		--	select = {"blackDaisy", "whiteDaisy", "emptySpace"},
		--	title ="Population x Time",
		--	yLabel = "#individual"
		--}

		self.timer = Timer{
			Event{action = self.cs},
			--Event{action = self.chart},
			--Event{action = self.map1},
			Event{action = self.map2}
		}
	end
}






for i=1,120 do
  
  local value = "A"
 
  ls, mi, ma = 0, 0, 0
  aw, ab, pe, pw = 0.0, 0.0, 0.0, 0.0
  arr = {}
  arr = get_tuple(i)
  ls, mi, ma, aw, ab, pe, pw = sel_values(arr)
  scene = DaisyWorld{
    dim = 50,
    finalTime = 50,
	lifeSpan = ls,
	temperature = {
		min = mi,
		max = ma
	},
	albedo = {
		white = aw,
		black = ab
	},
	reproduceTemperature = {
		max = 70,
		min = 40,
		perfect = 50
	},
	proportion = {
		empty = pe,
		white = pw
	}}
  
  
  scene:run() 


  scene.map2:save("DaisyWorld_correct_" .. value .. i .. ".png")  
  
end