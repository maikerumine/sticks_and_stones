-- Sticks and Stones Beta mod: default
-- See README.txt for licensing and other information.
-- Created by maikerumine
-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too

--sas_core = {}
--added musket info here

sas_core = {
	time = 0,
	objects = {},
	rounds = {},
	shots = {},
	update_time = 0,
	reload_time = 0,
	recipes = {},
	wielded_item = {},
	transform = {},
}

--[[
sas_core.LIGHT_MAX = 14
]]
--===============================

-- GUI related stuff
--[[
sas_core.gui_bg = "bgcolor[#080808BB;true]"
sas_core.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
sas_core.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function sas_core.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

sas_core.gui_survival_form = "size[8,8.5]"..
			sas_core.gui_bg..
			sas_core.gui_bg_img..
			sas_core.gui_slots..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			sas_core.get_hotbar_bg(0,4.25)


]]	
-- Load files
local default_path = minetest.get_modpath("sas_core")


print("L O A D I N G  . . . . . . . . . . . . ")
print("L O A D I N G  A L L   F I L E S . . . ")
print("ALIASES")
--dofile(default_path.."/aliases.lua")
dofile(default_path.."/aliases_plantlife.lua")
	

print("BIOME")
dofile(default_path.."/pl_biomeslib.lua")--From plants_lib.
dofile(default_path.."/functions.lua")
--dofile(default_path.."/builtin_flowlib.lua")	--From Tenplusone and Qwertymine3
--dofile(default_path.."/flowlib.lua")	--From Qwertymine3

dofile(default_path.."/nodes.lua")	--From From default, edited by maikerumine
--dofile(default_path.."/legacy.lua")
--dofile(default_path.."/mapgen.lua")  --From default, edited by maikerumine
--          dofile(default_path.."/dungeon_loot.lua")  --from 
print("SEAPLANTS")
dofile(default_path.."/sea_plants.lua")  --from
--dofile(default_path.."/trees.lua")
dofile(default_path.."/deco_rocks.lua")  --from Duane's Cityscape mod  https://github.com/duane-r/cityscape/tree/original
dofile(default_path.."/trail.lua")  --from Paramat  https://github.com/paramat/trail


--D A R K   A G E--
print("DARKAGE")
dofile(default_path.."/darkage_init.lua")	--From MasterGollum  https://github.com/MasterGollum/darkage/
		--dofile(default_path.."/darkage_building.lua")	--From MasterGollum  https://github.com/MasterGollum/darkage/
		--dofile(default_path.."/darkage_furnature.lua")	--From MasterGollum  https://github.com/MasterGollum/darkage/
		--dofile(default_path.."/darkage_mapgen.lua")	--From MasterGollum  https://github.com/MasterGollum/darkage/
		--dofile(default_path.."/darkage_stairs.lua")	--From MasterGollum  https://github.com/MasterGollum/darkage/

--B L A C K S M I T H   E D I T I O N   M I N E T E S T--
print("BLACKSMITH")
dofile(default_path.."/craftitems.lua")	--From maikerumine
dofile(default_path.."/crafting.lua")	--From maikerumine
dofile(default_path.."/anvil.lua")	--From cottages by Sokomine, edited by maikerumine
dofile(default_path.."/cooking.lua")	--From From default, edited by maikerumine
--      dofile(default_path.."/item_entity.lua")	--From default, edited by maikerumine
print("CRAFTING")
dofile(default_path.."/crafts_wood.lua")	--From maikerumine
dofile(default_path.."/crafts_stone.lua")	--From maikerumine
dofile(default_path.."/crafts_metal_copper.lua")	--From maikerumine
dofile(default_path.."/crafts_metal_iron.lua")	--From maikerumine
dofile(default_path.."/crafts_plants.lua")	--From maikerumine
dofile(default_path.."/crafts_book.lua")	--From default, edited by maikerumine
dofile(default_path.."/crafts_fachwork.lua")	--From JBB  https://sites.google.com/site/jbbsblog/downloads/minetest-downloads	
print("SMELTING AND COOKING")		
dofile(default_path.."/bloomery.lua")	--From crushingfurnace by Casimir, edited by maikerumine  https://github.com/CasimirKaPazi/unternull/tree/master/crushingfurnace
dofile(default_path.."/furnace.lua")	--From crushingfurnace by Casimir, edited by maikerumine  https://github.com/CasimirKaPazi/unternull/tree/master/crushingfurnace
dofile(default_path.."/smelting.lua")	--From maikerumine
dofile(default_path.."/hopper.lua")	--From burli and jordan4ibenez

--T O O L S  A N D   W E A P O N S--
print("TOOLS")
dofile(default_path.."/bows.lua")	--From by: Philipbenr And DanDuncombe
dofile(default_path.."/castle_weapons.lua")	--From by: Philipbenr And DanDuncombe
dofile(default_path.."/gravel_sieve.lua")	--From v0.01 by JoSt, edited by maikerumine  https://github.com/joe7575/Minetest-Gravelsieve
dofile(default_path.."/handholds.lua")  --from Shara RedCat  https://github.com/Ezhh/handholds
dofile(default_path.."/musket.lua")  --from shooter mod  
dofile(default_path.."/torch.lua")
dofile(default_path.."/tools.lua")	--From default, edited be maikerumine


--E X T R A  L I G T W E I G H T--
print("EXTRAS")
dofile(default_path.."/extra.lua")	--From maikerumine
--dofile(default_path.."/food.lua")	--From HUD HUNGER
print(".      ")
dofile(default_path.."/decay.lua")	--From zander999  https://github.com/zander999/decay
print(".					")
--dofile(default_path.."/playeranim_v5.lua")  --from Rui914  https://github.com/minetest-mods/playeranim  --broken for mt5
print("	.				")
dofile(default_path.."/beerarchy_welcome.lua")	--From Beerholder
print("		.			")
--      dofile(default_path.."/walking_light.lua")  --from Echo  https://forum.minetest.net/viewtopic.php?f=11&t=2621&hilit=walking+light
print("			.		")
dofile(default_path.."/ambience.lua")	--From by: TenPlus1  Ambience Lite mod for Minetest
print("				.	")
dofile(default_path.."/death_messages.lua")  --from death_messages - https://github.com/4Evergreen4/death_messages/issues/
print("					.")
dofile(default_path.."/random_messages.lua")  --from random_messages - https://github.com/4Evergreen4/death_messages/issues/
print("					.")
dofile(default_path.."/biblebot.lua")  --from mtbiblebot mod
print("				.	")  
dofile(default_path.."/hudclock.lua")  --from Rochambeau https://github.com/Rochambeau/mthudclock
print("			.		")
dofile(default_path.."/heads.lua")  --from freeminer  thefamilygrog66  https://github.com/thefamilygrog66/heads
print("		.			")
--dofile(default_path.."/sky.lua")  --from  rnd's mymod/sky    simple but not looking the best.
print("	.				")
--      dofile(default_path.."/wieldview.lua")  --from  wieldview
print(".            ")
dofile(default_path.."/toolranks.lua")  --from toolranks
print("			.		")					
--dofile(default_path.."/intersect.lua")  --from  INTERSECT
print("	. . . . . . . . . . .				")


--M I N E T E S T   G A M E   C L A S S I C S--
print("BUCKET, VESSELS, AND XPANES")
dofile(default_path.."/beds.lua")  --from beds
dofile(default_path.."/bucket.lua")  --from bucket
dofile(default_path.."/fire.lua")  --from fire
dofile(default_path.."/vessels.lua")  --from vessels
dofile(default_path.."/xpanes.lua")  --from xpanes

-- F I S H I N G--
print("FISHING")
dofile(default_path.."/fish_init.lua")  --Merged into init  Fishing - Crabman77's version
		--dofile(default_path.."/fish_baitball.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_baits.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_bobber.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_bobber_shark.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_crafting.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_fishes.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_functions.lua")  --Merged into init  Fishing - Crabman77's version
		--dofile(default_path.."/fish_poles.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_prizes.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_trophies.lua")  --from Fishing - Crabman77's version
		--dofile(default_path.."/fish_worms.lua")  --from Fishing - Crabman77's version

--S U R V I V A L   G A M E   A S S E T S--
print("SURVIVAL FOODS")
dofile(default_path.."/survival.lua")  --from survival_game - https://github.com/NathanSalapat/survival

--============
--T I M E R--
--============
--======================
--======================
print("TIME FOR THE LAGGGGGGGGG......")
print("PLANTSLIB")
dofile(default_path.."/pl_plantslib.lua")--From plants_lib.
dofile(default_path.."/settings_reed.txt")--From Plantlife mod, by Vanessa Ezekowitz  --this loads first to eliminate the ferns assertion fail
dofile(default_path.."/settings_fern.lua")--From Plantlife mod, by Vanessa Ezekowitz  --this loads first to eliminate the ferns assertion fail
dofile(default_path.."/pl_cavestuff.lua")  --From Plantlife mod, by Vanessa Ezekowitz	--from cavestuff mod
dofile(default_path.."/pl_woodsoils.lua")--From Plantlife mod, by Vanessa Ezekowitz  --Code by Mossmanikin & Neuromancer
dofile(default_path.."/pl_bushes.lua")--From Plantlife mod, by Vanessa Ezekowitz	-- Bushes Mod by Mossmanikin, Evergreen, & Neuromancer
dofile(default_path.."/pl_bushes_classic.lua")--From Plantlife mod, by Vanessa Ezekowitz
dofile(default_path.."/pl_dryplants.lua")--From Plantlife mod, by Vanessa Ezekowitz	-- by Mossmanikin	-- textures & ideas partly by Neuromancer
dofile(default_path.."/pl_ferns.lua")--From Plantlife mod, by Vanessa Ezekowitz	-- (by Mossmanikin)
dofile(default_path.."/pl_flowers_plus.lua")--From Plantlife mod, by Vanessa Ezekowitz
dofile(default_path.."/pl_molehills.lua")--From Plantlife mod, by Vanessa Ezekowitz	-- Idea by Sokomine	-- Code & textures by Mossmanikin
dofile(default_path.."/pl_nature_classic.lua")--From Plantlife mod, by Vanessa Ezekowitz	--Originally by neko259
dofile(default_path.."/pl_poisonivy.lua")--From Plantlife mod, by Vanessa Ezekowitz
dofile(default_path.."/pl_trunks.lua")--From Plantlife mod, by Vanessa Ezekowitz	--Code by Mossmanikin & Neuromancer
dofile(default_path.."/pl_vines.lua")--From Plantlife mod, by Vanessa Ezekowitz	--Code bas080	http://forum.minetest.net/viewtopic.php?id=2344
dofile(default_path.."/pl_youngtrees.lua")--From Plantlife mod, by Vanessa Ezekowitz
--dofile(default_path.."/nsspf.lua")--From NSSPF mod, by NPX
dofile(default_path.."/glow.lua")--From Glow mod


--======================
--======================
--B R O K E N--
			--dofile(default_path.."/fm_spring.lua")--From Freeminer subgame sas_core.  Not sure if this actually works as it call for unique param2.
			--dofile(default_path.."/player.lua")  --mt4  Using playerapi mod for mt5
			--dofile(default_path.."/playeranim_v4.lua")  --from Rui914  https://github.com/minetest-mods/playeranim  --broken for mt5
		
			
minetest.after(10, function()
	print("L O A D E D  A L L   F I L E S ! ")

end)


