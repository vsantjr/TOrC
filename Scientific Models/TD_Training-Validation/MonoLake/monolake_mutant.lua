
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
     valf = {1, 4, 3, 1, 1, 3}
   elseif t == 2 then
     valf = {1, 3, 4, 1, 2, 2}
   elseif t == 3 then
     valf = {1, 2, 2, 1, 3, 2}
   elseif t == 4 then
     valf = {1, 1, 1, 1, 4, 1}
   elseif t == 5 then
     valf = {1, 3, 4, 1, 5, 4}
   elseif t == 6 then
     valf = {1, 3, 2, 2, 1, 1}
   elseif t == 7 then
     valf = {1, 4, 1, 2, 2, 4}
   elseif t == 8 then
     valf = {1, 2, 3, 2, 3, 3}
   elseif t == 9 then
     valf = {1, 1, 4, 2, 4, 2}
   elseif t == 10 then
     valf = {1, 1, 3, 2, 5, 2}
   elseif t == 11 then
     valf = {1, 3, 3, 3, 1, 2}
   elseif t == 12 then
     valf = {1, 1, 2, 3, 2, 1}
   elseif t == 13 then
     valf = {1, 4, 4, 3, 3, 4}
   elseif t == 14 then
     valf = {1, 4, 1, 3, 4, 3}
   elseif t == 15 then
     valf = {1, 2, 1, 3, 5, 4}
   elseif t == 16 then
     valf = {1, 1, 4, 4, 1, 4}
   elseif t == 17 then
     valf = {1, 4, 3, 4, 2, 2}
   elseif t == 18 then
     valf = {1, 3, 1, 4, 3, 1}
   elseif t == 19 then
     valf = {1, 2, 2, 4, 4, 4}
   elseif t == 20 then
     valf = {1, 3, 2, 4, 5, 3}
   elseif t == 21 then
     valf = {1, 4, 1, 5, 1, 2}
   elseif t == 22 then
     valf = {1, 2, 4, 5, 2, 1}
   elseif t == 23 then
     valf = {1, 1, 4, 5, 3, 3}
   elseif t == 24 then
     valf = {1, 3, 3, 5, 4, 4}
   elseif t == 25 then
     valf = {1, 4, 2, 5, 5, 1}
   elseif t == 26 then
     valf = {2, 3, 3, 1, 1, 1}
   elseif t == 27 then
     valf = {2, 1, 2, 1, 2, 1}
   elseif t == 28 then
     valf = {2, 2, 1, 1, 3, 3}
   elseif t == 29 then
     valf = {2, 4, 4, 1, 4, 2}
   elseif t == 30 then
     valf = {2, 1, 1, 1, 5, 4}
   elseif t == 31 then
     valf = {2, 4, 1, 2, 1, 1}
   elseif t == 32 then
     valf = {2, 3, 2, 2, 2, 2}
   elseif t == 33 then
     valf = {2, 2, 3, 2, 3, 3}
   elseif t == 34 then
     valf = {2, 1, 4, 2, 4, 4}
   elseif t == 35 then
     valf = {2, 2, 4, 2, 5, 3}
   elseif t == 36 then
     valf = {2, 3, 3, 3, 1, 4}
   elseif t == 37 then
     valf = {2, 4, 4, 3, 2, 3}
   elseif t == 38 then
     valf = {2, 1, 1, 3, 3, 2}
   elseif t == 39 then
     valf = {2, 2, 2, 3, 4, 1}
   elseif t == 40 then
     valf = {2, 1, 2, 3, 5, 4}
   elseif t == 41 then
     valf = {2, 2, 4, 4, 1, 2}
   elseif t == 42 then
     valf = {2, 1, 3, 4, 2, 1}
   elseif t == 43 then
     valf = {2, 4, 2, 4, 3, 4}
   elseif t == 44 then
     valf = {2, 3, 1, 4, 4, 3}
   elseif t == 45 then
     valf = {2, 4, 2, 4, 5, 2}
   elseif t == 46 then
     valf = {2, 1, 2, 5, 1, 3}
   elseif t == 47 then
     valf = {2, 2, 1, 5, 2, 4}
   elseif t == 48 then
     valf = {2, 3, 4, 5, 3, 1}
   elseif t == 49 then
     valf = {2, 4, 3, 5, 4, 2}
   elseif t == 50 then
     valf = {2, 3, 3, 5, 5, 1}
   elseif t == 51 then
     valf = {3, 2, 2, 1, 1, 2}
   elseif t == 52 then
     valf = {3, 4, 1, 1, 2, 3}
   elseif t == 53 then
     valf = {3, 1, 4, 1, 3, 3}
   elseif t == 54 then
     valf = {3, 3, 1, 1, 4, 4}
   elseif t == 55 then
     valf = {3, 2, 3, 1, 5, 1}
   elseif t == 56 then
     valf = {3, 3, 4, 2, 1, 3}
   elseif t == 57 then
     valf = {3, 4, 3, 2, 2, 4}
   elseif t == 58 then
     valf = {3, 1, 2, 2, 3, 1}
   elseif t == 59 then
     valf = {3, 2, 1, 2, 4, 2}
   elseif t == 60 then
     valf = {3, 1, 2, 2, 5, 1}
   elseif t == 61 then
     valf = {3, 4, 2, 3, 1, 2}
   elseif t == 62 then
     valf = {3, 3, 1, 3, 2, 1}
   elseif t == 63 then
     valf = {3, 2, 4, 3, 3, 4}
   elseif t == 64 then
     valf = {3, 1, 3, 3, 4, 3}
   elseif t == 65 then
     valf = {3, 4, 4, 3, 5, 2}
   elseif t == 66 then
     valf = {3, 1, 1, 4, 1, 4}
   elseif t == 67 then
     valf = {3, 2, 2, 4, 2, 3}
   elseif t == 68 then
     valf = {3, 3, 3, 4, 3, 2}
   elseif t == 69 then
     valf = {3, 4, 4, 4, 4, 1}
   elseif t == 70 then
     valf = {3, 3, 3, 4, 5, 4}
   elseif t == 71 then
     valf = {3, 2, 3, 5, 1, 1}
   elseif t == 72 then
     valf = {3, 1, 4, 5, 2, 2}
   elseif t == 73 then
     valf = {3, 4, 1, 5, 3, 3}
   elseif t == 74 then
     valf = {3, 3, 2, 5, 4, 4}
   elseif t == 75 then
     valf = {3, 4, 1, 5, 5, 3}
   elseif t == 76 then
     valf = {4, 2, 4, 1, 1, 4}
   elseif t == 77 then
     valf = {4, 1, 3, 1, 2, 4}
   elseif t == 78 then
     valf = {4, 4, 3, 1, 3, 1}
   elseif t == 79 then
     valf = {4, 2, 2, 1, 4, 3}
   elseif t == 80 then
     valf = {4, 3, 1, 1, 5, 2}
   elseif t == 81 then
     valf = {4, 2, 2, 2, 1, 4}
   elseif t == 82 then
     valf = {4, 1, 1, 2, 2, 3}
   elseif t == 83 then
     valf = {4, 4, 4, 2, 3, 2}
   elseif t == 84 then
     valf = {4, 3, 3, 2, 4, 1}
   elseif t == 85 then
     valf = {4, 4, 1, 2, 5, 4}
   elseif t == 86 then
     valf = {4, 1, 4, 3, 1, 1}
   elseif t == 87 then
     valf = {4, 2, 3, 3, 2, 2}
   elseif t == 88 then
     valf = {4, 3, 2, 3, 3, 3}
   elseif t == 89 then
     valf = {4, 4, 1, 3, 4, 4}
   elseif t == 90 then
     valf = {4, 1, 3, 3, 5, 3}
   elseif t == 91 then
     valf = {4, 4, 3, 4, 1, 3}
   elseif t == 92 then
     valf = {4, 3, 4, 4, 2, 4}
   elseif t == 93 then
     valf = {4, 2, 1, 4, 3, 1}
   elseif t == 94 then
     valf = {4, 1, 2, 4, 4, 2}
   elseif t == 95 then
     valf = {4, 2, 2, 4, 5, 1}
   elseif t == 96 then
     valf = {4, 3, 1, 5, 1, 2}
   elseif t == 97 then
     valf = {4, 4, 2, 5, 2, 1}
   elseif t == 98 then
     valf = {4, 1, 3, 5, 3, 4}
   elseif t == 99 then
     valf = {4, 2, 4, 5, 4, 3}
   elseif t == 100 then
     valf = {4, 1, 4, 5, 5, 2}
   elseif t == 101 then
     valf = {5, 1, 1, 1, 1, 2}
   elseif t == 102 then
     valf = {5, 2, 4, 1, 2, 1}
   elseif t == 103 then
     valf = {5, 3, 2, 1, 3, 3}
   elseif t == 104 then
     valf = {5, 1, 3, 1, 4, 2}
   elseif t == 105 then
     valf = {5, 4, 2, 1, 5, 4}
   elseif t == 106 then
     valf = {5, 1, 3, 2, 1, 2}
   elseif t == 107 then
     valf = {5, 2, 4, 2, 2, 1}
   elseif t == 108 then
     valf = {5, 3, 1, 2, 3, 4}
   elseif t == 109 then
     valf = {5, 4, 2, 2, 4, 3}
   elseif t == 110 then
     valf = {5, 3, 3, 2, 5, 2}
   elseif t == 111 then
     valf = {5, 2, 1, 3, 1, 3}
   elseif t == 112 then
     valf = {5, 1, 2, 3, 2, 4}
   elseif t == 113 then
     valf = {5, 4, 3, 3, 3, 1}
   elseif t == 114 then
     valf = {5, 3, 4, 3, 4, 2}
   elseif t == 115 then
     valf = {5, 3, 4, 3, 5, 1}
   elseif t == 116 then
     valf = {5, 3, 2, 4, 1, 1}
   elseif t == 117 then
     valf = {5, 4, 1, 4, 2, 2}
   elseif t == 118 then
     valf = {5, 1, 4, 4, 3, 3}
   elseif t == 119 then
     valf = {5, 2, 3, 4, 4, 4}
   elseif t == 120 then
     valf = {5, 1, 4, 4, 5, 3}
   end

   return valf
end

function sel_values(i)
   
   local wilf = {2228, 1000, 1750, 2500, 3000}
   local oinf = {47.6, 20, 40, 100}
   local ooutf = {33.6, 15, 30, 100}
   local evratef = {3.75, 3.0, 5.0, 8.0, 10.0}
   local prratef = {0.667, 0.5, 0.3, 7.5, 15.0}
   local surff = {39, 20, 50, 100}
     
     
   return wilf[i[1]], oinf[i[2]], ooutf[i[3]], evratef[i[4]], prratef[i[5]], surff[i[6]]
end


MonoLake = Model{
	waterInLake = 2228,
	finalTime = 2040,
	otherIn = 47.6,
	otherOut = 33.6,
    evaporationRate = 3.75,
	export = 100,
	precipitationRate = 0.667, 
	sierraGaugedRunoff = 150,
	surfaceArea = 39,
	evaporation = function(self)
		return self.surfaceArea * self.evaporationRate
	end,
	precipitation = function(self)
		return self.surfaceArea * self.precipitationRate
	end,
	flowPastDiversionPoints = function(self)
		return self.sierraGaugedRunoff - self.export
	end,
	
	-- Mutation 1: AOR1 (+ => -)
	-- + self:precipitation()
	execute = function(self)
		self.waterInLake = self.waterInLake
			+ self:flowPastDiversionPoints()
			+ self.otherIn
			- self:precipitation()
			- self.otherOut
			- self:evaporation()

        -- Mutation 2: ROR4 (<= => ==)
        -- if self.waterInLake <= 0 then
		if self.waterInLake == 0 then
			self.waterInLake = 0
		end
	end,
	init = function(self)
		self.chart1 = Chart{
			target = self,
			select = {"waterInLake"}
		}

		--self.chart2 = Chart{
		--	target = self,
		--	select = {"evaporation", "flowPastDiversionPoints"}
		--}

		self.timer = Timer{
			Event{start = 1990, action = self.chart1},
			--Event{start = 1990, action = self.chart2},
			Event{start = 1991, action = self}
		}
	end
}



for i=1,120 do
 
  
  
  local value = "D"
  wilv, oinv, ooutv, evratev, prratev, surfv = 0, 0.0, 0.0, 0.0, 0.0, 0
  
  arr = {}
  arr = get_tuple(i)
  wilv, oinv, ooutv, evratev, prratev, surfv = sel_values(arr)
   
  
  
  scene = MonoLake{
    waterInLake = wilv,
	finalTime = 2040,
	otherIn = oinv,
	otherOut = ooutv,
    evaporationRate = evratev,
	export = 100,
	precipitationRate = prratev, 
	sierraGaugedRunoff = 150,
	surfaceArea = surfv
  }
  
  scene:run() 

  scene.chart1:save("MonoLake_mutant_" .. value .. i .. ".png") 
  
  
  		
end