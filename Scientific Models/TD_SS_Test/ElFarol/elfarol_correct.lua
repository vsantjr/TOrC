--[=====[ 
TTR:

Strength = 2
Total = 49

FindBestImages: 

Limit = 0.8

Simulation Time

50
--]=====] 

-- @example Implementation of El Farol model.
-- It is based on Brian Arthur's paper available at
-- http://www.santafe.edu/~wbarthur/Papers/El_Farol.
-- In this model, there is a city with a given population.
-- Everybody wants to go to an entertainment offered once a week
-- by a bar called El Farol. However, if the bar is too crowded,
-- it is not enjoyable. Each agent decides on
-- whether to go to the bar based on its expectations on how much
-- people the bar will have. Decisions are taken independently from
-- each other. Agents can have different ways of thinking, based on the
-- amount of people that went to the bar in the last weeks.
-- @arg N Number of people in the city. The default value is 100.
-- @arg K number of strategies each individual has (if only one then the
-- agent will never change its strategy). The default value is 3.
-- @arg MAX Maximum number of people in the bar. The default value is 60.
-- @image el-farol.png

function get_tuple(t)
   local valf = {}
   if t == 1 then
     valf = {1, 1, 6}
   elseif t == 2 then
     valf = {1, 2, 5}
   elseif t == 3 then
     valf = {1, 3, 4}
   elseif t == 4 then
     valf = {1, 4, 3}
   elseif t == 5 then
     valf = {1, 5, 2}
   elseif t == 6 then
     valf = {1, 6, 1}
   elseif t == 7 then
     valf = {1, 7, 7}
   elseif t == 8 then
     valf = {2, 1, 5}
   elseif t == 9 then
     valf = {2, 2, 4}
   elseif t == 10 then
     valf = {2, 3, 3}
   elseif t == 11 then
     valf = {2, 4, 2}
   elseif t == 12 then
     valf = {2, 5, 1}
   elseif t == 13 then
     valf = {2, 6, 7}
   elseif t == 14 then
     valf = {2, 7, 6}
   elseif t == 15 then
     valf = {3, 1, 4}
   elseif t == 16 then
     valf = {3, 2, 3}
   elseif t == 17 then
     valf = {3, 3, 2}
   elseif t == 18 then
     valf = {3, 4, 1}
   elseif t == 19 then
     valf = {3, 5, 7}
   elseif t == 20 then
     valf = {3, 6, 6}
   elseif t == 21 then
     valf = {3, 7, 5}
   elseif t == 22 then
     valf = {4, 1, 3}
   elseif t == 23 then
     valf = {4, 2, 2}
   elseif t == 24 then
     valf = {4, 3, 1}
   elseif t == 25 then
     valf = {4, 4, 7}
   elseif t == 26 then
     valf = {4, 5, 6}
   elseif t == 27 then
     valf = {4, 6, 5}
   elseif t == 28 then
     valf = {4, 7, 4}
   elseif t == 29 then
     valf = {5, 1, 2}
   elseif t == 30 then
     valf = {5, 2, 1}
   elseif t == 31 then
     valf = {5, 3, 7}
   elseif t == 32 then
     valf = {5, 4, 6}
   elseif t == 33 then
     valf = {5, 5, 5}
   elseif t == 34 then
     valf = {5, 6, 4}
   elseif t == 35 then
     valf = {5, 7, 3}
   elseif t == 36 then
     valf = {6, 1, 1}
   elseif t == 37 then
     valf = {6, 2, 7}
   elseif t == 38 then
     valf = {6, 3, 6}
   elseif t == 39 then
     valf = {6, 4, 5}
   elseif t == 40 then
     valf = {6, 5, 4}
   elseif t == 41 then
     valf = {6, 6, 3}
   elseif t == 42 then
     valf = {6, 7, 2}
   elseif t == 43 then
     valf = {7, 1, 7}
   elseif t == 44 then
     valf = {7, 2, 6}
   elseif t == 45 then
     valf = {7, 3, 5}
   elseif t == 46 then
     valf = {7, 4, 4}
   elseif t == 47 then
     valf = {7, 5, 3}
   elseif t == 48 then
     valf = {7, 6, 2}
   elseif t == 49 then
     valf = {7, 7, 1}
   end

   return valf
end

function sel_values(i)
   
   local nf = {100, 60, 80, 120, 150, 175, 200}
   local kf = {3, 2, 4, 5, 6, 7, 8}
   local maxf = {60, 30, 40, 50, 100, 110, 130}
    
     
   return nf[i[1]], kf[i[2]], maxf[i[3]]
end

   


for i=1,49 do
 
 
  local value = "A"
  nv, kv, maxv = 0, 0, 0
  
  arr = {}
  arr = get_tuple(i)
  nv, kv, maxv = sel_values(arr)

   

  N = nv -- 100 
  K = kv -- 3
  MAXPEOPLE = maxv -- 60

  LAST_TURNS = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

  update_last_turns = function(new_value)
	for i = 9, 1, -1 do
		LAST_TURNS[i + 1] = LAST_TURNS[i]
	end
	LAST_TURNS[1] = new_value
  end

-- different strategies that can be adopted by the agents
-- t[x] represent the amount of people that went to the bar x weeks ago
  function d_same_last_week(t)    return t[1]                            end
  function d_same_plus_10(t)      return t[1] + 10                       end
  function d_mirror_last_week(t)  return N - t[1]                        end -- 100
  function d_67()                 return 67                              end
  function d_same_2_weeks(t)      return t[2]                            end
  function d_same_5_weeks(t)      return t[5]                            end
  function d_average_4_weeks(t)   return (t[1] + t[2] + t[3] + t[4]) / 4 end
  function d_average_2_weeks(t)   return (t[1] + t[2]) / 2               end
  function d_max_2_weeks(t)       return math.max(t[1], t[2])            end
  function d_min_2_weeks(t)       return math.min(t[1], t[2])            end

  STRATEGIES = {d_same_last_week, d_same_plus_10, d_mirror_last_week, d_67, d_same_2_weeks,
              d_same_5_weeks, d_average_4_weeks, d_max_2_weeks, d_min_2_weeks}

  NAMES_STRATEGIES = {
	[d_same_last_week]   = "d_same_last_week",
	[d_same_plus_10]     = "d_same_plus_10",
	[d_mirror_last_week] = "d_mirror_last_week",
	[d_67]               = "d_67",
	[d_same_2_weeks]     = "d_same_2_weeks",
	[d_same_5_weeks]     = "d_same_5_weeks",
	[d_average_4_weeks]  = "d_average_4_weeks",
	[d_max_2_weeks]      = "d_max_2_weeks",
	[d_min_2_weeks]      = "d_min_2_weeks"
  }

  c = Cell{agents_in_the_bar = 0}

  list_attributes = {}

  forEachElement(NAMES_STRATEGIES, function(_, name)
	c[name] = 0
	table.insert(list_attributes, name)
  end)

  table.sort(list_attributes)

  chartBar = Chart{
	target = c,
	select = {"agents_in_the_bar"},
	symbol = "hexagon",
	size = 7,
	yLabel = "agents" -- percentage
  }

  --chartStrategies = Chart{
	--target = c,
	--select = list_attributes
  --}

  function count_strategies(soc)
	local tot = {}
	for i = 1, #STRATEGIES do
		tot[STRATEGIES[i]] = 0
	end

	local strat

	forEachAgent(soc, function(agent)
		strat = agent.strategies[agent.last_strategy]
		tot[strat] = tot[strat] + 1
	end)

	for i = 1, #STRATEGIES do
		strat = STRATEGIES[i]
		c[NAMES_STRATEGIES[strat]] = tot[strat]
	end
  end

  local generator = Random{min = 1, max = #STRATEGIES, step = 1}

  beerAgent = Agent{
	init = function(ag)
		ag.strategies = {}
		ag.count_fails = {}

		-- choose K different strategies
		ag.chosen = {0, 0, 0, 0, 0, 0, 0, 0, 0}
		for i = 1, K do
			ag.count_fails[i] = 0
			local p
			repeat
				p = generator:sample()
			until ag.chosen[p] == 0

			ag.strategies [i] = STRATEGIES[p]
			ag.chosen[p] = 1
		end

		ag.last_strategy = 1
	end,
	execute = function(ag)
		local best = 1

		for i = 2, K do
			if ag.count_fails[best] > ag.count_fails[i] then
				best = i
			end
		end

		ag.last_strategy = best

		local last = ag.strategies[best](LAST_TURNS)

		if last < MAXPEOPLE then -- MAX not used = 60
			ag.last_choose = 1
		else
			ag.last_choose = 0
		end

		return ag.last_choose
	end,
	update = function(ag, quantity)
		for i = 1, K do
			-- punishment is equal to the difference btw the predicted value
			-- and the number of attendances
			local diff = ag.strategies[i](LAST_TURNS) - quantity
			ag.count_fails[i] = ag.count_fails[i] + math.abs(diff)
		end
	end
  }

  s = Society{
	instance = beerAgent,
	quantity = N
  }

  t = Timer{
	Event{action = function()
		local quant = 0

		forEachAgent(s, function(ag)
			quant = quant + ag:execute()
		end)

		c.agents_in_the_bar = quant
		count_strategies(s)

		forEachAgent(s, function(ag)
			ag:update(quant)
		end)

		update_last_turns(quant)
	end},
	--Event{action = chartStrategies},
	Event{action = chartBar}
  }

  -- t:run(100)
  
  t:run(50)
  

  chartBar:save("ElFarol_correct_" .. value .. i .. ".png") 
  
  
  		
end
