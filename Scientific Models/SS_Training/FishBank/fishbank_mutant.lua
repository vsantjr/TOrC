import ("sci")

--[=====[ 

MUTANT D

TTR:

Strength = 3
Total = 120

FindBestImages: 

Limit = 0.9

Simulation Time

50


--]=====] 
function get_tuple(t)
   local valf = {}
   if t == 1 then
     valf = {3, 1, 1, 1, 5, 5, 1}
   elseif t == 2 then
     valf = {2, 1, 1, 2, 4, 5, 5}
   elseif t == 3 then
     valf = {1, 1, 1, 3, 3, 1, 4}
   elseif t == 4 then
     valf = {3, 1, 1, 4, 2, 3, 3}
   elseif t == 5 then
     valf = {4, 1, 1, 5, 1, 4, 2}
   elseif t == 6 then
     valf = {4, 1, 2, 1, 4, 3, 4}
   elseif t == 7 then
     valf = {4, 1, 2, 2, 3, 2, 3}
   elseif t == 8 then
     valf = {2, 1, 2, 3, 2, 1, 2}
   elseif t == 9 then
     valf = {1, 1, 2, 4, 1, 5, 1}
   elseif t == 10 then
     valf = {2, 1, 2, 5, 5, 4, 5}
   elseif t == 11 then
     valf = {2, 1, 3, 1, 3, 5, 2}
   elseif t == 12 then
     valf = {1, 1, 3, 2, 2, 4, 1}
   elseif t == 13 then
     valf = {1, 1, 3, 3, 1, 3, 5}
   elseif t == 14 then
     valf = {4, 1, 3, 4, 5, 2, 4}
   elseif t == 15 then
     valf = {3, 1, 3, 5, 4, 1, 3}
   elseif t == 16 then
     valf = {4, 1, 4, 1, 1, 1, 5}
   elseif t == 17 then
     valf = {4, 1, 4, 2, 3, 5, 4}
   elseif t == 18 then
     valf = {3, 1, 4, 3, 4, 4, 3}
   elseif t == 19 then
     valf = {2, 1, 4, 4, 3, 3, 1}
   elseif t == 20 then
     valf = {1, 1, 4, 5, 5, 2, 2}
   elseif t == 21 then
     valf = {1, 1, 5, 1, 4, 5, 3}
   elseif t == 22 then
     valf = {3, 1, 5, 2, 3, 3, 2}
   elseif t == 23 then
     valf = {4, 1, 5, 3, 2, 5, 1}
   elseif t == 24 then
     valf = {3, 1, 5, 4, 1, 2, 5}
   elseif t == 25 then
     valf = {2, 1, 5, 5, 5, 1, 4}
   elseif t == 26 then
     valf = {1, 2, 1, 1, 1, 5, 4}
   elseif t == 27 then
     valf = {1, 2, 1, 2, 5, 4, 3}
   elseif t == 28 then
     valf = {2, 2, 1, 3, 4, 3, 2}
   elseif t == 29 then
     valf = {4, 2, 1, 4, 1, 2, 1}
   elseif t == 30 then
     valf = {3, 2, 1, 5, 2, 1, 5}
   elseif t == 31 then
     valf = {1, 2, 2, 1, 5, 2, 2}
   elseif t == 32 then
     valf = {4, 2, 2, 2, 4, 1, 1}
   elseif t == 33 then
     valf = {4, 2, 2, 3, 3, 5, 5}
   elseif t == 34 then
     valf = {3, 2, 2, 4, 2, 4, 4}
   elseif t == 35 then
     valf = {2, 2, 2, 5, 1, 3, 3}
   elseif t == 36 then
     valf = {4, 2, 3, 1, 1, 1, 1}
   elseif t == 37 then
     valf = {3, 2, 3, 2, 5, 1, 5}
   elseif t == 38 then
     valf = {2, 2, 3, 3, 4, 5, 4}
   elseif t == 39 then
     valf = {1, 2, 3, 4, 3, 3, 3}
   elseif t == 40 then
     valf = {4, 2, 3, 5, 2, 3, 2}
   elseif t == 41 then
     valf = {1, 2, 4, 1, 2, 3, 5}
   elseif t == 42 then
     valf = {2, 2, 4, 2, 1, 2, 4}
   elseif t == 43 then
     valf = {4, 2, 4, 3, 5, 1, 3}
   elseif t == 44 then
     valf = {3, 2, 4, 4, 4, 5, 2}
   elseif t == 45 then
     valf = {2, 2, 4, 5, 3, 4, 1}
   elseif t == 46 then
     valf = {3, 2, 5, 1, 3, 1, 4}
   elseif t == 47 then
     valf = {3, 2, 5, 2, 2, 5, 3}
   elseif t == 48 then
     valf = {1, 2, 5, 3, 1, 4, 2}
   elseif t == 49 then
     valf = {2, 2, 5, 4, 5, 3, 1}
   elseif t == 50 then
     valf = {4, 2, 5, 5, 4, 2, 5}
   elseif t == 51 then
     valf = {2, 3, 1, 1, 3, 2, 5}
   elseif t == 52 then
     valf = {4, 3, 1, 2, 2, 1, 4}
   elseif t == 53 then
     valf = {4, 3, 1, 3, 1, 5, 3}
   elseif t == 54 then
     valf = {2, 3, 1, 4, 5, 4, 2}
   elseif t == 55 then
     valf = {1, 3, 1, 5, 4, 3, 1}
   elseif t == 56 then
     valf = {3, 3, 2, 1, 1, 1, 2}
   elseif t == 57 then
     valf = {2, 3, 2, 2, 5, 5, 1}
   elseif t == 58 then
     valf = {1, 3, 2, 3, 4, 4, 5}
   elseif t == 59 then
     valf = {4, 3, 2, 4, 3, 3, 2}
   elseif t == 60 then
     valf = {3, 3, 2, 5, 2, 2, 1}
   elseif t == 61 then
     valf = {2, 3, 3, 1, 5, 3, 3}
   elseif t == 62 then
     valf = {1, 3, 3, 2, 4, 2, 2}
   elseif t == 63 then
     valf = {3, 3, 3, 3, 3, 1, 1}
   elseif t == 64 then
     valf = {4, 3, 3, 4, 2, 5, 5}
   elseif t == 65 then
     valf = {3, 3, 3, 5, 1, 4, 4}
   elseif t == 66 then
     valf = {1, 3, 4, 1, 3, 5, 3}
   elseif t == 67 then
     valf = {3, 3, 4, 2, 2, 4, 2}
   elseif t == 68 then
     valf = {4, 3, 4, 3, 1, 3, 1}
   elseif t == 69 then
     valf = {3, 3, 4, 4, 5, 2, 5}
   elseif t == 70 then
     valf = {2, 3, 4, 5, 4, 1, 4}
   elseif t == 71 then
     valf = {2, 3, 5, 1, 2, 4, 1}
   elseif t == 72 then
     valf = {1, 3, 5, 2, 1, 1, 5}
   elseif t == 73 then
     valf = {1, 3, 5, 3, 5, 2, 4}
   elseif t == 74 then
     valf = {4, 3, 5, 4, 4, 1, 3}
   elseif t == 75 then
     valf = {3, 3, 5, 5, 3, 5, 2}
   elseif t == 76 then
     valf = {4, 4, 1, 1, 3, 1, 3}
   elseif t == 77 then
     valf = {3, 4, 1, 2, 1, 5, 2}
   elseif t == 78 then
     valf = {2, 4, 1, 3, 2, 4, 1}
   elseif t == 79 then
     valf = {1, 4, 1, 4, 5, 3, 5}
   elseif t == 80 then
     valf = {3, 4, 1, 5, 4, 2, 4}
   elseif t == 81 then
     valf = {1, 4, 2, 1, 2, 5, 3}
   elseif t == 82 then
     valf = {4, 4, 2, 2, 1, 4, 5}
   elseif t == 83 then
     valf = {3, 4, 2, 3, 5, 3, 4}
   elseif t == 84 then
     valf = {2, 4, 2, 4, 4, 2, 3}
   elseif t == 85 then
     valf = {1, 4, 2, 5, 3, 1, 2}
   elseif t == 86 then
     valf = {3, 4, 3, 1, 3, 4, 5}
   elseif t == 87 then
     valf = {2, 4, 3, 2, 2, 3, 4}
   elseif t == 88 then
     valf = {1, 4, 3, 3, 1, 2, 3}
   elseif t == 89 then
     valf = {4, 4, 3, 4, 5, 1, 2}
   elseif t == 90 then
     valf = {4, 4, 3, 5, 4, 5, 1}
   elseif t == 91 then
     valf = {1, 4, 4, 1, 5, 4, 4}
   elseif t == 92 then
     valf = {1, 4, 4, 2, 4, 3, 3}
   elseif t == 93 then
     valf = {4, 4, 4, 3, 3, 2, 2}
   elseif t == 94 then
     valf = {3, 4, 4, 4, 2, 1, 1}
   elseif t == 95 then
     valf = {2, 4, 4, 5, 1, 5, 5}
   elseif t == 96 then
     valf = {2, 4, 5, 1, 1, 3, 2}
   elseif t == 97 then
     valf = {3, 4, 5, 2, 5, 2, 1}
   elseif t == 98 then
     valf = {2, 4, 5, 3, 4, 1, 5}
   elseif t == 99 then
     valf = {2, 4, 5, 4, 3, 5, 4}
   elseif t == 100 then
     valf = {4, 4, 5, 5, 2, 4, 3}
   elseif t == 101 then
     valf = {2, 5, 1, 1, 4, 4, 3}
   elseif t == 102 then
     valf = {4, 5, 1, 2, 3, 3, 1}
   elseif t == 103 then
     valf = {3, 5, 1, 3, 2, 2, 5}
   elseif t == 104 then
     valf = {2, 5, 1, 4, 1, 1, 4}
   elseif t == 105 then
     valf = {1, 5, 1, 5, 5, 5, 4}
   elseif t == 106 then
     valf = {2, 5, 2, 1, 3, 3, 1}
   elseif t == 107 then
     valf = {1, 5, 2, 2, 2, 3, 5}
   elseif t == 108 then
     valf = {4, 5, 2, 3, 1, 1, 4}
   elseif t == 109 then
     valf = {3, 5, 2, 4, 5, 5, 3}
   elseif t == 110 then
     valf = {4, 5, 2, 5, 4, 4, 2}
   elseif t == 111 then
     valf = {1, 5, 3, 1, 2, 1, 3}
   elseif t == 112 then
     valf = {2, 5, 3, 2, 1, 5, 3}
   elseif t == 113 then
     valf = {4, 5, 3, 3, 5, 4, 1}
   elseif t == 114 then
     valf = {3, 5, 3, 4, 4, 3, 1}
   elseif t == 115 then
     valf = {2, 5, 3, 5, 3, 2, 5}
   elseif t == 116 then
     valf = {3, 5, 4, 1, 1, 2, 3}
   elseif t == 117 then
     valf = {2, 5, 4, 2, 5, 1, 2}
   elseif t == 118 then
     valf = {1, 5, 4, 3, 4, 5, 1}
   elseif t == 119 then
     valf = {1, 5, 4, 4, 3, 4, 5}
   elseif t == 120 then
     valf = {4, 5, 4, 5, 2, 3, 4}
   end

   return valf
end


function sel_values(i)
   
   local fis = {475, 100, 200, 250}
   local shi = {3, 1, 2, 5, 10}
   --local are = {55, 15, 35, 105, 155}
   local hat = {4, 1, 2, 3, 5}
   --local cca = {874, 300, 500, 1500, 2000} -- 2p: 300
   local fpr = {13, 5, 8, 10, 20}
   local fiv = {0.1, 0.15, 0.20, 0.25, 0.30}
   local shc = {150, 100, 125, 200, 300}
   local ocs = {985, 600, 800, 1200, 2400}
   
  
     
   return fis[i[1]], shi[i[2]], hat[i[3]], fpr[i[4]], fiv[i[5]], shc[i[6]], ocs[i[7]] 
end


-- O argumento de entrada de spline deve estar no intervalo de x!

local Death_Fish = Spline{
	points = DataFrame{
		x = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.2, 1.4, 1.6, 1.8, 2},
		y = {5.22, 5.225, 5.23, 5.24, 5.26, 5.29, 5.34, 5.45, 5.66, 5.94, 6, 6.44, 7.13, 7.97, 9.32, 11}
	}
}


local catch_per_fish_lookup = Spline{
	points = DataFrame{
		x = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
		y = {0, 5, 10.38, 15.88, 20.25, 22.13, 23.25, 23.75, 24.25, 24.63, 25, 25.35, 25.48}
	}
}


Fish_bank = Model {
    fish = 475,
    ships = 3,
    area = 100,
    hatch_fraction = 4,
    carrying_capacity = 900,
    fish_price = 13,
    fraction_invested = 0.1,
    ship_cost = 150,
    operation_cost_ship = 985,
    finalTime = 50,
    total_profits = 1,
    yearly_profits = 2,
    
    catch_per_ship = function(self)
        local density = self.fish/self.area
		return catch_per_fish_lookup:value(density)
	end,
    
    death_fraction = function(self)
        local prop_fish_capacity = self.fish/self.carrying_capacity
        --print(prop_fish_capacity)
		return Death_Fish:value(prop_fish_capacity)
	end,
    
    execute = function (self)
        local fish_hatch_rate = self.fish * self.hatch_fraction
        
         
       
        local fish_death_rate = self.fish * self.death_fraction(self)
        
        -- Mutation 1: AOR3 (* => +)
        --  local total_catch_per_year = self.ships*self.catch_per_ship(self)
        local total_catch_per_year = self.ships+self.catch_per_ship(self)
        
        
        
        local revenues = self.fish_price * total_catch_per_year
        local operating_cost = self.operation_cost_ship * self.ships
        
        self.yearly_profits = revenues - operating_cost
                
        local ship_building_rate = self.yearly_profits * self.fraction_invested * self.ship_cost
        
        if ship_building_rate >= 0 then 
			self.ships = self.ships + ship_building_rate
		end
        
        if self.fish + fish_hatch_rate - fish_death_rate - total_catch_per_year>= 0 then
           local temp_fish = self.fish + fish_hatch_rate - fish_death_rate - total_catch_per_year
           if (temp_fish <= 2*self.carrying_capacity) then
               self.fish = temp_fish
           else 
               self.fish = 0  
           end      
        else
          self.fish = 0
        end
        
        --print("fish: " .. self.fish)
        
        --print("tot pr be: " .. self.total_profits .. "year pr be: " .. self.yearly_profits )
        
        -- Mutation 2: AOR4 (- => %)
        -- self.total_profits = self.total_profits - self.yearly_profits
        
        self.total_profits = self.total_profits % self.yearly_profits
        print("tot pr af: " .. self.total_profits .. " - year pr af: " .. self.yearly_profits )
        
    end,
    
     init = function(self)
        --self.chart1 = Chart{target = self, select = "yearly_profits"}
        --self.chart2 = Chart{target = self, select = "fish"}
        self.chart3 = Chart{target = self, select = "total_profits"}
        
        self.timer = Timer{
           -- Event{action = self.chart1},
            --Event{action = self.chart2},
            Event{action = self.chart3},
            Event{action = self}
        }

    end
}

for i=1,120 do
 
  
  
  local value = "D"
  fisv, shiv, hatv, fprv, fivv, shcv, ocsv = 0, 0, 0, 0, 0.0, 0, 0
  
  arr = {}
  arr = get_tuple(i)
  fisv, shiv, hatv, fprv, fivv, shcv, ocsv = sel_values(arr)
  
 
  
  
  scene = Fish_bank{
    fish = fisv,
    ships = shiv,
    area = 100,
    hatch_fraction = hatv,
    carrying_capacity = 900,
    fish_price = fprv,
    fraction_invested = fivv,
    ship_cost = shcv,
    operation_cost_ship = ocsv,
    finalTime = 50,
    total_profits = 1,
    yearly_profits = 2
  }
  
  scene:run() 

  scene.chart3:save("FishBank_mutant_" .. value .. i .. ".png") 
  
  		
end


