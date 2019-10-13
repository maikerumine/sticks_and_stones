-----------------------------------------------------------------------------------------------
local title		= "Ferns" -- former "Archae Plantae"
local version 	= "0.2.0"
local mname		= "ferns" -- former "archaeplantae"
-----------------------------------------------------------------------------------------------
-- (by Mossmanikin)
-- License (everything): 	WTFPL			
-----------------------------------------------------------------------------------------------


--default = {}

--dofile(minetest.get_modpath("default").."/settings.lua")
--dofile(minetest.get_modpath("default").."/settings.txt")

if sas_core.config.enable_lady_fern == true then
	--dofile(minetest.get_modpath("default").."/pl_ferns.lua")
end

if sas_core.config.enable_horsetails == true then
	--dofile(minetest.get_modpath("default").."/pl_ferns.lua")
end

if sas_core.config.enable_treefern == true then
	--dofile(minetest.get_modpath("default").."/pl_ferns.lua")
end

if sas_core.config.enable_giant_treefern == true then
	--dofile(minetest.get_modpath("default").."/pl_ferns.lua")
end

--dofile(minetest.get_modpath("default").."/pl_ferns.lua")


-----------------------------------------------------------------------------
-- TESTS
-----------------------------------------------------------------------------
--local run_tests = true	-- set to false to skip
local run_tests = false	-- set to false to skip

if run_tests then

	-- These are, essentially, unit tests to make sure that all required item
	-- strings are registered. The init sequence is not time critical so leaving
	-- them here won't affect performance.

	-- Check node names
	if sas_core.config.enable_horsetails then
		print("[Mod] " ..title.. " Checking horsetail item strings")
		assert(minetest.registered_items["sas_core:horsetail_01"] ~= nil)
		assert(minetest.registered_items["sas_core:horsetail_02"] ~= nil)
		assert(minetest.registered_items["sas_core:horsetail_03"] ~= nil)
		assert(minetest.registered_items["sas_core:horsetail_04"] ~= nil)
	end
	if sas_core.config.enable_lady_fern then
		print("[Mod] ".. title .." Checking lady fern item strings")
		assert(minetest.registered_items["sas_core:fern_01"] ~= nil)
		assert(minetest.registered_items["sas_core:fern_02"] ~= nil)
		assert(minetest.registered_items["sas_core:fern_03"] ~= nil)
	end
	if sas_core.config.enable_treefern then
		print("[Mod] ".. title .." Checking tree fern item strings")
		assert(minetest.registered_items["sas_core:tree_fern_leaves"] ~= nil)
		assert(minetest.registered_items["sas_core:tree_fern_leaves_02"] ~= nil)
		assert(minetest.registered_items["sas_core:fern_trunk"] ~= nil)
		assert(minetest.registered_items["sas_core:sapling_tree_fern"] ~= nil)
	end
end

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
-- Ferns - Crafting 0.0.5
-----------------------------------------------------------------------------------------------
-- (by Mossmanikin)
-- License (everything): 	WTFPL			
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:fiddlehead 3",
	recipe = {"sas_core:fern_01"},
	replacements = {
		{"sas_core:fern_01", "sas_core:ferntuber"}
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:fiddlehead 3",
	recipe = {"sas_core:tree_fern_leaves"},
	replacements = {
		{"sas_core:tree_fern_leaves", "sas_core:sapling_tree_fern"}
	},
})
-----------------------------------------------------------------------------------------------
-- FIDDLEHEAD
-----------------------------------------------------------------------------------------------
minetest.register_alias("archaeplantae:fiddlehead",      "sas_core:fiddlehead")

minetest.register_craftitem("sas_core:fiddlehead", {
	description = "Fiddlehead",
	inventory_image = "ferns_fiddlehead.png",
	on_use = minetest.item_eat(-1), -- slightly poisonous when raw
})
minetest.register_craft({
	type = "cooking",
	output = "sas_core:fiddlehead_roasted",
	recipe = "sas_core:fiddlehead",
	cooktime = 1,
})
minetest.register_craftitem("sas_core:fiddlehead_roasted", {
	description = "Roasted Fiddlehead",
	inventory_image = "ferns_fiddlehead_roasted.png",
	on_use = minetest.item_eat(1), -- edible when cooked
})
-----------------------------------------------------------------------------------------------
-- FERN TUBER
-----------------------------------------------------------------------------------------------
minetest.register_alias("archaeplantae:ferntuber",      "sas_core:ferntuber")

minetest.register_craftitem("sas_core:ferntuber", {
	description = "Fern Tuber",
	inventory_image = "ferns_ferntuber.png",
})
minetest.register_craft({
	type = "cooking",
	output = "sas_core:ferntuber_roasted",
	recipe = "sas_core:ferntuber",
	cooktime = 3,
})

minetest.register_alias("archaeplantae:ferntuber_roasted",      "sas_core:ferntuber_roasted")

minetest.register_craftitem("sas_core:ferntuber_roasted", {
	description = "Roasted Fern Tuber",
	inventory_image = "ferns_ferntuber_roasted.png",
	on_use = minetest.item_eat(3),
})
-----------------------------------------------------------------------------------------------
-- HORSETAIL  (EQUISETUM) --> GREEN DYE https://en.wikipedia.org/wiki/Equisetum
-----------------------------------------------------------------------------------------------
--minetest.register_craft({
--	type = "shapeless",
--	output = "dye:green",
--	recipe = {"group:horsetail"},
--})
-----------------------------------------------------------------------------------------------
-- GLUE WOODEN TOOLS with RESIN & POLISH them with HORSETAIL (planned)
-----------------------------------------------------------------------------------------------
--[[minetest.register_craft({
	type = "shapeless",
	output = "sas_core:pick_wood",
	recipe = {"sas_core:pick_wood","group:horsetail","farming:string","sas_core:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:shovel_wood",
	recipe = {"sas_core:shovel_wood","group:horsetail","farming:string","sas_core:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:axe_wood",
	recipe = {"sas_core:axe_wood","group:horsetail","farming:string","sas_core:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:sword_wood",
	recipe = {"sas_core:sword_wood","group:horsetail","farming:string","sas_core:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "farming:hoe_wood",
	recipe = {"farming:hoe_wood","group:horsetail","farming:string","sas_core:stick"},
})]]


-----------------------------------------------------------------------------------------------
-- Ferns - Fern 0.1.0
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		default, flowers, painting, trees
-- Dependencies: 			plants_lib
-- Supports:				dryplants, stoneage, sumpf		
-----------------------------------------------------------------------------------------------
-- some inspiration from here
-- https://en.wikipedia.org/wiki/Athyrium_yokoscense
-- http://www.mygarden.net.au/gardening/athyrium-yokoscense/3900/1
-----------------------------------------------------------------------------------------------

assert(sas_core.config.enable_lady_fern == true)

-- Maintain backward compatibilty
minetest.register_alias("archaeplantae:fern",		"sas_core:fern_03")
minetest.register_alias("archaeplantae:fern_mid",	"sas_core:fern_02")
minetest.register_alias("archaeplantae:fern_small",	"sas_core:fern_01")
minetest.register_alias("sas_core:fern_04",      		"sas_core:fern_02") -- for placing

local nodenames = {}

local function create_nodes()
	local images 	= { "ferns_fern.png", "ferns_fern_mid.png", "ferns_fern_big.png" }
	local vscales	= { 1, 2, 2.2 }
	local descs		= { "Lady-fern (Athyrium)", nil, nil }

	for i = 1, 3 do
		local node_on_place = nil
		if i == 1 then
			node_on_place = function(itemstack, placer, pointed_thing)
				-- place a random fern
				local stack = ItemStack("sas_core:fern_0"..math.random(1,4))
				local ret = minetest.item_place(stack, placer, pointed_thing)
				return ItemStack("sas_core:fern_01 "..itemstack:get_count()-(1-ret:get_count()))	-- TODO FIXME?
			end
		end
		nodenames[i] = "sas_core:fern_"..string.format("%02d", i)
		minetest.register_node(nodenames[i], {
			description = descs[i] or ("Lady-fern (Athyrium) " .. string.format("%02d", i)),
			inventory_image = "ferns_fern.png",
			drawtype = "plantlike",
			visual_scale = vscales[i],
			paramtype = "light",
			tiles = { images[i] },
			walkable = false,
			buildable_to = true,
			groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, plant_fiber = 1, dig_by_water = 1},
			sounds = default.node_sound_leaves_defaults(),
			selection_box = {
				type = "fixed",
				fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
			},
			drop = "sas_core:fern_01",
			on_place = node_on_place
		})
	end
end

-----------------------------------------------------------------------------------------------
-- Init
-----------------------------------------------------------------------------------------------

create_nodes()

-----------------------------------------------------------------------------------------------
-- Spawning
-----------------------------------------------------------------------------------------------

if sas_core.config.lady_ferns_near_tree == true then
	sas_core:register_generate_plant({ -- near trees (woodlands)
		surface = {
			"sas_core:dirt_with_grass",
			"sas_core:dirt_with_rainforest_litter",
			"sas_core:dirt_with_coniferous_litter",
			"sas_core:mossycobble",
			"sas_core:desert_sand",
			"sas_core:sand",
			"sas_core:jungletree",
			"stoneage:grass_with_silex",
			"sumpf:sumpf"
		},
		max_count = 30,
		rarity = 62,--63,
		min_elevation = 1, -- above sea level
		near_nodes = {"group:tree"},
		near_nodes_size = 3,--4,
		near_nodes_vertical = 2,--3,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
		random_facedir = { 0, 179 },
	},
	nodenames
	)
end

if sas_core.config.lady_ferns_near_rock == true then
	sas_core:register_generate_plant({ -- near stone (mountains)
		surface = {
			"sas_core:dirt_with_grass",
			"sas_core:mossycobble",
			"group:falling_node",
			--"sas_core:jungletree",
			"stoneage:grass_with_silex",
			"sumpf:sumpf"
		},
		max_count = 35,
		rarity = 40,
		min_elevation = 1, -- above sea level
		near_nodes = {"group:stone"},
		near_nodes_size = 1,
		near_nodes_count = 16,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
		random_facedir = { 0, 179 },
	},
	nodenames
	)
end

if sas_core.config.lady_ferns_near_ores == true then -- this one causes a huge fps drop
	sas_core:register_generate_plant({ -- near ores (potential mining sites)
		surface = {
			"sas_core:dirt_with_grass",
			"sas_core:mossycobble",
			"sas_core:stone_with_coal",
			"sas_core:stone_with_iron",
			"moreores:mineral_tin",
			"moreores:mineral_silver",
			"sumpf:sumpf"
		},
		max_count = 1200,--1600, -- maybe too much? :D
		rarity = 25,--15,
		min_elevation = 1, -- above sea level
		near_nodes = {
			"sas_core:stone_with_iron",
			--"sas_core:stone_with_copper",
			--"sas_core:stone_with_mese",
			--"sas_core:stone_with_gold",
			--"sas_core:stone_with_diamond",
			"moreores:mineral_tin",
			"moreores:mineral_silver"
			--"moreores:mineral_mithril"
		},
		near_nodes_size = 2,
		near_nodes_vertical = 4,--5,--6,
		near_nodes_count = 2,--3,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
		random_facedir = { 0, 179 },
	},
	nodenames
	)
end

if sas_core.config.lady_ferns_in_groups == true then -- this one is meant as a replacement of Ferns_near_Ores
	sas_core:register_generate_plant({
		surface = {
			"sas_core:dirt_with_grass",
			"sas_core:mossycobble",
			"sas_core:stone_with_coal",
			"sas_core:stone_with_iron",
			"moreores:mineral_tin",
			"moreores:mineral_silver",
			"sumpf:sumpf"
		},
		max_count = 70,
		rarity = 25,--15,
		min_elevation = 1, -- above sea level
		near_nodes = {
			"sas_core:stone"
		},
		near_nodes_size = 2,
		near_nodes_vertical = 2,--6,
		near_nodes_count = 3,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
		random_facedir = { 0, 179 },
	},
	nodenames
	)
end


-----------------------------------------------------------------------------------------------
-- Ferns - Giant Tree Fern 0.1.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		4seasons, default
-- Supports:				vines			
-----------------------------------------------------------------------------------------------

assert(sas_core.config.enable_giant_treefern == true)

-- lot of code, lot to load

sas_core.grow_giant_tree_fern = function(pos)
	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	if minetest.get_node(pos_01).name ~= "air"
			and minetest.get_node(pos_01).name ~= "sas_core:sapling_giant_tree_fern"
			and minetest.get_node(pos_01).name ~= "sas_core:junglegrass" then
		return
	end

	local size = math.random(12,16)	-- min of range must be >= 4
	
	local leafchecks = {
		{
			direction  = 3,
			positions = {
				{x = pos.x + 1, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x + 2, y = pos.y + size    , z = pos.z    },
				{x = pos.x + 3, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x + 4, y = pos.y + size - 2, z = pos.z    }
			}
		},
		{
			direction  = 1,
			positions = {
				{x = pos.x - 1, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x - 2, y = pos.y + size,     z = pos.z    },
				{x = pos.x - 3, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x - 4, y = pos.y + size - 2, z = pos.z    }
			}
		},
		{
			direction  = 2,
			positions = {
				{x = pos.x    , y = pos.y + size - 1, z = pos.z + 1},
				{x = pos.x    , y = pos.y + size    , z = pos.z + 2},
				{x = pos.x    , y = pos.y + size - 1, z = pos.z + 3},
				{x = pos.x    , y = pos.y + size - 2, z = pos.z + 4}
			}
		},
		{
			direction  = 0,
			positions = {
				{x = pos.x    , y = pos.y + size - 1, z = pos.z - 1},
				{x = pos.x    , y = pos.y + size    , z = pos.z - 2},
				{x = pos.x    , y = pos.y + size - 1, z = pos.z - 3},
				{x = pos.x    , y = pos.y + size - 2, z = pos.z - 4}
			}
		}
	}

	for i = 1, size-3 do
		minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, {name="sas_core:fern_trunk_big"})
	end
	minetest.set_node({x = pos.x, y = pos.y + size-2, z = pos.z}, {name="sas_core:fern_trunk_big_top"})
	minetest.set_node({x = pos.x, y = pos.y + size-1, z = pos.z}, {name="sas_core:tree_fern_leaves_giant"})

	-- all the checking for air below is to prevent some ugly bugs (incomplete trunks of neighbouring trees), it's a bit slower, but worth the result

	-- assert(#leafchecks == 4)
	for i = 1, 4 do
		local positions = leafchecks[i].positions
		local rot = leafchecks[i].direction
		local endpos = 4	-- If the loop below adds all intermediate leaves then the "terminating" leaf will be at positions[4]
		-- assert(#positions == 4)
		-- add leaves so long as the destination nodes are air
		for j = 1, 3 do
			if minetest.get_node(positions[j]).name == "air" then
				minetest.set_node(positions[j], {name="sas_core:tree_fern_leave_big"})
			else
				endpos = j
				break
			end
		end
		-- add the terminating leaf if required and possible
		if endpos == 4 and minetest.get_node(positions[endpos]).name == "air" then
			minetest.set_node(positions[endpos], {name="sas_core:tree_fern_leave_big_end", param2=rot})
		end
	end
end

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN LEAVES
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:tree_fern_leaves_giant", {
	description = "Tree Fern Crown (Dicksonia)",
	drawtype = "plantlike",
	visual_scale = math.sqrt(8),
	wield_scale = {x=0.175, y=0.175, z=0.175},
	paramtype = "light",
	tiles = {"ferns_fern_tree_giant.png"},
	inventory_image = "ferns_fern_tree.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		--attached_node=1,
		not_in_creative_inventory=1,
		falling_node = 1,
		leafdecay = 3,
		leaves = 1,
		plant_fiber = 1, dig_by_water = 1
	},
	drop = {
		max_items = 2,
		items = {
			{
				-- occasionally, drop a second sapling instead of leaves
				-- (extra saplings can also be obtained by replanting and
				--  reharvesting leaves)
				items = {"sas_core:sapling_giant_tree_fern"},
				rarity = 10,
			},
			{
				items = {"sas_core:sapling_giant_tree_fern"},
			},
			{
				items = {"sas_core:tree_fern_leaves_giant"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN LEAVE PART
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:tree_fern_leave_big", {
	description = "Giant Tree Fern Leaves",
	drawtype = "raillike",
	paramtype = "light",
	tiles = {
		"ferns_tree_fern_leave_big.png",
	},
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		--attached_node=1,
		plant_fiber = 1,
		falling_node = 1,
		leafdecay = 3,
		leaves = 1,
		not_in_creative_inventory=1, dig_by_water = 1
	},
	drop = "",
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN LEAVE END
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:tree_fern_leave_big_end", {
	description = "Giant Tree Fern Leave End",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = { "ferns_tree_fern_leave_big_end.png" },
	walkable = false,
	node_box = {
		type = "fixed",
--			    {left, bottom, front, right, top,   back }
		fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
	},
	groups = {
		snappy=3,
		flammable=2,
		--attached_node=1,
		plant_fiber = 1,
		falling_node = 1,
		leaves = 1,
		leafdecay = 3,
		not_in_creative_inventory=1, dig_by_water = 1
	},
	drop = "",
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN TRUNK TOP
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:fern_trunk_big_top", {
	description = "Giant Fern Trunk",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ferns_fern_trunk_big_top.png^ferns_tree_fern_leave_big_cross.png",
		"ferns_fern_trunk_big_top.png^ferns_tree_fern_leave_big_cross.png",
		"ferns_fern_trunk_big.png"
	},
	node_box = {
		type = "fixed",
--			{left, bottom, front, right, top,   back }
		fixed = {
			{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
			{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	groups = {
		tree=1,
		choppy=2,
		--oddly_breakable_by_hand=2,
		flammable=3,
		wood=1,
		falling_node = 1,
		not_in_creative_inventory=1,
		leafdecay=3 -- to support vines
	},
	drop = "sas_core:fern_trunk_big",
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN TRUNK
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:fern_trunk_big", {
	description = "Giant Fern Trunk",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ferns_fern_trunk_big_top.png",
		"ferns_fern_trunk_big_top.png",
		"ferns_fern_trunk_big.png"
	},
	node_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	groups = {tree=1,choppy=2,flammable=3,falling_node = 1, wood=1},
	sounds = default.node_sound_wood_defaults(),
	after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
        if node.name == "sas_core:fern_trunk_big" or node.name == "sas_core:fern_trunk_big_top" then 
            minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z}) 
            minetest.add_item(pos,"sas_core:fern_trunk_big")
        end
    end,
})

--[[
default.register_leafdecay({
	trunks = {"sas_core:tree_fern_leaves_giant"},
	leaves = {"sas_core:tree_fern_leave_big"},
	radius = 3,
})
]]
default.register_leafdecay({
	trunks = {"sas_core:tree_fern_leave_big"},
	leaves = {"sas_core:tree_fern_leave_big_end"},
	radius = 1,
})
--[[
default.register_leafdecay({
	trunks = {"sas_core:fern_trunk_big"},
	leaves = {"sas_core:tree_fern_leave_big"},
	radius = 1,
})
]]
default.register_leafdecay({
	trunks = {"sas_core:fern_trunk_big_top"},
	leaves = {"sas_core:tree_fern_leave_big"},
	radius = 3,
})
-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN SAPLING
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:sapling_giant_tree_fern", {
	description = "Giant Tree Fern Sapling",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"ferns_sapling_tree_fern_giant.png"},
	inventory_image = "ferns_sapling_tree_fern_giant.png",
	walkable = false,
	groups = {snappy=3,flammable=2,flora=1,plant_fiber = 1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})

-- abm
minetest.register_abm({
	nodenames = "sas_core:sapling_giant_tree_fern",
	interval = 1000,
	chance = 4,
	action = function(pos, node, _, _)
		sas_core.grow_giant_tree_fern({x = pos.x, y = pos.y-1, z = pos.z})
    end
})

-----------------------------------------------------------------------------------------------
-- GENERATE GIANT TREE FERN
-----------------------------------------------------------------------------------------------

-- in jungles
if sas_core.config.enable_giant_treeferns_in_jungle == true then
	sas_core:register_generate_plant({
		surface = {
			"default:dirt_with_grass",
			"default:sand",
			"default:desert_sand"--,
			--"dryplants:grass_short"
		},
		max_count = 12,--27,
		avoid_nodes = {"group:tree"},
		avoid_radius = 3,--4,
		rarity = 85,
		seed_diff = 329,
		min_elevation = 1,
		near_nodes = {"default:jungletree"},
		near_nodes_size = 6,
		near_nodes_vertical = 2,--4,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
	},
	sas_core.grow_giant_tree_fern
	)
end

-- for oases & tropical beaches
if sas_core.config.enable_giant_treeferns_in_oases == true then
	sas_core:register_generate_plant({
		surface = {
			"default:sand"--,
			--"sas_core:desert_sand"
		},
		max_count = 10,--27,
		rarity = 90,
		seed_diff = 329,
		neighbors = {"default:desert_sand"},
		ncount = 1,
		min_elevation = 1,
		near_nodes = {"default:water_source"},
		near_nodes_size = 2,
		near_nodes_vertical = 1,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 1.0,
		temp_max = -1.0,
		temp_min = 1.0,
	},
	sas_core.grow_giant_tree_fern
	)
end


-----------------------------------------------------------------------------------------------
-- Archae Plantae - Horsetail 0.0.5
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		default, flowers, trees
-- Dependencies: 			plants_lib
-- Supports:				dryplants, stoneage, sumpf			
-----------------------------------------------------------------------------------------------

assert(sas_core.config.enable_horsetails == true)

-----------------------------------------------------------------------------------------------
-- HORSETAIL  (EQUISETUM)
-----------------------------------------------------------------------------------------------

local node_names = {}

local function create_nodes()
	local selection_boxes = {
		{ -0.15, -1/2, -0.15, 0.15, -1/16, 0.15 },
		{ -0.15, -1/2, -0.15, 0.15, 1/16, 0.15 },
		{ -0.15, -1/2, -0.15, 0.15, 4/16, 0.15 },
		{ -0.15, -1/2, -0.15, 0.15, 7/16, 0.15 },
	}

	for i = 1, 4 do
		local node_name = "sas_core:horsetail_" .. string.format("%02d", i)
		local node_img = "ferns_horsetail_" .. string.format("%02d", i) .. ".png"
		local node_desc
		local node_on_use = nil
		local node_drop = "sas_core:horsetail_04"

		if i == 1 then
			node_desc = "Young Horsetail (Equisetum)"
			node_on_use = minetest.item_eat(1) -- young ones edible https://en.wikipedia.org/wiki/Equisetum
			node_drop = node_name
		elseif i == 4 then
			node_desc = "Horsetail (Equisetum)"
		else
			node_desc = "Horsetail (Equisetum) ".. string.format("%02d", i)
		end

		node_names[i] = node_name

		minetest.register_node(node_name, {
			description = node_desc,
			drawtype = "plantlike",
			paramtype = "light",
			tiles = { node_img },
			inventory_image = node_img,
			walkable = false,
			buildable_to = true,
			groups = {snappy=3,flammable=2,attached_node=1,horsetail=1, plant_fiber = 1},
			sounds = default.node_sound_leaves_defaults(),
			selection_box = {
				type = "fixed",
				fixed = selection_boxes[i],
			},
			on_use = node_on_use,
			drop = node_drop,
		})
	end
end

-----------------------------------------------------------------------------------------------
-- Init
-----------------------------------------------------------------------------------------------

create_nodes()

-----------------------------------------------------------------------------------------------
-- Spawning
-----------------------------------------------------------------------------------------------
if sas_core.config.enable_horsetails_spawning == true then
	sas_core:spawn_on_surfaces({
		spawn_delay = 1200,
		spawn_plants = node_names,
		spawn_chance = 400,
		spawn_surfaces = {
			"default:dirt_with_grass",
			"default:desert_sand",
			"default:sand",
			"sas_core:grass_short",
			"stoneage:grass_with_silex",
			"default:mossycobble",
			"default:gravel"
		},
		seed_diff = 329,
		min_elevation = 1, -- above sea level
		near_nodes = {"default:water_source","default:gravel"},
		near_nodes_size = 2,
		near_nodes_vertical = 1,
		near_nodes_count = 1,
		--random_facedir = { 0, 179 },
	})
end

-----------------------------------------------------------------------------------------------
-- Generating
-----------------------------------------------------------------------------------------------

if sas_core.config.enable_horsetails_on_grass == true then
	sas_core:register_generate_plant({
		surface = {
			"default:dirt_with_grass",
			"sumpf:sumpf"
		},
		max_count = 35,
		rarity = 40,
		min_elevation = 1, -- above sea level
		near_nodes = {
			"group:water", -- likes water (of course)
			"default:gravel", -- near those on gravel
			"default:sand", -- some like sand
			"default:clay", -- some like clay
			"stoneage:grass_with_silex",
			"default:mossycobble",
			"default:cobble",
			"sumpf:sumpf"
		},
		near_nodes_size = 3,
		near_nodes_vertical = 2,--3,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C
		temp_min = 0.53, -- 0 °C, dies back in winter
		--random_facedir = { 0, 179 },
	},
	node_names
	)
end

if sas_core.config.enable_horsetails_on_stones == true then
	sas_core:register_generate_plant({
		surface = {
			"default:gravel", -- roots go deep
			"default:mossycobble",
			"stoneage:dirt_with_silex",
			"stoneage:grass_with_silex",
			"stoneage:sand_with_silex", -- roots go deep
		},
		max_count = 35,
		rarity = 20,
		min_elevation = 1, -- above sea level
		plantlife_limit = -0.9,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C
		temp_min = 0.53, -- 0 °C, dies back in winter
		--random_facedir = { 0, 179 },
	},
	node_names
	)
end


-----------------------------------------------------------------------------------------------
-- Ferns - Tree Fern 0.1.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		default	, trees			
-----------------------------------------------------------------------------------------------

assert(sas_core.config.enable_treefern == true)

sas_core.grow_tree_fern = function(pos)

	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	if minetest.get_node(pos_01).name ~= "air"
			and minetest.get_node(pos_01).name ~= "sas_core:sapling_tree_fern"
			and minetest.get_node(pos_01).name ~= "default:junglegrass" then
		return
	end
		
	local size = math.random(1, 4) + math.random(1, 4)
	if (size > 5) then
		size = 10 - size
	end
	size = size + 1
	local crown = ({ "sas_core:tree_fern_leaves", "sas_core:tree_fern_leaves_02" })[math.random(1, 2)]
	
	local i = 1
	while (i < size-1) do
		if minetest.get_node({x = pos.x, y = pos.y + i + 1, z = pos.z}).name ~= "air" then
			break
		end
		minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, { name = "sas_core:fern_trunk" })
		i = i + 1
	end

	minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, { name = crown })
end

-----------------------------------------------------------------------------------------------
-- TREE FERN LEAVES
-----------------------------------------------------------------------------------------------

-- TODO: Both of these nodes look the same?

minetest.register_node("sas_core:tree_fern_leaves", {
	description = "Tree Fern Crown (Dicksonia)",
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	paramtype2 = "facedir",
	--tiles = {"[combine:32x32:0,0=top_left.png:0,16=bottom_left.png:16,0=top_right.png:16,16=bottom_right.png"},
	tiles = {"ferns_fern_tree.png"},
	inventory_image = "ferns_fern_tree_inv.png",
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1, plant_fiber = 1},
	drop = {
		max_items = 2,
		items = {
			{
				-- occasionally, drop a second sapling instead of leaves
				-- (extra saplings can also be obtained by replanting and
				--  reharvesting leaves)
				items = {"sas_core:sapling_tree_fern"},
				rarity = 10,
			},
			{
				items = {"sas_core:sapling_tree_fern"},
			},
			{
				items = {"sas_core:tree_fern_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
minetest.register_node("sas_core:tree_fern_leaves_02", {
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	tiles = {"ferns_fern_big.png"},
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1,plant_fiber = 1, not_in_creative_inventory=1},
	drop = {
		max_items = 2,
		items = {
			{
				-- occasionally, drop a second sapling instead of leaves
				-- (extra saplings can also be obtained by replanting and
				--  reharvesting leaves)
				items = {"sas_core:sapling_tree_fern"},
				rarity = 10,
			},
			{
				items = {"sas_core:sapling_tree_fern"},
			},
			{
				items = {"sas_core:tree_fern_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
-----------------------------------------------------------------------------------------------
-- FERN TRUNK
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:fern_trunk", {
	description = "Fern Trunk (Dicksonia)",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ferns_fern_trunk_top.png",
		"ferns_fern_trunk_top.png",
		"ferns_fern_trunk.png"
	},
	node_box = {
		type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
        if node.name == "sas_core:fern_trunk" then 
            minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z}) 
            minetest.add_item(pos,"sas_core:fern_trunk")
        end
    end,
})

-----------------------------------------------------------------------------------------------
-- TREE FERN SAPLING
-----------------------------------------------------------------------------------------------
minetest.register_node("sas_core:sapling_tree_fern", {
	description = "Tree Fern Sapling (Dicksonia)",
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"ferns_sapling_tree_fern.png"},
	inventory_image = "ferns_sapling_tree_fern.png",
	walkable = false,
	groups = {snappy=3,flammable=2,flora=1,plant_fiber = 1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
-- abm
minetest.register_abm({
	nodenames = "sas_core:sapling_tree_fern",
	interval = 1000,
	chance = 4,
	action = function(pos, node, _, _)
		sas_core.grow_tree_fern({x = pos.x, y = pos.y-1, z = pos.z})
    end
})

-----------------------------------------------------------------------------------------------
-- GENERATE TREE FERN
-----------------------------------------------------------------------------------------------

-- in jungles
if sas_core.config.enable_treeferns_in_jungle == true then
	sas_core:register_generate_plant({
		surface = {
			"default:dirt_with_grass",
			"default:sand",
			"default:desert_sand",
		},
		max_count = 35,--27,
		avoid_nodes = {"default:tree"},
		avoid_radius = 4,
		rarity = 50,
		seed_diff = 329,
		min_elevation = -10,
		near_nodes = {"default:jungletree"},
		near_nodes_size = 6,
		near_nodes_vertical = 2,--4,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5,
		temp_min = 0.13,
	},
	sas_core.grow_tree_fern
	)
end

-- for oases & tropical beaches
if sas_core.config.enable_treeferns_in_oases == true then
	sas_core:register_generate_plant({
		surface = {
			"default:sand"--,
			--"sas_core:desert_sand"
		},
		max_count = 35,
		rarity = 50,
		seed_diff = 329,
		neighbors = {"default:desert_sand"},
		ncount = 1,
		min_elevation = 1,
		near_nodes = {"default:water_source"},
		near_nodes_size = 2,
		near_nodes_vertical = 1,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 1.0,
		temp_max = -1.0,
		temp_min = 1.0,
	},
	sas_core.grow_tree_fern
)
end




