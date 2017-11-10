-- Sticks and Stones Beta mod: gui
-- See README.txt for licensing and other information.
-- Created by maikerumine
-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too

--default = {}
--added musket info here
gui = {}
	
-- Load files
local default_path = minetest.get_modpath("gui")


dofile(default_path.."/creative_init.lua")  	--From crreative:  	Jean-Patrick G. (kilbith) <jeanpatrick.guerrero@gmail.com> (MIT)
dofile(default_path.."/inventory_plus.lua")		--From cornernote:		https://github.com/Zeg9/minetest-inventory_plus


--======================
--======================
--B R O K E N--
--dofile(default_path.."/simple_skins.lua")		--From TenPlus1 and based on Zeg9's code under MIT license
--dofile(default_path.."/craftguide.lua")  	--From craftguide:  	Jean-Patrick G. (kilbith) <jeanpatrick.guerrero@gmail.com> (GPL version 3)  --wonky
--dofile(default_path.."/sfinv_init.lua")  	--From sfinv: 


			
			
minetest.after(15, function()
	print("F O R    S T I C K S  - & -  S T O N E S")
end)

minetest.after(25, function()
	print("Designed and created by:  M A I K E R U M I N E   (c)2017")
end)














