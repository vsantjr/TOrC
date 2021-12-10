-- @example A simple drainage model. It uses a Chart to
-- show the output of the simulation.
-- @image drainage.png

-- model parameters

--[=====[ 
TTR:

Strength = 2
Total = 49

FindBestImages: 

Limit = 0.9

Simulation Time

50
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
   
   local v1f = {0, -1, -10, 10, 20, 50, 100}
   local v2f = {0, -5, -8, 15, 20, 50, 100}
   
     
     
   return v1f[i[1]], v2f[i[2]]
end

for i=1,49 do
 
 
   
  local value = "A"
  q1v, q2v = 0, 0
  
  arr = {}
  arr = get_tuple(i)
  q1v, q2v = sel_values(arr)


  c = Cell{
	Q1 = q1v, -- 0
	Q2 = q2v  -- 0
  }

  chart = Chart{
	target = c
  }

-- model execution
  t = Timer{
	Event{action = function()
		-- Input
		local E1 = 2
		-- Output
		local S1 = 0.4 * c.Q1
		-- Simulation
		c.Q1 = c.Q1 + (E1 - S1)

		-- Input
		local E2 = S1
		-- Output
		local S2 = 0.2 * c.Q2
		-- Simulation
		c.Q2 = c.Q2 + (E2 - S2)

		-- Report
		print(c.Q1.." "..c.Q2)
	end},
	Event{action = chart}
  }

  t:run(50) -- 100
  
  chart:save("Drainage_correct_" .. value .. i .. ".png") 
  
  
  		
end