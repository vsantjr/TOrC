--[=====[ 

MUTANT D

TTR:

Strength = 2
Total = 49

FindBestImages: 

Limit = 0.85

Simulation Time

20
--]=====] 

function get_tuple(t)
   local valf = {}
   if t == 1 then
     valf = {1, 1, 6, 3}
   elseif t == 2 then
     valf = {1, 2, 5, 2}
   elseif t == 3 then
     valf = {1, 3, 4, 1}
   elseif t == 4 then
     valf = {1, 4, 3, 7}
   elseif t == 5 then
     valf = {1, 5, 2, 6}
   elseif t == 6 then
     valf = {1, 6, 1, 5}
   elseif t == 7 then
     valf = {1, 7, 7, 4}
   elseif t == 8 then
     valf = {2, 1, 5, 3}
   elseif t == 9 then
     valf = {2, 2, 4, 2}
   elseif t == 10 then
     valf = {2, 3, 3, 1}
   elseif t == 11 then
     valf = {2, 4, 2, 7}
   elseif t == 12 then
     valf = {2, 5, 1, 6}
   elseif t == 13 then
     valf = {2, 6, 7, 5}
   elseif t == 14 then
     valf = {2, 7, 6, 4}
   elseif t == 15 then
     valf = {3, 1, 4, 7}
   elseif t == 16 then
     valf = {3, 2, 3, 6}
   elseif t == 17 then
     valf = {3, 3, 2, 5}
   elseif t == 18 then
     valf = {3, 4, 1, 4}
   elseif t == 19 then
     valf = {3, 5, 7, 3}
   elseif t == 20 then
     valf = {3, 6, 6, 2}
   elseif t == 21 then
     valf = {3, 7, 5, 1}
   elseif t == 22 then
     valf = {4, 1, 3, 5}
   elseif t == 23 then
     valf = {4, 2, 2, 4}
   elseif t == 24 then
     valf = {4, 3, 1, 3}
   elseif t == 25 then
     valf = {4, 4, 7, 2}
   elseif t == 26 then
     valf = {4, 5, 6, 1}
   elseif t == 27 then
     valf = {4, 6, 5, 7}
   elseif t == 28 then
     valf = {4, 7, 4, 6}
   elseif t == 29 then
     valf = {5, 1, 2, 1}
   elseif t == 30 then
     valf = {5, 2, 1, 7}
   elseif t == 31 then
     valf = {5, 3, 7, 6}
   elseif t == 32 then
     valf = {5, 4, 6, 5}
   elseif t == 33 then
     valf = {5, 5, 5, 4}
   elseif t == 34 then
     valf = {5, 6, 4, 3}
   elseif t == 35 then
     valf = {5, 7, 3, 2}
   elseif t == 36 then
     valf = {6, 1, 1, 2}
   elseif t == 37 then
     valf = {6, 2, 7, 1}
   elseif t == 38 then
     valf = {6, 3, 6, 7}
   elseif t == 39 then
     valf = {6, 4, 5, 6}
   elseif t == 40 then
     valf = {6, 5, 4, 5}
   elseif t == 41 then
     valf = {6, 6, 3, 4}
   elseif t == 42 then
     valf = {6, 7, 2, 3}
   elseif t == 43 then
     valf = {7, 1, 7, 7}
   elseif t == 44 then
     valf = {7, 2, 6, 6}
   elseif t == 45 then
     valf = {7, 3, 5, 5}
   elseif t == 46 then
     valf = {7, 4, 4, 4}
   elseif t == 47 then
     valf = {7, 5, 3, 3}
   elseif t == 48 then
     valf = {7, 6, 2, 2}
   elseif t == 49 then
     valf = {7, 7, 1, 1}
   end

   return valf
end

function sel_values(i)
   
   --local evf = {0.04, 0.005, 0.01, 0.1, 0.3, 0.5, 0.75}
   --local icf = {10, 0, 5, 25, 45, 60, 100}
   --local duf = {0.9, 0.1, 0.3, 0.5, 0.7, 0.8, 0.95}
   --local raf = {0.5, 0.01, 0.1, 0.3, 0.7, 0.9, 0.95}
   
   local evf = {0.04, 0.005, 0.01, 0.05, 0.15, 0.20, 0.25}
   local icf = {10, 0, 5, 10, 15, 20, 25}
   local duf = {0.9, 0.1, 0.3, 0.5, 0.7, 0.8, 0.95}
   local raf = {0.5, 0.01, 0.1, 0.3, 0.4, 0.5, 0.6}
   
     
     
   return evf[i[1]], icf[i[2]], duf[i[3]], raf[i[4]]
end

local function setUnhappiness(self)
	self.unhappiness = math.abs(self.idealTemp - self:getCell().temp)
end

-- diffuse defined amount to neighbours
local function diffuse(self)
	local cell = self:getCell()
	local amount = (cell.temp * self.diffusionRate) / 8
	forEachNeighbor(cell, function(n)
		n.temp = n.temp + amount
	end)
end

-- choose best neighbour according to unhappiness, move there
local function step(self)
	self:setUnhappiness()
	-- Mutation 1: ROR2
	-- if self.unhappiness > 0 then
	if self.unhappiness <= 0 then
		local bestCell
		-- do step only if probability is reached
		if Random():number(0, 1) < self.randomMoveChance then
			bestCell = self:decideBestCell() -- decide which cell is the best
		else
			bestCell = self:getCell():getNeighborhood():sample()
		end

		if bestCell then
			self:move(bestCell)
		end
	end
end

-- decide which cell is best for me according to my unhappiness type (cold/hot)
-- choose the cell with maximum property (hottest/coldest)
local function decideBestCell(self)
	local currCell = self:getCell()
	local diff
	local bestCell = {currCell}

    
    -- if currCell.temp < self.idealTemp then ...
	if currCell.temp < self.idealTemp then -- if i am cold
		-- choose max temp
		diff = currCell.temp
		forEachNeighbor(currCell, function(n)
		    -- Mutation 2: ROR1
		    -- if n.temp > diff and n:isEmpty() then 
		    
			if n.temp < diff and n:isEmpty() then
				diff = n.temp
				bestCell = {n}
			elseif n.temp == diff and n:isEmpty() then
				table.insert(bestCell, n)
			end
		end)
	else -- if i am hot
		-- choose minimum temp
		diff = currCell.temp

		forEachNeighbor(currCell, function(n)
			if n.temp < diff and n:isEmpty() then
				diff = n.temp
				bestCell = {n}
			elseif n.temp == diff and n:isEmpty() then
				table.insert(bestCell, n)
			end
		end)
	end

	return Random(bestCell):sample()
end

-- increase a temp of current cell
local function heatCell(self)
	self:getCell().temp = self:getCell().temp + self.outputHeat -- heat up my cell
end

--- Heatbugs is an agent-based model inspired by the behavior of biological agents that seek
-- to regulate the temperature of their surrounding environment around an optimum level.
-- This model demonstrates how agents can organize themselves within a population. The agents
-- can detect and alter the environmental conditions in their neighborhood, though they can
-- only interact with other agents indirectly.
-- Although this model does not match the behavior of any specific organism, it can be used to
-- show how emergent behavior can arise as a result of different rules that govern the behavior
-- of agents.
-- The bugs (agents) exist in an environment composed of a grid of square patches. Each bug can
-- move to another, more suitable patch, as long as it is not occupied by another bug.
-- Each bug has an ideal temperature, though it is not the same for every bug. The bugs emit a
-- certain amount of heat into the environment at each time step. This heat slowly disperses
-- throughout the environment, though some is lost to cooling.
-- The larger the discrepancy between the bug's patch temperature and its ideal temperature,
-- the more unhappy it is. If the bug is not happy in its patch, it will move to an adjacent
-- empty patch that most closely resembles its ideal temperature. A patch that is too warm will
-- cause the bug to move to the coolest adjacent empty patch. In the same way, a patch that is
-- too cold will cause the bug to move to the warmest adjacent empty patch.
-- However, as the bugs only search their immediate neighborhood, it cannot be guaranteed that
-- the bugs will always move to the most suitable patch available.
-- The first version of this implementation was developed by Ondrej and Linda, as final work
-- for Environmental Modeling course in
-- Erasmus Mundus program, Munster University, 2014. It still needs further development.
-- @arg data.finalTime The final simulation time.
-- @arg data.dim The x and y dimensions of space.
-- @arg data.initialCellTemperature Initial temperature of each cell. Default is 10.
-- @arg data.evaporationRate The speed of heat loss of each cell. This occurs in every
-- iteration, for every cell. Default is 0.04.
-- @arg data.idealTemperature Upper and lower edges of ideal temperature. Default ranges from
-- 45 to 60.
-- @arg data.outputHeat Upper and lower edges of amount of heat emitted by agent in each
-- iteration to its neighbors.  Default ranges from 10 to 20.
-- @arg data.diffusionRate The rate of amount emitted by agent in each iteration. Default
-- value is 0.9.
-- @arg data.randomMoveChance Probability to move randomly, instead of choosing
-- coolest/hottest neighbor. Default is 0.5.
-- with the number of Agents along the simulation should be drawn.
-- @arg data.quantity The initial number of Agents in the model.
-- @arg data.temperature Sets minimum and maximum extend of legend. Default ranges from 0 to 150.
-- @image Heatbugs-map-1-end.bmp
Heatbugs = Model{
	quantity = 150, --50
	dim = 100,
	finalTime = 20, -- 100
	evaporationRate = 0.04,
	initialCellTemperature = 10,
	temperature = {
		max = 150,
		min = 0
	},
	idealTemperature = {
		min = 45,
		max = 60
	},
	outputHeat = {
		min = 10,
		max = 20
	},
	diffusionRate = 0.9,
	randomMoveChance = 0.5,
	interface = function()
		return {
			{"number"},
			{"idealTemperature", "outputHeat"},
			{"temperature"}
		}
	end,
	random = true,
	init = function(model)
		local cell = Cell{
			evaporationRate = model.evaporationRate,
			maxTemp = model.temperature.max,
			init = function(cell)
				cell.temp = model.initialCellTemperature
				cell.color = 0
			end,
			state = function(cell)
				if #cell:getAgents() == 0 then
					return "empty"
				else
					return "full"
				end
			end,
			execute = function(cell)
				cell.temp = cell.temp * (1 - cell.evaporationRate)
				cell.color = (cell.temp > cell.maxTemp) and cell.maxTemp or cell.temp
			end
		}

		model.cs = CellularSpace{
			xdim = model.dim,
			instance = cell,
			unhappiness = function(self)
				local sum = 0
				forEachCell(self, function(mcell)
					if not mcell.placement or not mcell.placement.agents[1] then return end
					local ag = mcell:getAgent()

					sum = sum + ag.unhappiness
				end)
				return sum
			end,
			currentCellTemperature = function(self)
				local sum = 0
				forEachCell(self, function(mcell)
					if not mcell.placement or not mcell.placement.agents[1] then return end

					sum = sum + mcell.temp
				end)
				return sum
			end,
		}

        
        
		model.cs:createNeighborhood{}

		--model.chartUnhappy = Chart{
		--	target = model.cs,
		--	select = {"unhappiness", "currentCellTemperature"}
		--}

		model.heatmap = Map{
			target = model.cs,
			select = "color",
			slices = 9,
			min = model.temperature.min,
			max = model.temperature.max,
			color = {"black", "red"}
		}

		local agent = Agent{
			diffuse = diffuse,
			step = step,
			heatCell = heatCell,
			setUnhappiness = setUnhappiness,
			decideBestCell = decideBestCell,
			minIdealTemp = model.idealTemperature.min,
			maxIdealTemp = model.idealTemperature.max,
			minOutputHeat = model.outputHeat.min,
			maxOutputHeat = model.outputHeat.max,
			diffusionRate = model.diffusionRate,
			randomMoveChance = model.randomMoveChance,
			unhappiness = 1,
			init = function(agent)
				agent.idealTemp = agent.minIdealTemp + Random():number(agent.maxIdealTemp - agent.minIdealTemp)
				agent.outputHeat = agent.minOutputHeat + Random():number(agent.maxOutputHeat - agent.minOutputHeat)
			end,
			execute = function(self)
				self:diffuse()
				self:step()
				self:heatCell()
			end
		}

		model.soc = Society{
			quantity = model.quantity,
			instance = agent
		}

		model.env = Environment{model.cs, model.soc}

		model.env:createPlacement()

		--model.map = Map{
		--	target = model.cs,
		--	select = "state",
		--	value = {"empty", "full"},
		--	color = {"lightGray", "red"}
		--}

		model.timer = Timer{
			Event{action = model.soc},
			Event{action = model.cs},
			Event{action = model.heatmap},
			--Event{action = model.chartUnhappy}
		}
	end
}

for i=1,49 do
 
 
    
  local value = "D"
  erv, icv, dfv, rmv = 0.0, 0, 0.0, 0.0
  
  arr = {}
  arr = get_tuple(i)
  erv, icv, dfv, rmv = sel_values(arr)
   
  
  
  scene = Heatbugs{
    quantity = 150,
	dim = 100,
	finalTime = 20,
	evaporationRate = erv,
	initialCellTemperature = icv,
	diffusionRate = dfv,
	randomMoveChance = rmv
   
  }
  
  scene:run() 

  scene.heatmap:save("Heatbugs_mutant_" .. value .. i .. ".png") 
  
  
  		
end