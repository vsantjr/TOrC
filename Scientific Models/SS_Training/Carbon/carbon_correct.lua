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
     valf = {1, 1, 5, 4, 1, 1, 2}
   elseif t == 2 then
     valf = {1, 1, 4, 2, 2, 5, 4}
   elseif t == 3 then
     valf = {1, 1, 1, 5, 3, 5, 1}
   elseif t == 4 then
     valf = {1, 1, 4, 4, 4, 4, 1}
   elseif t == 5 then
     valf = {1, 1, 3, 3, 5, 3, 5}
   elseif t == 6 then
     valf = {1, 1, 2, 1, 6, 5, 1}
   elseif t == 7 then
     valf = {1, 1, 4, 1, 7, 2, 3}
   elseif t == 8 then
     valf = {1, 2, 2, 5, 1, 4, 5}
   elseif t == 9 then
     valf = {1, 2, 3, 5, 2, 3, 4}
   elseif t == 10 then
     valf = {1, 2, 2, 3, 3, 1, 1}
   elseif t == 11 then
     valf = {1, 2, 2, 2, 4, 4, 3}
   elseif t == 12 then
     valf = {1, 2, 4, 4, 5, 5, 4}
   elseif t == 13 then
     valf = {1, 2, 5, 4, 6, 2, 3}
   elseif t == 14 then
     valf = {1, 2, 1, 4, 7, 5, 2}
   elseif t == 15 then
     valf = {1, 3, 3, 2, 1, 5, 1}
   elseif t == 16 then
     valf = {1, 3, 1, 1, 2, 5, 5}
   elseif t == 17 then
     valf = {1, 3, 3, 4, 3, 4, 3}
   elseif t == 18 then
     valf = {1, 3, 1, 5, 4, 2, 2}
   elseif t == 19 then
     valf = {1, 3, 5, 4, 5, 3, 3}
   elseif t == 20 then
     valf = {1, 3, 4, 3, 6, 5, 5}
   elseif t == 21 then
     valf = {1, 3, 2, 2, 7, 1, 4}
   elseif t == 22 then
     valf = {1, 4, 4, 3, 1, 4, 1}
   elseif t == 23 then
     valf = {1, 4, 3, 4, 2, 5, 2}
   elseif t == 24 then
     valf = {1, 4, 4, 5, 3, 2, 5}
   elseif t == 25 then
     valf = {1, 4, 5, 1, 4, 2, 4}
   elseif t == 26 then
     valf = {1, 4, 1, 1, 5, 1, 2}
   elseif t == 27 then
     valf = {1, 4, 5, 2, 6, 3, 5}
   elseif t == 28 then
     valf = {1, 4, 2, 3, 7, 5, 3}
   elseif t == 29 then
     valf = {1, 5, 1, 1, 1, 3, 3}
   elseif t == 30 then
     valf = {1, 5, 2, 3, 2, 2, 3}
   elseif t == 31 then
     valf = {1, 5, 5, 1, 3, 1, 2}
   elseif t == 32 then
     valf = {1, 5, 4, 3, 4, 1, 1}
   elseif t == 33 then
     valf = {1, 5, 2, 4, 5, 1, 5}
   elseif t == 34 then
     valf = {1, 5, 3, 5, 6, 1, 3}
   elseif t == 35 then
     valf = {1, 5, 3, 1, 7, 4, 4}
   elseif t == 36 then
     valf = {1, 6, 1, 5, 1, 4, 3}
   elseif t == 37 then
     valf = {1, 6, 5, 1, 2, 4, 1}
   elseif t == 38 then
     valf = {1, 6, 2, 2, 3, 5, 5}
   elseif t == 39 then
     valf = {1, 6, 3, 1, 4, 2, 5}
   elseif t == 40 then
     valf = {1, 6, 1, 5, 5, 4, 4}
   elseif t == 41 then
     valf = {1, 6, 1, 3, 6, 1, 4}
   elseif t == 42 then
     valf = {1, 6, 4, 4, 7, 3, 1}
   elseif t == 43 then
     valf = {1, 7, 5, 3, 1, 2, 2}
   elseif t == 44 then
     valf = {1, 7, 4, 2, 2, 1, 3}
   elseif t == 45 then
     valf = {1, 7, 3, 1, 3, 3, 4}
   elseif t == 46 then
     valf = {1, 7, 2, 3, 4, 3, 2}
   elseif t == 47 then
     valf = {1, 7, 1, 2, 5, 2, 1}
   elseif t == 48 then
     valf = {1, 7, 4, 4, 6, 4, 2}
   elseif t == 49 then
     valf = {1, 7, 5, 5, 7, 5, 5}
   elseif t == 50 then
     valf = {2, 1, 4, 5, 1, 5, 1}
   elseif t == 51 then
     valf = {2, 1, 1, 4, 2, 4, 3}
   elseif t == 52 then
     valf = {2, 1, 1, 3, 3, 1, 4}
   elseif t == 53 then
     valf = {2, 1, 3, 2, 4, 2, 2}
   elseif t == 54 then
     valf = {2, 1, 2, 5, 5, 1, 4}
   elseif t == 55 then
     valf = {2, 1, 5, 4, 6, 4, 5}
   elseif t == 56 then
     valf = {2, 1, 5, 1, 7, 3, 2}
   elseif t == 57 then
     valf = {2, 2, 3, 2, 1, 1, 5}
   elseif t == 58 then
     valf = {2, 2, 1, 1, 2, 2, 4}
   elseif t == 59 then
     valf = {2, 2, 3, 4, 3, 3, 2}
   elseif t == 60 then
     valf = {2, 2, 4, 3, 4, 5, 2}
   elseif t == 61 then
     valf = {2, 2, 5, 2, 5, 3, 3}
   elseif t == 62 then
     valf = {2, 2, 1, 2, 6, 2, 1}
   elseif t == 63 then
     valf = {2, 2, 2, 5, 7, 4, 3}
   elseif t == 64 then
     valf = {2, 3, 2, 1, 1, 4, 4}
   elseif t == 65 then
     valf = {2, 3, 2, 5, 2, 3, 3}
   elseif t == 66 then
     valf = {2, 3, 3, 2, 3, 4, 2}
   elseif t == 67 then
     valf = {2, 3, 5, 5, 4, 1, 5}
   elseif t == 68 then
     valf = {2, 3, 4, 4, 5, 4, 1}
   elseif t == 69 then
     valf = {2, 3, 3, 3, 6, 2, 3}
   elseif t == 70 then
     valf = {2, 3, 1, 2, 7, 5, 3}
   elseif t == 71 then
     valf = {2, 4, 1, 4, 1, 1, 3}
   elseif t == 72 then
     valf = {2, 4, 4, 2, 2, 2, 1}
   elseif t == 73 then
     valf = {2, 4, 5, 4, 3, 5, 4}
   elseif t == 74 then
     valf = {2, 4, 2, 1, 4, 5, 1}
   elseif t == 75 then
     valf = {2, 4, 3, 3, 5, 3, 4}
   elseif t == 76 then
     valf = {2, 4, 2, 5, 6, 4, 2}
   elseif t == 77 then
     valf = {2, 4, 3, 1, 7, 5, 5}
   elseif t == 78 then
     valf = {2, 5, 2, 3, 1, 1, 1}
   elseif t == 79 then
     valf = {2, 5, 5, 3, 2, 4, 5}
   elseif t == 80 then
     valf = {2, 5, 4, 1, 3, 5, 3}
   elseif t == 81 then
     valf = {2, 5, 1, 2, 4, 3, 4}
   elseif t == 82 then
     valf = {2, 5, 1, 5, 5, 2, 2}
   elseif t == 83 then
     valf = {2, 5, 3, 2, 6, 5, 4}
   elseif t == 84 then
     valf = {2, 5, 2, 4, 7, 2, 1}
   elseif t == 85 then
     valf = {2, 6, 5, 1, 1, 5, 2}
   elseif t == 86 then
     valf = {2, 6, 2, 3, 2, 5, 1}
   elseif t == 87 then
     valf = {2, 6, 3, 5, 3, 1, 1}
   elseif t == 88 then
     valf = {2, 6, 4, 4, 4, 4, 4}
   elseif t == 89 then
     valf = {2, 6, 1, 1, 5, 3, 5}
   elseif t == 90 then
     valf = {2, 6, 4, 1, 6, 1, 2}
   elseif t == 91 then
     valf = {2, 6, 5, 2, 7, 2, 1}
   elseif t == 92 then
     valf = {2, 7, 4, 2, 1, 3, 5}
   elseif t == 93 then
     valf = {2, 7, 3, 1, 2, 2, 1}
   elseif t == 94 then
     valf = {2, 7, 2, 2, 3, 2, 5}
   elseif t == 95 then
     valf = {2, 7, 1, 5, 4, 2, 3}
   elseif t == 96 then
     valf = {2, 7, 1, 4, 5, 5, 1}
   elseif t == 97 then
     valf = {2, 7, 5, 3, 6, 3, 1}
   elseif t == 98 then
     valf = {2, 7, 4, 3, 7, 4, 4}
   elseif t == 99 then
     valf = {3, 1, 2, 3, 1, 4, 2}
   elseif t == 100 then
     valf = {3, 1, 1, 1, 2, 3, 1}
   elseif t == 101 then
     valf = {3, 1, 3, 4, 3, 5, 5}
   elseif t == 102 then
     valf = {3, 1, 2, 5, 4, 2, 3}
   elseif t == 103 then
     valf = {3, 1, 4, 4, 5, 3, 3}
   elseif t == 104 then
     valf = {3, 1, 4, 2, 6, 1, 3}
   elseif t == 105 then
     valf = {3, 1, 1, 5, 7, 2, 4}
   elseif t == 106 then
     valf = {3, 2, 4, 4, 1, 5, 3}
   elseif t == 107 then
     valf = {3, 2, 2, 4, 2, 1, 2}
   elseif t == 108 then
     valf = {3, 2, 4, 2, 3, 4, 4}
   elseif t == 109 then
     valf = {3, 2, 5, 5, 4, 3, 2}
   elseif t == 110 then
     valf = {3, 2, 1, 5, 5, 2, 5}
   elseif t == 111 then
     valf = {3, 2, 2, 1, 6, 3, 5}
   elseif t == 112 then
     valf = {3, 2, 3, 3, 7, 4, 1}
   elseif t == 113 then
     valf = {3, 3, 3, 5, 1, 1, 5}
   elseif t == 114 then
     valf = {3, 3, 5, 3, 2, 1, 2}
   elseif t == 115 then
     valf = {3, 3, 5, 5, 3, 4, 1}
   elseif t == 116 then
     valf = {3, 3, 4, 1, 4, 4, 3}
   elseif t == 117 then
     valf = {3, 3, 2, 1, 5, 5, 4}
   elseif t == 118 then
     valf = {3, 3, 1, 5, 6, 4, 4}
   elseif t == 119 then
     valf = {3, 3, 2, 4, 7, 2, 5}
   elseif t == 120 then
     valf = {3, 4, 4, 1, 1, 5, 2}
   end

   return valf
end



function sel_values(i)
   
   atm = {877, 500, 700, 800, 1000, 1200}
   tbios = {145, 75, 100, 125, 175, 200, 225}
   doce = {1000, 500, 750, 1250, 1500}
   sofe = {5468, 2000, 4000, 8000, 10000}
   soil = {8777, 3000, 5000, 7000, 11000, 13000, 15000}
   ffuel = {1, 2, 3, 4, 5}
   defor = {3, 1, 2, 4, 5}
   
  
     
   return atm[i[1]], tbios[i[2]], doce[i[3]], sofe[i[4]], soil[i[5]], ffuel[i[6]], defor[i[7]]
end

 


carbon = Model{

finalTime = 50,
stepTime = 0.43,
ATMOSPHERE = 877,
TerrestrialBiosphere = 145,
DeepOcean = 1000,
SurfaceOcean = 5468,
SoilCarbonandDetritus = 8777,
FossilFuelBurning = 1,
Deforestation = 3,

    execute = function(self)
    
        self.ATMOSPHERE = self.ATMOSPHERE + (self.OceanDegassing + self.Respiration + self.Decay + self.FossilFuelBurning + self.Deforestation - self.OceanUptake - self.Photosynthesis)*self.stepTime
        self.SurfaceOcean = self.SurfaceOcean + (self.OceanUptake + self.Upwelling - self.OceanDegassing - self.Downwelling - self.Biopump)*self.stepTime
        self.DeepOcean = self.DeepOcean + (self.Downwelling + self.Biopump - self.Upwelling)*self.stepTime
        self.TerrestrialBiosphere = self.TerrestrialBiosphere + (self.Photosynthesis - self.Respiration - self.Death - self.Deforestation)*self.stepTime
        self.SoilCarbonandDetritus = self.SoilCarbonandDetritus + (self.Death - self.Decay)*self.stepTime
        self.OceanUptake = self.ATMOSPHERE/20
        self.Upwelling = self.DeepOcean*0.002
        self.Downwelling = self.SurfaceOcean*0.002
        self.Biopump = 6.76+(self.SurfaceOcean/700)
        self.OceanDegassing = self.SurfaceOcean/20
        self.Season = 1+(math.cos(2*math.pi*(self.timer:getTime()+0.125)))
        self.Respiration = self.TerrestrialBiosphere*0.1*self.Season
        self.Photosynthesis = ((self.TerrestrialBiosphere*0.1483)+(self.ATMOSPHERE/700))*self.Season
        self.Death = 0.05/self.TerrestrialBiosphere
        self.Decay = (0.021*self.SoilCarbonandDetritus)+(self.ATMOSPHERE/750)
        self.AtmCO2 = self.ATMOSPHERE*2
        --if (self.timer:getTime())%10 == 0 then
           --print("\t"..self.AtmCO2) 
        --end

    end,
    init = function(self)
        self.OceanUptake = self.ATMOSPHERE/20
        self.Upwelling = self.DeepOcean*0.002
        self.Downwelling = self.SurfaceOcean*0.002
        self.Biopump = 6.76+(self.SurfaceOcean/700)
        self.OceanDegassing = self.SurfaceOcean/20
        self.Season = 1+(math.cos(2*math.pi*(0.125)))
        self.Respiration = self.TerrestrialBiosphere*0.1*self.Season
        self.Photosynthesis = ((self.TerrestrialBiosphere*0.1483)+(self.ATMOSPHERE/700))*self.Season
        self.Death = 0.05*self.TerrestrialBiosphere
        self.Decay = (0.021*self.SoilCarbonandDetritus)+(self.ATMOSPHERE/750)
        self.AtmCO2 = self.ATMOSPHERE/2
        
        --self.chart = Chart{target = self, 
          --  select = "AtmCO2", 
            --color = "blue",
            --title = "Carbon Cycle Model", 
            --yLabel = "Atmospheric CO2"}
        
        self.chart2 = Chart{target = self, 
            select = {"Photosynthesis","Respiration","SurfaceOcean","TerrestrialBiosphere"},
            title = "Carbon Cycle Model", 
            yLabel = "  "}
        
        self.timer = Timer{
            Event{start = 0, action = self, priority = 'high', period = self.stepTime},
           -- Event{action = self.chart, period = self.stepTime},
            Event{action = self.chart2, period = self.stepTime},
            Event{start = self.finalTime, action = function()
               -- self.chart:save("scn1_im.bmp")
			end},


        }           
    end

}


--for i=1,30 do
--scene = carbon{}
--scene:run()
--scene.chart2:save("/Users/leoni/Documents/Modelos_mutantes/versao3/carbon/mutant3/A/carbon_" .. i .. ".png")
--end


for i=1,120 do
 
  
  -- A
  local value = "A"
  at, tb, doc, soc, soi, ff, defo = 0, 0, 0, 0, 0, 0, 0, 0
  
  arr = {}
  arr = get_tuple(i)
  at, tb, doc, soc, soi, ff, defo = sel_values(arr)
  scene = carbon{finalTime = 50,
          stepTime = 0.43,
          ATMOSPHERE = at,
          TerrestrialBiosphere = tb,
          DeepOcean = doc,
          SurfaceOcean = soc,
          SoilCarbonandDetritus = soi,
          FossilFuelBurning = ff,
          Deforestation = defo
  }
  
  scene:run() 

     scene.chart2:save("Carbon_correct_" .. value .. i .. ".png") 
  
  		
end
--scn1 = carbon{ATMOSPHERE = 650, 
--                TerrestrialBiosphere = 500, 
--                DeepOcean = 30000, 
--                SurfaceOcean = 650, 
--                SoilCarbonandDetritus = 1000, 
--                FossilFuelBurning = 4,
--                Deforestation = 1.5}
--scn1:run()
            



--http://www.shodor.org/master/environmental/general/carbon/carboncs.html
--http://www.shodor.org/master/environmental/general/carbon/carbeq.html    
--Atmospheric Cycles: Simplified Carbon Cycle

