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
     valf = {1, 1, 1, 4}
   elseif t == 2 then
     valf = {1, 1, 2, 3}
   elseif t == 3 then
     valf = {1, 1, 3, 2}
   elseif t == 4 then
     valf = {1, 1, 4, 1}
   elseif t == 5 then
     valf = {1, 1, 5, 5}
   elseif t == 6 then
     valf = {1, 1, 6, 4}
   elseif t == 7 then
     valf = {1, 2, 1, 3}
   elseif t == 8 then
     valf = {1, 2, 2, 2}
   elseif t == 9 then
     valf = {1, 2, 3, 1}
   elseif t == 10 then
     valf = {1, 2, 4, 5}
   elseif t == 11 then
     valf = {1, 2, 5, 4}
   elseif t == 12 then
     valf = {1, 2, 6, 3}
   elseif t == 13 then
     valf = {1, 3, 1, 2}
   elseif t == 14 then
     valf = {1, 3, 2, 1}
   elseif t == 15 then
     valf = {1, 3, 3, 5}
   elseif t == 16 then
     valf = {1, 3, 4, 4}
   elseif t == 17 then
     valf = {1, 3, 5, 3}
   elseif t == 18 then
     valf = {1, 3, 6, 2}
   elseif t == 19 then
     valf = {1, 4, 1, 1}
   elseif t == 20 then
     valf = {1, 4, 2, 5}
   elseif t == 21 then
     valf = {1, 4, 3, 4}
   elseif t == 22 then
     valf = {1, 4, 4, 3}
   elseif t == 23 then
     valf = {1, 4, 5, 2}
   elseif t == 24 then
     valf = {1, 4, 6, 1}
   elseif t == 25 then
     valf = {1, 5, 1, 5}
   elseif t == 26 then
     valf = {1, 5, 2, 4}
   elseif t == 27 then
     valf = {1, 5, 3, 3}
   elseif t == 28 then
     valf = {1, 5, 4, 2}
   elseif t == 29 then
     valf = {1, 5, 5, 1}
   elseif t == 30 then
     valf = {1, 5, 6, 5}
   elseif t == 31 then
     valf = {2, 1, 1, 3}
   elseif t == 32 then
     valf = {2, 1, 2, 2}
   elseif t == 33 then
     valf = {2, 1, 3, 1}
   elseif t == 34 then
     valf = {2, 1, 4, 5}
   elseif t == 35 then
     valf = {2, 1, 5, 4}
   elseif t == 36 then
     valf = {2, 1, 6, 3}
   elseif t == 37 then
     valf = {2, 2, 1, 2}
   elseif t == 38 then
     valf = {2, 2, 2, 1}
   elseif t == 39 then
     valf = {2, 2, 3, 5}
   elseif t == 40 then
     valf = {2, 2, 4, 4}
   elseif t == 41 then
     valf = {2, 2, 5, 3}
   elseif t == 42 then
     valf = {2, 2, 6, 2}
   elseif t == 43 then
     valf = {2, 3, 1, 1}
   elseif t == 44 then
     valf = {2, 3, 2, 5}
   elseif t == 45 then
     valf = {2, 3, 3, 4}
   elseif t == 46 then
     valf = {2, 3, 4, 3}
   elseif t == 47 then
     valf = {2, 3, 5, 2}
   elseif t == 48 then
     valf = {2, 3, 6, 1}
   elseif t == 49 then
     valf = {2, 4, 1, 5}
   elseif t == 50 then
     valf = {2, 4, 2, 4}
   elseif t == 51 then
     valf = {2, 4, 3, 3}
   elseif t == 52 then
     valf = {2, 4, 4, 2}
   elseif t == 53 then
     valf = {2, 4, 5, 1}
   elseif t == 54 then
     valf = {2, 4, 6, 5}
   elseif t == 55 then
     valf = {2, 5, 1, 4}
   elseif t == 56 then
     valf = {2, 5, 2, 3}
   elseif t == 57 then
     valf = {2, 5, 3, 2}
   elseif t == 58 then
     valf = {2, 5, 4, 1}
   elseif t == 59 then
     valf = {2, 5, 5, 5}
   elseif t == 60 then
     valf = {2, 5, 6, 4}
   elseif t == 61 then
     valf = {3, 1, 1, 2}
   elseif t == 62 then
     valf = {3, 1, 2, 1}
   elseif t == 63 then
     valf = {3, 1, 3, 5}
   elseif t == 64 then
     valf = {3, 1, 4, 4}
   elseif t == 65 then
     valf = {3, 1, 5, 3}
   elseif t == 66 then
     valf = {3, 1, 6, 2}
   elseif t == 67 then
     valf = {3, 2, 1, 1}
   elseif t == 68 then
     valf = {3, 2, 2, 5}
   elseif t == 69 then
     valf = {3, 2, 3, 4}
   elseif t == 70 then
     valf = {3, 2, 4, 3}
   elseif t == 71 then
     valf = {3, 2, 5, 2}
   elseif t == 72 then
     valf = {3, 2, 6, 1}
   elseif t == 73 then
     valf = {3, 3, 1, 5}
   elseif t == 74 then
     valf = {3, 3, 2, 4}
   elseif t == 75 then
     valf = {3, 3, 3, 3}
   elseif t == 76 then
     valf = {3, 3, 4, 2}
   elseif t == 77 then
     valf = {3, 3, 5, 1}
   elseif t == 78 then
     valf = {3, 3, 6, 5}
   elseif t == 79 then
     valf = {3, 4, 1, 4}
   elseif t == 80 then
     valf = {3, 4, 2, 3}
   elseif t == 81 then
     valf = {3, 4, 3, 2}
   elseif t == 82 then
     valf = {3, 4, 4, 1}
   elseif t == 83 then
     valf = {3, 4, 5, 5}
   elseif t == 84 then
     valf = {3, 4, 6, 4}
   elseif t == 85 then
     valf = {3, 5, 1, 3}
   elseif t == 86 then
     valf = {3, 5, 2, 2}
   elseif t == 87 then
     valf = {3, 5, 3, 1}
   elseif t == 88 then
     valf = {3, 5, 4, 5}
   elseif t == 89 then
     valf = {3, 5, 5, 4}
   elseif t == 90 then
     valf = {3, 5, 6, 3}
   elseif t == 91 then
     valf = {4, 1, 1, 1}
   elseif t == 92 then
     valf = {4, 1, 2, 5}
   elseif t == 93 then
     valf = {4, 1, 3, 4}
   elseif t == 94 then
     valf = {4, 1, 4, 3}
   elseif t == 95 then
     valf = {4, 1, 5, 2}
   elseif t == 96 then
     valf = {4, 1, 6, 1}
   elseif t == 97 then
     valf = {4, 2, 1, 5}
   elseif t == 98 then
     valf = {4, 2, 2, 4}
   elseif t == 99 then
     valf = {4, 2, 3, 3}
   elseif t == 100 then
     valf = {4, 2, 4, 2}
   elseif t == 101 then
     valf = {4, 2, 5, 1}
   elseif t == 102 then
     valf = {4, 2, 6, 5}
   elseif t == 103 then
     valf = {4, 3, 1, 4}
   elseif t == 104 then
     valf = {4, 3, 2, 3}
   elseif t == 105 then
     valf = {4, 3, 3, 2}
   elseif t == 106 then
     valf = {4, 3, 4, 1}
   elseif t == 107 then
     valf = {4, 3, 5, 5}
   elseif t == 108 then
     valf = {4, 3, 6, 4}
   elseif t == 109 then
     valf = {4, 4, 1, 3}
   elseif t == 110 then
     valf = {4, 4, 2, 2}
   elseif t == 111 then
     valf = {4, 4, 3, 1}
   elseif t == 112 then
     valf = {4, 4, 4, 5}
   elseif t == 113 then
     valf = {4, 4, 5, 4}
   elseif t == 114 then
     valf = {4, 4, 6, 3}
   elseif t == 115 then
     valf = {4, 5, 1, 2}
   elseif t == 116 then
     valf = {4, 5, 2, 1}
   elseif t == 117 then
     valf = {4, 5, 3, 5}
   elseif t == 118 then
     valf = {4, 5, 4, 4}
   elseif t == 119 then
     valf = {4, 5, 5, 3}
   elseif t == 120 then
     valf = {4, 5, 6, 2}
   end

   return valf
end




function sel_values(i)
   
   local quantf = {1000, 100, 500, 2000, 10000}
   local durf = {2, 1, 6, 12, 18}
   local contf = {6, 1, 3, 5, 8, 10}
   local probaf = {0.25, 0.01, 0.1, 0.5, 0.95}
   --local infdelayf = {6, 2, 4, 8, 10}
   --local expdelayf = {4, 1, 2, 5, 6}
     
     
   return quantf[i[1]], durf[i[2]], contf[i[3]], probaf[i[4]]
end

--- A SIR model implemented with agents. It exemplifies the number of additional decisions
-- a modeller must take to switch from system dynamics to agent-based modeling.
-- @arg data.contacts Number of contacts. The default value is 6.
-- @arg data.duration Disease duration. A number with 2 as default value.
-- @arg data.finalTime Final simulation time. A number with 30 as default value.
-- @arg data.probability Probability to infect a contact. A number with 0.25 as default value.
-- @arg data.quantity Number of agents. The default value is 1000.
Disease = Model{
	quantity = 1000,
	duration = 2,
	finalTime = 50,
	contacts = 6,
	probability = 0.25,
	init = function(model)
		model.ag = Agent{
			state = "susceptible",
			sick = function(self)
				self.state = "infected"
				self.counter = 0

				model.infected = model.infected + 1
				model.susceptible = model.susceptible - 1
			end,
			on_message = function(self)
				if self.state == "susceptible" and Random{p = model.probability}:sample() then
					self:sick()
				end
			end,
			execute = function(self)
				if self.state == "infected" then
					forEachConnection(self, function(conn)
						self:message{receiver = conn, delay = 1}
					end)

					if self.counter > model.duration then
						self.state = "recovered"
						model.infected = model.infected - 1
						model.recovered = model.recovered + 1
					end

					self.counter = self.counter + 1
				end
			end
		}

		model.soc = Society{
			instance = model.ag,
			quantity = model.quantity
		}

		model.susceptible = #model.soc
		model.infected = 0
		model.recovered = 0

		model.soc:sample():sick()

		model.soc:createSocialNetwork{
			quantity = model.contacts,
			inmemory = false
		}

		model.chart = Chart{
			target = model,
		--	select = "state",
			select = {"susceptible", "infected", "recovered"}, -- it should be "value ="
			color = {"blue", "red", "green"}
		}

		model.t = Timer{
			Event{action = model.soc},
			Event{action = model.chart}
		}
	end
}

for i=1,120 do
 
 
     
  -- A
  local value = "A"
  quantv,  durv, contv, probav = 0, 0, 0, 0.0
  
  arr = {}
  arr = get_tuple(i)
  quantv,  durv, contv, probav = sel_values(arr)
   
  
  
  scene = Disease{
    quantity = quantv,
	duration = durv,
	finalTime = 50,
	contacts = contv,
	probability = probav   
  }
  
  scene:run() 

  scene.chart:save("SIRModel_correct_" .. value .. i .. ".png") 
  
  
  		
end


