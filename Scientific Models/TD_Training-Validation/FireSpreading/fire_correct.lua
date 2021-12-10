--Random {seed=1234567}

--[[
***the probability D, that represents the heterogeneity of fuel conditions along the lattice and determines the proportion of cells with vegetation across the lattice. Thus, for each cell in t = 0, there is a probability D for its state to be vegetation cell and the probability 1 − D to it is empty cell;
****the probability B, that models the combustion process, where, in each time step, a burning cell has a probability B to change its state to burnt cell;
*****the probability I, that models the ignition process, where, there is a probability I for the fire spreads from a burning cell to a neighboring vegetation cell


TTR: 

Strength = 2
Total = 120


FindBestImages:

limit = 0.85

Simulation Time

50

--]]
--

function get_tuple(t)
   local valf = {}
   if t == 1 then
     valf = {1, 1, 10}
   elseif t == 2 then
     valf = {1, 2, 9}
   elseif t == 3 then
     valf = {1, 3, 8}
   elseif t == 4 then
     valf = {1, 4, 7}
   elseif t == 5 then
     valf = {1, 5, 6}
   elseif t == 6 then
     valf = {1, 6, 5}
   elseif t == 7 then
     valf = {1, 7, 4}
   elseif t == 8 then
     valf = {1, 8, 3}
   elseif t == 9 then
     valf = {1, 9, 2}
   elseif t == 10 then
     valf = {1, 10, 1}
   elseif t == 11 then
     valf = {1, 11, 11}
   elseif t == 12 then
     valf = {2, 1, 9}
   elseif t == 13 then
     valf = {2, 2, 8}
   elseif t == 14 then
     valf = {2, 3, 7}
   elseif t == 15 then
     valf = {2, 4, 6}
   elseif t == 16 then
     valf = {2, 5, 5}
   elseif t == 17 then
     valf = {2, 6, 4}
   elseif t == 18 then
     valf = {2, 7, 3}
   elseif t == 19 then
     valf = {2, 8, 2}
   elseif t == 20 then
     valf = {2, 9, 1}
   elseif t == 21 then
     valf = {2, 10, 11}
   elseif t == 22 then
     valf = {2, 11, 10}
   elseif t == 23 then
     valf = {3, 1, 8}
   elseif t == 24 then
     valf = {3, 2, 7}
   elseif t == 25 then
     valf = {3, 3, 6}
   elseif t == 26 then
     valf = {3, 4, 5}
   elseif t == 27 then
     valf = {3, 5, 4}
   elseif t == 28 then
     valf = {3, 6, 3}
   elseif t == 29 then
     valf = {3, 7, 2}
   elseif t == 30 then
     valf = {3, 8, 1}
   elseif t == 31 then
     valf = {3, 9, 11}
   elseif t == 32 then
     valf = {3, 10, 10}
   elseif t == 33 then
     valf = {3, 11, 9}
   elseif t == 34 then
     valf = {4, 1, 7}
   elseif t == 35 then
     valf = {4, 2, 6}
   elseif t == 36 then
     valf = {4, 3, 5}
   elseif t == 37 then
     valf = {4, 4, 4}
   elseif t == 38 then
     valf = {4, 5, 3}
   elseif t == 39 then
     valf = {4, 6, 2}
   elseif t == 40 then
     valf = {4, 7, 1}
   elseif t == 41 then
     valf = {4, 8, 11}
   elseif t == 42 then
     valf = {4, 9, 10}
   elseif t == 43 then
     valf = {4, 10, 9}
   elseif t == 44 then
     valf = {4, 11, 8}
   elseif t == 45 then
     valf = {5, 1, 6}
   elseif t == 46 then
     valf = {5, 2, 5}
   elseif t == 47 then
     valf = {5, 3, 4}
   elseif t == 48 then
     valf = {5, 4, 3}
   elseif t == 49 then
     valf = {5, 5, 2}
   elseif t == 50 then
     valf = {5, 6, 1}
   elseif t == 51 then
     valf = {5, 7, 11}
   elseif t == 52 then
     valf = {5, 8, 10}
   elseif t == 53 then
     valf = {5, 9, 9}
   elseif t == 54 then
     valf = {5, 10, 8}
   elseif t == 55 then
     valf = {5, 11, 7}
   elseif t == 56 then
     valf = {6, 1, 5}
   elseif t == 57 then
     valf = {6, 2, 4}
   elseif t == 58 then
     valf = {6, 3, 3}
   elseif t == 59 then
     valf = {6, 4, 2}
   elseif t == 60 then
     valf = {6, 5, 1}
   elseif t == 61 then
     valf = {6, 6, 11}
   elseif t == 62 then
     valf = {6, 7, 10}
   elseif t == 63 then
     valf = {6, 8, 9}
   elseif t == 64 then
     valf = {6, 9, 8}
   elseif t == 65 then
     valf = {6, 10, 7}
   elseif t == 66 then
     valf = {6, 11, 6}
   elseif t == 67 then
     valf = {7, 1, 4}
   elseif t == 68 then
     valf = {7, 2, 3}
   elseif t == 69 then
     valf = {7, 3, 2}
   elseif t == 70 then
     valf = {7, 4, 1}
   elseif t == 71 then
     valf = {7, 5, 11}
   elseif t == 72 then
     valf = {7, 6, 10}
   elseif t == 73 then
     valf = {7, 7, 9}
   elseif t == 74 then
     valf = {7, 8, 8}
   elseif t == 75 then
     valf = {7, 9, 7}
   elseif t == 76 then
     valf = {7, 10, 6}
   elseif t == 77 then
     valf = {7, 11, 5}
   elseif t == 78 then
     valf = {8, 1, 3}
   elseif t == 79 then
     valf = {8, 2, 2}
   elseif t == 80 then
     valf = {8, 3, 1}
   elseif t == 81 then
     valf = {8, 4, 11}
   elseif t == 82 then
     valf = {8, 5, 10}
   elseif t == 83 then
     valf = {8, 6, 9}
   elseif t == 84 then
     valf = {8, 7, 8}
   elseif t == 85 then
     valf = {8, 8, 7}
   elseif t == 86 then
     valf = {8, 9, 6}
   elseif t == 87 then
     valf = {8, 10, 5}
   elseif t == 88 then
     valf = {8, 11, 4}
   elseif t == 89 then
     valf = {9, 1, 2}
   elseif t == 90 then
     valf = {9, 2, 1}
   elseif t == 91 then
     valf = {9, 3, 11}
   elseif t == 92 then
     valf = {9, 4, 10}
   elseif t == 93 then
     valf = {9, 5, 9}
   elseif t == 94 then
     valf = {9, 6, 8}
   elseif t == 95 then
     valf = {9, 7, 7}
   elseif t == 96 then
     valf = {9, 8, 6}
   elseif t == 97 then
     valf = {9, 9, 5}
   elseif t == 98 then
     valf = {9, 10, 4}
   elseif t == 99 then
     valf = {9, 11, 3}
   elseif t == 100 then
     valf = {10, 1, 1}
   elseif t == 101 then
     valf = {10, 2, 11}
   elseif t == 102 then
     valf = {10, 3, 10}
   elseif t == 103 then
     valf = {10, 4, 9}
   elseif t == 104 then
     valf = {10, 5, 8}
   elseif t == 105 then
     valf = {10, 6, 7}
   elseif t == 106 then
     valf = {10, 7, 6}
   elseif t == 107 then
     valf = {10, 8, 5}
   elseif t == 108 then
     valf = {10, 9, 4}
   elseif t == 109 then
     valf = {10, 10, 3}
   elseif t == 110 then
     valf = {10, 11, 2}
   elseif t == 111 then
     valf = {11, 1, 11}
   elseif t == 112 then
     valf = {11, 2, 10}
   elseif t == 113 then
     valf = {11, 3, 9}
   elseif t == 114 then
     valf = {11, 4, 8}
   elseif t == 115 then
     valf = {11, 5, 7}
   elseif t == 116 then
     valf = {11, 6, 6}
   elseif t == 117 then
     valf = {11, 7, 5}
   elseif t == 118 then
     valf = {11, 8, 4}
   elseif t == 119 then
     valf = {11, 9, 3}
   elseif t == 120 then
     valf = {11, 10, 2}
   end

   return valf
end


function sel_values(i)
   
   dv = {0.1, 0.0, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}
   bv = {0.1, 0.0, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}
   iv = {0.1, 0.0, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}
  
  
      
   return dv[i[1]], bv[i[2]], iv[i[3]]
end


bcell=CellularSpace{ -- Monte Carlo
	xdim=201, }
forEachCell(bcell, function(cell)
		cell.state=0
	end )

Fire = Model {
	dim         = 50,
	finalTime   = 50,
	d=0.1,
	b=0.4,
	i=0.4,
	init = function(model)
		model.cell = Cell{
			state = Random{forest=model.d,empty= 1-model.d},
			execute = function(cell)
				if cell.state == "forest" then
					forEachNeighbor(cell, function(neighbor)
							if neighbor.past.state == "burning" then
								if Random():number()< model.i then
									cell.state = "burning"
								end
							end
						end)

				elseif cell.state ~= "burning" then
					if Random():number()< model.b then
						cell.state = "burned"
						bcell:get(cell.x,cell.y).state =bcell:get(cell.x,cell.y).state-1
						--Monte Carlo
					end
				end
			end
		}


		model.cs = CellularSpace{
			xdim = model.dim,
			instance = model.cell
		}


		model.cs:createNeighborhood{strategy = "moore"}
		model.cs:get(10,10).state = "burning"

		model.map = Map{
			target = model.cs,
			select = "state",
			value  = {"forest", "burning", "burned","empty"},
			color = {"green", "red", "gray", "black"}
		}



		model.timer = Timer {
			Event{action = model.map},
			Event{action = model.cs}
		}
	end -- fecha init
} -- fecha Model





for i=1,120 do
   
  -- A
  local value = "A"
  dvar, bvar, ivar = 0.0, 0.0, 0.0
   
  arr = {}
  arr = get_tuple(i)
  dvar, bvar, ivar = sel_values(arr)
  scene = Fire{dim = 50,
		finalTime  = 50,
		d=dvar,
		b=bvar,
		i=ivar
  }
  
  scene:run() 

  --if (i >= 1) and (i <= 80) then
  scene.map:save("Fire_correct_" .. value .. i .. ".png")
  --else
    --scene.chart:save("/Users/valdivino/Documents/Des/pythonw/DL/pyTorch/TestOracle/versao4/dlto/val/correct/EnergyBalance_correct_" .. value .. i .. ".png")
  --end
end
--[[
fire.map:save(fire:title()..".png")

forest=function(model)
		return #model.cs:split("state").forest/#model.cs
	end



import("calibration")

mr=MultipleRuns{
	model=Fire,
	repetition=3,
	parameters= {
		d=Choice{min=0.0, max=1, step=0.2},
		--b=Choice{min=0.1, max=1, step=0.1},
		--i=Choice{min=0.1, max=1, step=0.1}

	},
	forest=function(model)
		return #model.cs:split("state").forest/#model.cs
	end,

}
--[[chart=Chart{
	target=mr,
	select="forest",
	label= "average in the end",

	color= "red"
}
chart:save("grafic.png")
file=File("almeida.csv")
file:write(mr.output, ";")--]]

--Fire:run()
--[[Monte Carlo
  map = Map{
			target = bcell,
			select = "state",
			color ={"green","white"},
			min=0,
			max=1000,
			slices=20
		}
map:save("almeida_state.png")--]]