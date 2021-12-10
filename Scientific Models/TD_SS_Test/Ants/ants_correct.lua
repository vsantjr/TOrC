--[=====[ 
TTR:

Strength = 2
Total = 49

FindBestImages: 

Limit = 0.95

Simulation Time

50
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
   
   local inff = {100, 10, 40, 70, 150, 300, 1000}
   local socf = {10, 25, 50, 100, 150, 200, 500}
   local rdif = {1, 2, 3, 5, 7, 9, 10}
   local revf = {0.2, 0.000001, 0.001, 0.1, 0.5, 0.75, 0.999999}
   
     
     
   return inff[i[1]], socf[i[2]], rdif[i[3]], revf[i[4]]
end




--- A colony of ants bringing food to their nest. Ant colonies are very interesting entities
-- because of their capacities to collectively achieve complex decisions based on simple
-- behavioural rules and the use of local information and indirect communication. This
-- behaviour is useful to researches from different fields, especially in Swarm Robotics and
-- computational intelligence.
-- Implemented by Bernardo Dornellas de Mendonca Martins dos Reis (more information available at
-- http://www.terralab.ufop.br/dokuwiki/doku.php?id=terralab:curso:envsoft:finalproject:ant1).
-- Original authors: Fesseha Belay & Javier Morata.
-- @arg data.dimension Space dimensions. A number with 50 as default value.
-- @arg data.finalTime Final simulation time. A number with 450 as default value.
-- @arg data.initialFood A number with 100 as default value.
-- @arg data.rateDiffusion A value in the set {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} with 1 as default value.
-- @arg data.rateEvaporation A number of at least 1e-06 and at most 0.999999 with 0.2 as default value.
-- @arg data.societySize A number of at least 10 and at most 500 with 10 as default value.
-- @image ants.bmp
Ants = Model{
	dimension = 50,
	finalTime = 50,
	initialFood = 100,
	societySize = Choice{min = 10, max = 500},
	rateDiffusion = Choice{1, 2, 3, 4, 5, 6, 7, 8, 9, 10},    -- 3,  4
	rateEvaporation = Choice{min = 0.000001, max = 0.999999, default = 0.2}, -- 0.5,  0.75
	init = function(model)
		local icell = Cell{
			cover = "empty",
			chemical = 0,
			execute = function(cell) -- chemical evaporation
				if cell.chemical > 0 then
					cell.chemical = cell.chemical - model.rateEvaporation
				end

				if cell.chemical <= 0 and (cell.cover == "chemical" or cell.cover == "lesschem") then
					cell.cover = "empty"
				elseif cell.chemical < 1 and cell.cover == "chemical" then
					cell.cover = "lesschem"
				end
			end,
			getNextCoordinateTowardDestiny = function(cell, destiny)
				-- Search next coordinate X to come bak to the nest
				local new_x
				local new_y

				if cell.x < destiny.x then
					new_x = cell.x + 1
				elseif cell.x > destiny.x then
					new_x = cell.x - 1
				else
					new_x = cell.x
				end

				-- Search next coordinate Y to come bak to the nest
				if cell.y < destiny.y then
					new_y = cell.y + 1
				elseif cell.y > destiny.y then
					new_y = cell.y - 1
				else
					new_y = cell.y
				end

				return {x = new_x, y = new_y}
			end
		}

		model.cs = CellularSpace{
			xdim = model.dimension,
			instance = icell,
			food = model.initialFood
		}

		model.cs:createNeighborhood{}

		local center = math.floor(model.dimension / 2)
		local nest_cell = model.cs:get(center, center)
		nest_cell.cover = "nest"
		forEachNeighbor(nest_cell, function(neigh)
			neigh.cover = "nest"
		end)

		-- Prepare the start cells for the ANTS
		local right = {x = nest_cell.x + 2, y = nest_cell.y}
		local left =  {x = nest_cell.x - 2, y = nest_cell.y}
		local up =    {x = nest_cell.x,     y = nest_cell.y - 2}
		local down =  {x = nest_cell.x,     y = nest_cell.y + 2}

		local nest_cell_right = model.cs:get(right.x, right.y)
		local nest_cell_left  = model.cs:get(left.x,  left.y)
		local nest_cell_up    = model.cs:get(up.x,    up.y)
		local nest_cell_down  = model.cs:get(down.x,  down.y)

		local function drawFood(x, y)
			local cell = model.cs:get(math.floor(x), math.floor(y))
			cell.cover = "food"
			forEachNeighbor(cell, function(neigh)
				neigh.cover = "food"
				forEachNeighbor(neigh, function(neigh2)
					neigh2.cover = "food"
				end)
			end)
		end

		drawFood(model.dimension / 8, model.dimension / 8)
		drawFood(model.dimension / 7, model.dimension * 3 / 4)
		drawFood(model.dimension * 3 / 4, model.dimension / 3)
		drawFood(model.dimension * 3 / 4, model.dimension * 4 / 5)

		local familyAnt = Agent{
			-- initialize the agent internal state
			init = function(self)
				self.state = "searching"
				self.dest = nil
			end,
			search_food = function(agent)
				if agent:findFood() then return end

				local cell = agent:getCell()
				local any_chem = false

				-- If "ant" find chemical or lesschemical go there
				forEachNeighbor(cell, function(neigh)
					if belong(neigh.cover, {"chemical", "lesschem"}) and not any_chem and neigh:isEmpty() then
						agent:move(neigh)
						any_chem = true
						return false
					end
				end)

				if any_chem == false then
					if agent.dest ~=nil then
						agent:goto_cell()
					else
						agent.dest = model.cs:sample()
						agent:goto_cell()
					end
				end
			end,
			bring_food = function(agent)
				if agent:findNest() then return end

				local cell = agent:getCell()
				local new_coord = cell:getNextCoordinateTowardDestiny(nest_cell)
				local new_cell = model.cs:get(new_coord.x, new_coord.y)
				if new_cell.cover ~= "food" and new_cell.cover ~= "nest" then
					agent:getCell().cover = "chemical"
					agent:getCell().chemical = agent:getCell().chemical + model.rateDiffusion

					forEachNeighbor(cell, function(neigh)
						if neigh.cover ~= "food" and neigh.cover ~= "nest" and neigh.cover ~= "chemical" then
							neigh.chemical = neigh.chemical + (model.rateDiffusion / 2)
							if neigh.chemical > 0 and neigh.chemical <= 1 then
								neigh.cover = "lesschem"
							elseif neigh.chemical > 1 then
								neigh.cover = "chemical"
							end
						end
					end)
				end

				agent:move(new_cell)
			end,
			execute = function(agent)
				if agent.state == "searching" then
					agent:search_food()
				elseif agent.state == "bringing" then
					agent:bring_food()
				end
			end,
			findFood = function(agent)
				local cell = agent:getCell()
				forEachNeighbor(cell, function(neigh)
					if neigh.cover ~= "food" then return end

					neigh.cover = "chemical"

					cell = agent:getCell()
					forEachNeighbor(cell, function(neigh2)
						if neigh2.cover ~= "food" and neigh2.cover ~= "nest" then
							neigh2.cover = "chemical"
							neigh2.chemical = neigh2.chemical + model.rateDiffusion
							forEachNeighbor(neigh2, function(neigh3)
								if neigh3.cover ~= "food" and neigh3.cover ~= "nest" then
									neigh3.cover = "lesschem"
									neigh3.chemical = neigh3.chemical + model.rateDiffusion / 2
								end
							end)
						end
					end)

					agent.state = "bringing"
					model.cs.food = model.cs.food - 1
					return true
				end)

				return false
			end,
			findNest = function(agent)
				local cell = agent:getCell()
				forEachNeighbor(cell, function(neigh)
					if neigh.cover == "nest" then
						agent.state = "searching"
						return true
					end
				end)

				return false
			end,
			goto_cell = function(agent)
				local dest = agent.dest
				local cell = agent:getCell()

				local new_coord = cell:getNextCoordinateTowardDestiny(dest)
				local new_cell = model.cs:get(new_coord.x, new_coord.y)

				if new_cell.cover ~= "food" and new_cell.cover ~= "nest" and new_cell:isEmpty() then
					agent:move(new_cell)
				else
					new_cell = agent:getCell():getNeighborhood():sample()
					if new_cell.cover ~= "food" and new_cell.cover ~= "nest" and new_cell:isEmpty() then
						agent:move(new_cell)
					end
				end

				if new_cell == dest then
					agent.dest = nil
				end
			end,
			random_start = function(agent)
				local random = math.random(1, 4)

				if random == 1 then
					agent:enter(nest_cell_right)
				elseif random == 2 then
					agent:enter(nest_cell_left)
				elseif random == 3 then
					agent:enter(nest_cell_up)
				elseif random == 4 then
					agent:enter(nest_cell_down)
				end
			end
		}

		model.soc = Society{
			instance = familyAnt,
			quantity = model.societySize
		}

		model.map = Map{
			target = model.cs,
			select = "cover",
			value = {"empty", "food", "nest", "chemical", "lesschem"},
			color = {"brown", "blue", "red", "green", "darkGreen"}
		}

		model.env = Environment{model.cs, model.soc}

		model.env:createPlacement{
			strategy = "void"
		}

		model.soc:random_start()

		
		model.map = Map{
			target = model.soc,
			symbol = "ant",
			color = "yellow",
			background = model.map,
			size = 10
		}

		model.chart = Chart{
			target = model.cs
		}

		model.timer = Timer{
			Event{action = model.soc},
			Event{action = model.cs},
			Event{action = model.map}
		}
	end
}

for i=1,49 do
 
 
  local value = "A"
  infv, socv, rdiv, revv = 0, 0, 0, 0.0
  
  arr = {}
  arr = get_tuple(i)
  infv, socv, rdiv, revv = sel_values(arr) 
     
  
  
  scene = Ants{
	dimension = 50,
	finalTime = 50,
	initialFood = infv,
	societySize = socv,
	rateDiffusion = rdiv,    
	rateEvaporation = revv 
   
  }
  
  scene:run() 

  scene.chart:save("Ants_correct_" .. value .. i .. ".png") 
  
  
  		
end