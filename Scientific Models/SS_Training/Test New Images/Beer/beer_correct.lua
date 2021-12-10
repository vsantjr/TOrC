--[=====[ 
TTR:

Strength = 2
Total = 49

FindBestImages: 

Limit = 0.9

Simulation Time

50
--]=====] 

-- @example Implementation of beer economic chain model.
-- This model represents an economic chain with a manufacturer, some intermediate nodes (such as
-- a distributor and a supplier), and a retailer. The agents in the economic chain need to fill
-- their demand by requesting beer to the previous agent of the chain.
-- The retailer has a random demand, while the others have a demand requested by the next
-- agent of the chain. Each requested beer takes three time steps to be delivered from one agent
-- to the next one (as long as there is some stock to fulfil the demand).
-- The objective of the game is to minimize expenditure from back orders and inventory. \
-- For more information, see https://en.wikipedia.org/wiki/Beer_distribution_game.
-- @arg NUMBER_OF_AGENTS Number of agents in the chain, excluding the manufacturer and the retailer.
-- The default value is three.
-- @image beer.png

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
   
   --local naf = {3, 2, 4, 5, 7, 8, 10}
   --local brf = {0, 10, 20, 50, 100, 500, 1000}
   --local bdf = {0, 10, 20, 50, 100, 500, 1000}
   
   local naf = {3, 2, 4, 5, 7, 8, 10}
   local brf = {0, 15, 25, 60, 150, 750, 1000}
   local bdf = {0, 15, 25, 60, 150, 750, 1000}
    
     
   return naf[i[1]], brf[i[2]], bdf[i[3]]
end


for i=1,49 do
 
 
  local value = "A"
  nav, brv, bdv = 0, 0, 0
  
  arr = {}
  arr = get_tuple(i)
  nav, brv, bdv = sel_values(arr)



  NUMBER_OF_AGENTS = nav

  BasicAgent = Agent{
	requestBeer = function(agent, quantity)
		agent:message{receiver = agent.from, delay = 1, content = "request", value = quantity}
		agent.requested = quantity
	end,
	sendBeer = function(agent, quantity)
		agent:message{receiver = agent.to, content = "deliver", delay = 3,  value = quantity}
		agent.sended = quantity
	end
  }

  COUNTER = 1
  chainAgent = BasicAgent{
	init = function(agent)
		agent.stock     = 20
		agent.ordered   = 0
		agent.costs     = 0
		agent.received  = 0
		agent.priority  = COUNTER
		COUNTER = COUNTER + 1
	end,
	update_costs = function(agent)
		agent.costs = agent.costs + math.floor(agent.stock / 2) + agent.ordered
	end,
	execute = function(agent)
		if agent.ordered <= agent.stock then
			agent:sendBeer(agent.ordered)
			agent.stock = agent.stock - agent.ordered
			agent.ordered = 0
		else
			agent:sendBeer(agent.stock)
			agent.ordered = agent.ordered - agent.stock
			agent.stock = 0
		end

		-- the overall decision
		-- how many beers will I request according to my [stock] and the [ordered] amount of beer that I could not deliver?
		local requested = 0
		if agent.stock <= 20 then
			requested = 6 + agent.ordered * 0.05
		end

		agent:requestBeer(requested)
		-- end of the overall decision

		agent:update_costs()
	end,
	on_message = function(agent, message)
		if message.content == "request" then
			agent.ordered = agent.ordered + message.value
		elseif message.content == "deliver" then
			agent.stock = agent.stock + message.value
			agent.received = message.value
		end
	end
  }

  c = Cell{
	beer_requested = brv, -- 0
	beer_delivered = bdv, -- 0
	total_cost = 0
 }

  chartDeliv = Chart{
	target = c,
	select = {"beer_requested", "beer_delivered"},
	color = {"red", "blue"}
  }

  --chartCost = Chart{
	--target = c,
	--select = "total_cost",
	--color = "black",
	--style = "sticks"
  --}

  local generator = Random{min = 1, max = 30, step = 1}

  retailer = BasicAgent{
	priority  = 0,
	received  = 0,
	ordered   = 0,
	costs     = 0,
	execute = function(agent)
		local requested = generator:sample()
		c.beer_requested = requested
		agent:requestBeer(requested)
	end,
	on_message = function(agent, message)
		if message.content == "deliver" then
			agent.received = message.value
			c.beer_delivered = message.value
		end
	end
  }

  manufacturer = BasicAgent{
	priority = NUMBER_OF_AGENTS + 1,
	received  = 0,
	ordered   = 0,
	costs     = 0,
	execute = function(agent)
		agent:sendBeer(agent.ordered)
		agent.ordered = 0
	end,
	on_message = function(agent, message)
		if message.content == "request" then
			agent.ordered = message.value
		end
	end
  }

  s = Society{
	instance = chainAgent,
	quantity = NUMBER_OF_AGENTS
  }

  s:add(retailer)
  s:add(manufacturer)

-- defines the order to execute the agents
  g = Group{
	target = s,
    greater = function(a, b) return a.priority < b.priority end
  }

-- connects the i'th agent to the i + 1'th
  last = {}
  forEachAgent(g, function(ag)
	ag.to     = last
	last.from = ag
	last      = ag
  end)

  t = Timer{
	Event{action = function()
		s:execute()
		s:synchronize()
		c.total_cost = 0

		forEachAgent(s, function(agent)
			c.total_cost = c.total_cost + agent.costs
		end)
	end},
	Event{action = chartDeliv}
	--Event{action = chartCost}
  }

  t:run(50) -- 100


  chartDeliv:save("Beer_correct_" .. value .. i .. ".png") 
  
  
  		
end
