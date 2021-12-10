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
     valf = {1, 1, 1, 2, 5, 1}
   elseif t == 2 then
     valf = {1, 1, 2, 4, 4, 5}
   elseif t == 3 then
     valf = {1, 1, 3, 3, 3, 4}
   elseif t == 4 then
     valf = {1, 1, 4, 2, 2, 3}
   elseif t == 5 then
     valf = {1, 1, 5, 1, 1, 2}
   elseif t == 6 then
     valf = {1, 2, 1, 3, 4, 3}
   elseif t == 7 then
     valf = {1, 2, 2, 2, 3, 2}
   elseif t == 8 then
     valf = {1, 2, 3, 1, 2, 1}
   elseif t == 9 then
     valf = {1, 2, 4, 2, 1, 5}
   elseif t == 10 then
     valf = {1, 2, 5, 4, 5, 4}
   elseif t == 11 then
     valf = {1, 3, 1, 1, 3, 5}
   elseif t == 12 then
     valf = {1, 3, 2, 1, 3, 4}
   elseif t == 13 then
     valf = {1, 3, 3, 4, 1, 3}
   elseif t == 14 then
     valf = {1, 3, 4, 3, 5, 2}
   elseif t == 15 then
     valf = {1, 3, 5, 2, 4, 1}
   elseif t == 16 then
     valf = {1, 4, 1, 4, 1, 1}
   elseif t == 17 then
     valf = {1, 4, 2, 3, 5, 5}
   elseif t == 18 then
     valf = {1, 4, 3, 2, 4, 4}
   elseif t == 19 then
     valf = {1, 4, 4, 1, 3, 3}
   elseif t == 20 then
     valf = {1, 4, 5, 4, 2, 2}
   elseif t == 21 then
     valf = {1, 5, 1, 1, 4, 4}
   elseif t == 22 then
     valf = {1, 5, 2, 4, 3, 1}
   elseif t == 23 then
     valf = {1, 5, 3, 3, 2, 5}
   elseif t == 24 then
     valf = {1, 5, 4, 4, 1, 2}
   elseif t == 25 then
     valf = {1, 5, 5, 1, 5, 3}
   elseif t == 26 then
     valf = {2, 1, 1, 3, 1, 5}
   elseif t == 27 then
     valf = {2, 1, 2, 2, 5, 4}
   elseif t == 28 then
     valf = {2, 1, 3, 1, 4, 3}
   elseif t == 29 then
     valf = {2, 1, 4, 2, 3, 2}
   elseif t == 30 then
     valf = {2, 1, 5, 4, 2, 1}
   elseif t == 31 then
     valf = {2, 2, 1, 1, 5, 2}
   elseif t == 32 then
     valf = {2, 2, 2, 2, 4, 1}
   elseif t == 33 then
     valf = {2, 2, 3, 4, 3, 5}
   elseif t == 34 then
     valf = {2, 2, 4, 3, 2, 4}
   elseif t == 35 then
     valf = {2, 2, 5, 2, 1, 3}
   elseif t == 36 then
     valf = {2, 3, 1, 1, 1, 4}
   elseif t == 37 then
     valf = {2, 3, 2, 4, 5, 1}
   elseif t == 38 then
     valf = {2, 3, 3, 3, 4, 5}
   elseif t == 39 then
     valf = {2, 3, 4, 2, 3, 4}
   elseif t == 40 then
     valf = {2, 3, 5, 1, 2, 3}
   elseif t == 41 then
     valf = {2, 4, 1, 4, 2, 3}
   elseif t == 42 then
     valf = {2, 4, 2, 3, 1, 2}
   elseif t == 43 then
     valf = {2, 4, 3, 2, 5, 1}
   elseif t == 44 then
     valf = {2, 4, 4, 1, 4, 5}
   elseif t == 45 then
     valf = {2, 4, 5, 1, 3, 4}
   elseif t == 46 then
     valf = {2, 5, 1, 1, 3, 1}
   elseif t == 47 then
     valf = {2, 5, 2, 2, 2, 5}
   elseif t == 48 then
     valf = {2, 5, 3, 4, 1, 4}
   elseif t == 49 then
     valf = {2, 5, 4, 3, 5, 3}
   elseif t == 50 then
     valf = {2, 5, 5, 4, 4, 2}
   elseif t == 51 then
     valf = {3, 1, 1, 4, 3, 2}
   elseif t == 52 then
     valf = {3, 1, 2, 3, 3, 1}
   elseif t == 53 then
     valf = {3, 1, 3, 2, 1, 5}
   elseif t == 54 then
     valf = {3, 1, 4, 1, 1, 4}
   elseif t == 55 then
     valf = {3, 1, 5, 4, 4, 3}
   elseif t == 56 then
     valf = {3, 2, 1, 4, 1, 1}
   elseif t == 57 then
     valf = {3, 2, 2, 3, 5, 5}
   elseif t == 58 then
     valf = {3, 2, 3, 4, 4, 4}
   elseif t == 59 then
     valf = {3, 2, 4, 1, 3, 3}
   elseif t == 60 then
     valf = {3, 2, 5, 2, 2, 2}
   elseif t == 61 then
     valf = {3, 3, 1, 2, 5, 3}
   elseif t == 62 then
     valf = {3, 3, 2, 1, 4, 2}
   elseif t == 63 then
     valf = {3, 3, 3, 1, 3, 1}
   elseif t == 64 then
     valf = {3, 3, 4, 4, 2, 5}
   elseif t == 65 then
     valf = {3, 3, 5, 3, 1, 4}
   elseif t == 66 then
     valf = {3, 4, 1, 2, 3, 5}
   elseif t == 67 then
     valf = {3, 4, 2, 1, 2, 4}
   elseif t == 68 then
     valf = {3, 4, 3, 3, 1, 3}
   elseif t == 69 then
     valf = {3, 4, 4, 4, 5, 2}
   elseif t == 70 then
     valf = {3, 4, 5, 3, 4, 1}
   elseif t == 71 then
     valf = {3, 5, 1, 3, 2, 2}
   elseif t == 72 then
     valf = {3, 5, 2, 4, 1, 3}
   elseif t == 73 then
     valf = {3, 5, 3, 3, 5, 2}
   elseif t == 74 then
     valf = {3, 5, 4, 2, 4, 1}
   elseif t == 75 then
     valf = {3, 5, 5, 1, 3, 5}
   elseif t == 76 then
     valf = {4, 1, 1, 2, 4, 1}
   elseif t == 77 then
     valf = {4, 1, 2, 1, 2, 5}
   elseif t == 78 then
     valf = {4, 1, 3, 3, 4, 4}
   elseif t == 79 then
     valf = {4, 1, 4, 4, 5, 3}
   elseif t == 80 then
     valf = {4, 1, 5, 3, 5, 2}
   elseif t == 81 then
     valf = {4, 2, 1, 2, 2, 5}
   elseif t == 82 then
     valf = {4, 2, 2, 1, 1, 4}
   elseif t == 83 then
     valf = {4, 2, 3, 4, 5, 3}
   elseif t == 84 then
     valf = {4, 2, 4, 2, 4, 2}
   elseif t == 85 then
     valf = {4, 2, 5, 3, 3, 1}
   elseif t == 86 then
     valf = {4, 3, 1, 4, 3, 4}
   elseif t == 87 then
     valf = {4, 3, 2, 3, 2, 3}
   elseif t == 88 then
     valf = {4, 3, 3, 2, 1, 2}
   elseif t == 89 then
     valf = {4, 3, 4, 1, 5, 1}
   elseif t == 90 then
     valf = {4, 3, 5, 1, 4, 5}
   elseif t == 91 then
     valf = {4, 4, 1, 3, 5, 4}
   elseif t == 92 then
     valf = {4, 4, 2, 2, 4, 3}
   elseif t == 93 then
     valf = {4, 4, 3, 1, 3, 2}
   elseif t == 94 then
     valf = {4, 4, 4, 2, 2, 1}
   elseif t == 95 then
     valf = {4, 4, 5, 4, 1, 5}
   elseif t == 96 then
     valf = {4, 5, 1, 1, 1, 3}
   elseif t == 97 then
     valf = {4, 5, 2, 2, 5, 2}
   elseif t == 98 then
     valf = {4, 5, 3, 4, 4, 1}
   elseif t == 99 then
     valf = {4, 5, 4, 3, 3, 5}
   elseif t == 100 then
     valf = {4, 5, 5, 2, 2, 4}
   elseif t == 101 then
     valf = {5, 1, 1, 1, 4, 2}
   elseif t == 102 then
     valf = {5, 1, 2, 1, 3, 3}
   elseif t == 103 then
     valf = {5, 1, 3, 4, 2, 2}
   elseif t == 104 then
     valf = {5, 1, 4, 3, 1, 1}
   elseif t == 105 then
     valf = {5, 1, 5, 2, 5, 5}
   elseif t == 106 then
     valf = {5, 2, 1, 2, 3, 4}
   elseif t == 107 then
     valf = {5, 2, 2, 4, 2, 2}
   elseif t == 108 then
     valf = {5, 2, 3, 3, 1, 2}
   elseif t == 109 then
     valf = {5, 2, 4, 2, 5, 5}
   elseif t == 110 then
     valf = {5, 2, 5, 1, 4, 5}
   elseif t == 111 then
     valf = {5, 3, 1, 3, 2, 1}
   elseif t == 112 then
     valf = {5, 3, 2, 2, 1, 5}
   elseif t == 113 then
     valf = {5, 3, 3, 1, 5, 4}
   elseif t == 114 then
     valf = {5, 3, 4, 4, 4, 3}
   elseif t == 115 then
     valf = {5, 3, 5, 4, 3, 2}
   elseif t == 116 then
     valf = {5, 4, 1, 2, 1, 2}
   elseif t == 117 then
     valf = {5, 4, 2, 1, 5, 1}
   elseif t == 118 then
     valf = {5, 4, 3, 2, 4, 5}
   elseif t == 119 then
     valf = {5, 4, 4, 4, 3, 4}
   elseif t == 120 then
     valf = {5, 4, 5, 3, 2, 3}
   end

   return valf
end

function sel_values(i)
   
   local immlf = {168, 55, 87, 200, 1000}
   local celllf = {380, 64, 200, 500, 1000}
   local infectlf = {24, 10, 20, 50, 100}
   local infinitf = {0.01, 0.001, 0.05, 0.1}
   local infdelayf = {6, 2, 4, 8, 10}
   local expdelayf = {4, 1, 2, 5, 6}
     
     
   return immlf[i[1]], celllf[i[2]], infectlf[i[3]], infinitf[i[4]], infdelayf[i[5]], expdelayf[i[6]]
end



local cstate = {dead = "dead", healthy = "healthy", infected = "infected", expressing = "expressing", infectious = "infectious"}

local immstate = {virgin = "virgin", mature = "mature"}

--- Influenza A model by Beauchemin, Catherine, John Samuel, and Jack Tuszynski.
-- "A simple cellular automaton model for influenza A viral infections.".
-- Journal of theoretical biology 232.2 (2005): 223-234.
-- Authors: Matheus Cavassan Zaglia, Fabiana Zioti, Gabriel Sansigolo.
-- @arg data.xdim The x dimension of the space.
-- @arg data.ydim The y dimension of the space.
-- @arg data.flow_rate The number of CA time steps corresponding to 1h in real time.
-- @arg data.finalTime The final time of the CA.
-- @arg data.imm_lifespan The lifespan of the immune cell.
-- @arg data.cell_lifespan The lifespan of the epithelial cell.
-- @arg data.infect_lifespan The lifespan of an infected epithelial cell.
-- @arg data.infect_init The probability of an epithelial cell starting as infectious.
-- @arg data.infect_rate The infection spread probability.
-- @arg data.infect_delay The delay to an expressing epithelial cell becoming infectious.
-- @arg data.express_delay The delay to an infected epithelial cell becoming expressing.
-- @arg data.division_time The probability per unit time that any dead epithelial cell is revived.
-- @arg data.recruit_delay The waiting delay of a newly recruited immune cell to become active.
-- @arg data.recruitment The chance of recruiting a mature immune cell.
Influenza = Model{
    xdim = Choice{min = 1, max = 440, step = 1, default = 40},
    ydim = Choice{min = 1, max = 280, step = 1, default = 40},
    flow_rate = 6,
    finalTime = 50,
    imm_lifespan = 168,
    cell_lifespan = 380,
    infect_lifespan = 24,
    infect_init = 0.01,
    infect_rate = Choice{min = 0, max = 8, step=1, default=2},
    infect_delay = 6,
    express_delay = 4,
    division_time = 12,
    recruit_delay = 7,
    recruitment = Choice{min=0.00, max=1, step=0.01, default = 0.25},


    init = function(model)
        model.finalTime = model.finalTime * model.flow_rate
        local base_imm_cell = math.ceil(model.ydim * model.xdim * 0.00015)
        local dead_count = 0
        local healthy_count = 0

        model.cell  = Cell{
            infected_time = 0,
            state = Random{healthy = 1 - model.infect_init, infectious = model.infect_init},
            init = function(cell)
                if cell.state == cstate.healthy then
                    healthy_count = healthy_count + 1
                    cell.age = Random{min = 0, max = model.cell_lifespan}:sample()
                else
                    cell.age = Random{min = 0, max = model.infect_lifespan}:sample()
                end
            end, -- init
            execute = function(cell)
                if cell.state == cstate.dead then
                    cell:divide()
                else
                    if cell.state == cstate.healthy then --healthy cells
                        -- dies if age > cell_lifespan
                        if cell.age > model.cell_lifespan then
                            cell:die()
                        else
                            cell:infect()
                            cell.age = cell.age + 1
                        end
                    else -- infected, expressing, infectious cells
                        --  dies if age > infect_lifespan
                        if cell.age > model.infect_lifespan then
                            cell:die()
                        else
                            -- if not infectious check express and infect delay
                            if cell.state ~= cell.infectious then
                                -- if infected_time >  express_delay, becomes expressing
                                if cell.infected_time > model.express_delay then
                                    cell.state = cstate.expressing
                                end
                                -- if infected_time >  infect_delay, becomes infectious
                                if cell.infected_time > model.infect_delay then
                                    cell.state = cstate.infectious
                                end
                                cell.infected_time = cell.infected_time + 1
                            end
                            cell.age = cell.age + 1
                        end
                    end
                end
            end -- execute
        }


        function model.cell:die()
            if self.state == cstate.healthy then
                healthy_count = healthy_count - 1
            end
            self.state = cstate.dead
            dead_count = dead_count + 1
        end -- cell:die

        function model.cell:divide()
            local prob = ((1 / model.division_time) * (healthy_count / dead_count))
            local d = Random{p = prob}
            if d:sample() then
                self.state = cstate.healthy
                self.age = 0
                healthy_count = healthy_count + 1
                dead_count = dead_count - 1
            end
            self:infect()
        end -- cell:divide

        function model.cell:infect()
            if self.state == cstate.healthy then
                forEachNeighbor(self, function(neighbor)
                    if neighbor.state == cstate.infectious and self.state == cstate.healthy then
                        local infect = Random{p = model.infect_rate / 8 }
                        if infect:sample() then
                            self.state = cstate.infected
                            healthy_count = healthy_count - 1
                            return true
                        end
                    end
                end)
            end
        end -- cell:infect

        model.agent = Agent{
            age = Random{min = 0, max = model.imm_lifespan},
            state = immstate.virgin,
            delay = 0,

            execute = function(agent)
                if agent.delay > 0 then
                    if model.timer:getTime() % (agent.delay * model.flow_rate) == 0 then
                        agent.delay = agent.delay - 1
                    end
                else
                    if agent.age > model.imm_lifespan then
                        agent:die()
                    else
                        local cell = agent:getCell()
                        if cell.state == cstate.expressing or cell.state == cstate.infectious then
                            if agent.state == immstate.virgin then
                                agent.state = immstate.mature
                            else
                                cell:die()
                                local s = Random{p = model.recruitment}
                                if s:sample() then
                                    local a = model.society:add()
                                    a.state = immstate.mature
                                    a.delay = model.recruit_delay
                                    a:enter(model.cs:sample())
                                end
                            end
                        end
                        agent:walk()
                        if (model.timer:getTime() % model.flow_rate) == 0 then
                            agent.age = agent.age + 1
                        end
                    end
                end
            end -- execute
        } -- agent

        model.society = Society{
            instance = model.agent,
            quantity = base_imm_cell
        } -- society

        model.cs = CellularSpace{
            xdim = model.xdim,
            instance = model.cell
        } -- cellspace

        model.cs:createNeighborhood{wrap = true}

        model.environment = Environment{model.society, model.cs}

        model.environment:createPlacement{}

        model.map = Map{
            target = model.cs,
            select = "state",
            value = {cstate.dead, cstate.healthy, cstate.infected, cstate.expressing, cstate.infectious},
            color = {"white", "green", "yellow", "orange", "red"}
        } -- map

        --model.chart = Chart{
          --  target = model.cs,
            --select = "state",
            --value = {cstate.dead, cstate.healthy, cstate.infected, cstate.expressing, cstate.infectious},
            --color = {"black", "green", "yellow", "orange", "red"}
        --} -- chart

        model.timer = Timer{
            Event{period = model.flow_rate, action = model.cs},
            Event{period = model.flow_rate, action = model.map},
            Event{action = model.society},
            Event{period = model.flow_rate, action = function()
                      if #model.society < base_imm_cell then
                          agent = model.society:add()    -- SKIP
                          agent:enter(model.cs:sample()) -- SKIP
                      end
                  end} -- base_imm_cell maintenance
        } -- timer
    end -- model.init
    

}    
for i=1,120 do
 
 
   
  -- A
  local value = "A"
  immlv,  celllv, infectlv, infinitv, infdelayv, expdelayv = 0, 0, 0, 0.0, 0, 0
  
  arr = {}
  arr = get_tuple(i)
  immlv,  celllv, infectlv, infinitv, infdelayv, expdelayv = sel_values(arr)
   
  
  
  scene = Influenza{
    flow_rate = 1,
    finalTime = 50,
    imm_lifespan = immlv,
    cell_lifespan = celllv,
    infect_lifespan = infectlv,
    infect_init = infinitv,
    infect_delay = infdelayv,
    express_delay = expdelayv,
    division_time = 12,
    recruit_delay = 7
   
  }
  
  scene:run() 

  scene.map:save("Influenza_correct_" .. value .. i .. ".png") 
  
  
  		
end
