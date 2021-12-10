--- Snow falling from the sky.
-- @arg data.dim The x and y dimensions of space.
-- @arg data.finalTime A number with the final time of the simulation.
-- @arg data.probability The probability of a cell on the top of space
-- to change its state to snow.
-- @image snow.bmp

--[=====[ 
TTR:

Strength = 2
Total = 49

FindBestImages: 

Limit = 0.85

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
   
   local v1f = {50, 10, 20, 40, 60, 80, 100}
   local v2f = {0.02, 0.01, 0.005, 0.1, 0.3, 0.5, 0.7}
   
     
     
   return v1f[i[1]], v2f[i[2]]
end


Snow = Model{
	finalTime = 100,
	dim = 50,
	probability = 0.02,
	random = true,
	init = function(model)
		model.cell = Cell{
			init = function(cell)
				cell.state = "empty"
			end,
			execute = function(cell, ev)
				if cell.y == 0 then
					if cell.past.state == "empty" and ev:getTime() < model.finalTime - model.dim and Random():number() < model.probability then
						cell.state = "snow"
					else
						cell.state = "empty"
					end
				elseif cell.past.state == "snow" and cell.y < model.dim - 1 and cell.parent:get(cell.x, cell.y + 1).past.state == "empty" then
					cell.state = "empty"
				elseif cell.parent:get(cell.x, cell.y - 1).past.state == "snow" then
					cell.state = "snow"
				end
			end
		}

		model.cs = CellularSpace{
			xdim = model.dim,
			instance = model.cell,
		}

		model.cs:createNeighborhood{strategy = "vonneumann"}

		model.map = Map{
			target = model.cs,
			select = "state",
			value = {"snow", "empty"},
			color = {"white", "black"}
		}

		model.timer = Timer{
			Event{action = model.cs},
			Event{action = model.map}
		}
	end
}

for i=1,49 do
 
    
  -- A
  local value = "A"
  
  dv,  pv = 0, 0.0
  
  arr = {}
  arr = get_tuple(i)
  dv, pv = sel_values(arr)
  
  
  
  scene = Snow{
    finalTime = 100,
	dim = dv,
	probability = pv,
	random = true
   
  }
  
  scene:run() 

  scene.map:save("Snow_correct_" .. value .. i .. ".png") 
  
  
  		
end
