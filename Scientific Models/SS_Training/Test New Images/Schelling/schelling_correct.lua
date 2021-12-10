--[=====[ 
TTR:

Strength = 2
Total = 49

FindBestImages: 

Limit = 0.8

Simulation Time

100
--]=====] 

function get_tuple(t)
   local valf = {}
   if t == 1 then
     valf = {1, 1}
   elseif t == 2 then
     valf = {1, 2}
   elseif t == 3 then
     valf = {1, 3}
   elseif t == 4 then
     valf = {1, 4}
   elseif t == 5 then
     valf = {1, 5}
   elseif t == 6 then
     valf = {1, 6}
   elseif t == 7 then
     valf = {1, 7}
   elseif t == 8 then
     valf = {2, 1}
   elseif t == 9 then
     valf = {2, 2}
   elseif t == 10 then
     valf = {2, 3}
   elseif t == 11 then
     valf = {2, 4}
   elseif t == 12 then
     valf = {2, 5}
   elseif t == 13 then
     valf = {2, 6}
   elseif t == 14 then
     valf = {2, 7}
   elseif t == 15 then
     valf = {3, 1}
   elseif t == 16 then
     valf = {3, 2}
   elseif t == 17 then
     valf = {3, 3}
   elseif t == 18 then
     valf = {3, 4}
   elseif t == 19 then
     valf = {3, 5}
   elseif t == 20 then
     valf = {3, 6}
   elseif t == 21 then
     valf = {3, 7}
   elseif t == 22 then
     valf = {4, 1}
   elseif t == 23 then
     valf = {4, 2}
   elseif t == 24 then
     valf = {4, 3}
   elseif t == 25 then
     valf = {4, 4}
   elseif t == 26 then
     valf = {4, 5}
   elseif t == 27 then
     valf = {4, 6}
   elseif t == 28 then
     valf = {4, 7}
   elseif t == 29 then
     valf = {5, 1}
   elseif t == 30 then
     valf = {5, 2}
   elseif t == 31 then
     valf = {5, 3}
   elseif t == 32 then
     valf = {5, 4}
   elseif t == 33 then
     valf = {5, 5}
   elseif t == 34 then
     valf = {5, 6}
   elseif t == 35 then
     valf = {5, 7}
   elseif t == 36 then
     valf = {6, 1}
   elseif t == 37 then
     valf = {6, 2}
   elseif t == 38 then
     valf = {6, 3}
   elseif t == 39 then
     valf = {6, 4}
   elseif t == 40 then
     valf = {6, 5}
   elseif t == 41 then
     valf = {6, 6}
   elseif t == 42 then
     valf = {6, 7}
   elseif t == 43 then
     valf = {7, 1}
   elseif t == 44 then
     valf = {7, 2}
   elseif t == 45 then
     valf = {7, 3}
   elseif t == 46 then
     valf = {7, 4}
   elseif t == 47 then
     valf = {7, 5}
   elseif t == 48 then
     valf = {7, 6}
   elseif t == 49 then
     valf = {7, 7}
   end

   return valf
end


function sel_values(i)
   
   --local fsf = {0.25, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5}
   local fsf = {0.25, 0.1, 0.15, 0.25, 0.35, 0.45, 0.5}
   --local dmf = {25, 50, 75, 100, 200, 300, 400}
   --local prf = {3, 2, 4, 5, 6, 7, 8}
   local prf = {3, 5, 8, 10, 11, 15, 18}
    
   return fsf[i[1]], prf[i[2]]  
   --return fsf[i[1]], dmf[i[2]], prf[i[3]]
end




--- Schelling's segregation model. In 1971, the American economist Thomas Schelling created
-- an agent-based model that might help explain why segregation is so difficult to combat.
-- His model of segregation showed that even when individuals (or "agents") didn't mind being
-- surrounded or living by agents of a different race, they would still choose to segregate
-- themselves from other agents over time! Although the model is quite simple, it gives a
-- fascinating look at how individuals might self-segregate, even when they have no explicit
-- desire to do so. A small preference for one's neighbors to be of the same color could lead
-- to total segregation. In Schellinga model, initially black and white families are randomly
-- distributed. At each step in the modeling process the families examine their immediate
-- neighborhood and either stay put or move elsewhere depending on whether the local racial
-- composition suits their preferences. The procedure is repeated until everyone finds a
-- satisfactory home (or until the simulator’s patience is exhausted).
-- @arg data.dim The x and y dimensions of space. The default value is 25.
-- @arg data.freeSpace The percentage of space that is not filled with any agent
-- along the simulation. The default value is 25.
-- @arg data.preference What is the minimum number of neighbor agents be like me
-- that makes me satisfied with my current cell? The default value is 3.
-- @arg data.finalTime The final simulation time. The default value is 500.
-- @image schelling.bmp
Schelling = Model{
	finalTime  = Choice{min = 10,   default = 100}, -- 500
	freeSpace  = Choice{min = 0.05, max = 0.5, step = 0.05}, -- max = 0.2
	dim        = Choice{min =   25, max =  400, step =   25},
	preference = Choice{min =    2, max =    18, step =    1}, -- 8 to 18
	random = true,
	init = function (model)
		-- determine the percentage of each team
		model.range = (1.0 - model.freeSpace) / 2

		model.cell = Cell{
			-- cells have only a state that can be "free", "germany" or "brazil"
			state = function(cell)
				local agent = cell:getAgent()
				if agent then return agent.state else return "free" end
			end
		}

		model.cs = CellularSpace{
			xdim         = model.dim,
			instance     = model.cell
		}

		model.cs:createNeighborhood{wrap = true}

		-- define an agent whose state can be "free", "germany" or "brazil"
		model.agent = Agent{
			state = Random{"brazil", "germany"},
			-- function to test if the agent is unhappy with its neighbors
			isUnhappy = function(agent)
				local mycell = agent:getCell()
				local likeme = 0
				forEachNeighbor(mycell, function(neigh)
					local other = neigh:getAgent()
					if other and other.state == agent.state then
						likeme = likeme + 1
					end
				end)

				return likeme < model.preference -- how many are like me?
			end
		}

		-- a society of agents
		model.society = Society{
			instance = model.agent,
			quantity = math.floor(model.dim * model.dim * (1.0 - model.freeSpace)),

			-- step is the central function of the model
			-- 1. Select all unhappy agents
			-- 2. Select all empty cells
			-- 3. Choose a random unhappy agent and put it in an empty cell
			-- (repeat until final time)
			step = function()
				-- a group of unhappy agents
				model.unhappy_agents:filter()

				-- are there unhappy agents?
				if #model.unhappy_agents > 0 then
					-- get a random unhappy agent
					local myagent = model.unhappy_agents:sample()

					-- a trajectory of empty cells
					local empty_cells = Trajectory{
						target = model.cs,
						select = function(cell)
							return cell:state() == "free"
						end
					}

					-- get a random empty cell
					local newcell = empty_cells:sample()

					-- move the agent to the empty cell
					myagent:move (newcell)
				end
			end
		}

		-- an environment puts a society in a cell space
		model.env = Environment{model.cs, model.society}

		-- agents are place randomly
		model.env:createPlacement{}

		model.unhappy_agents = Group{
			target = model.society,
			select = function(agent)
				return agent:isUnhappy()
			end
		}

		-- a map to plot the cell space
		model.map = Map{
			target = model.cs,
			select = "state",
			color  = "RdYlGn",
			value  = {"germany", "free", "brazil"}
		}

		model.unhappy  = function()
			return 100 * #model.unhappy_agents / #model.society
		end

		-- a chart to plot the percentage of unhappy agents
		--model.chart = Chart{
		--	target = model,
			--select = "unhappy",
			--label  = "%-unhappy",
		--}

		-- timer
		-- 1. execute the society (put an unhappy agent in an empty cell)
		-- 2. execute the cell space (colors the cell space)
		-- 3. execute the map (refresh the map)
		-- 4. execute the chart (update the chart)
		model.timer = Timer{
			Event{action = function() model.society:step() end},
			Event{action = model.map    }
			--Event{action = model.chart  }
		}
	end
}

for i=1,49 do
 
  local value = "A"
  
  fsv, prv = 0.0, 0
  
  arr = {}
  arr = get_tuple(i)
  fsv, prv = sel_values(arr)
  
  
  scene = Schelling{
    finalTime  = 100,
	freeSpace  = fsv,
	dim        = 25,
	preference = prv,
	random = true
   
  }
  
  scene:run() 

  scene.map:save("Schelling_correct_" .. value .. i .. ".png") 
  
  
  		
end