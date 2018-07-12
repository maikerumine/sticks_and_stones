-----------------------------------------------------------------------------------------------
local title		= "Grasses" -- former "Dry plants"
local version 	= "0.1.5"
local mname		= "dryplants"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- textures & ideas partly by Neuromancer

-- License (everything): 	WTFPL
-- Contains code from: 		default, farming 
-- Looked at code from:		darkage, sickle, stairs
-- Dependencies: 			default, farming, plants_lib
-- Supports:				
-----------------------------------------------------------------------------------------------
--default = {}

--dofile(minetest.get_modpath("default").."/crafting.lua")
--dofile(minetest.get_modpath("default").."/settings.txt")
--dofile(minetest.get_modpath("default").."/reed.lua")
if REEDMACE_GENERATES == true then
--dofile(minetest.get_modpath("default").."/pl_dryplants.lua")
end
if SMALL_JUNCUS_GENERATES == true then
--dofile(minetest.get_modpath("default").."/pl_dryplants.lua")
end
if EXTRA_TALL_GRASS_GENERATES == true then
--dofile(minetest.get_modpath("default").."/pl_dryplants.lua")
end
--dofile(minetest.get_modpath("default").."/meadowvariation.lua")

-----------------------------------------------------------------------------------------------
-- Sickle
-----------------------------------------------------------------------------------------------
local function sickle_can_break(pos, deff, player)
	local def = ItemStack({name=deff.name}):get_definition()

	if not def.diggable or (def.can_dig and not def.can_dig(pos,player)) then
		minetest.log("info", player:get_player_name() .. " tried to sickle "
		.. def.name .. " which is not diggable "
		.. minetest.pos_to_string(pos))
		return
	end

	if minetest.is_protected(pos, player:get_player_name()) then
		minetest.log("action", player:get_player_name()
			.. " tried to sickle " .. def.name
			.. " at protected position "
			.. minetest.pos_to_string(pos))
		minetest.record_protection_violation(pos, player:get_player_name())
		return
	end

	return true
end
-- turns nodes with group flora=1 & flower=0 into cut grass
local function sickle_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local above_pos = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(above_pos)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	if not sickle_can_break(pt.under, under, user) then
		return
	end
	-- check if something that can be cut using fine tools
	if minetest.get_item_group(under.name, "snappy") > 0 then
		-- check if flora but no flower
		if minetest.get_item_group(under.name, "flora") == 1 and minetest.get_item_group(under.name, "flower") == 0 then
			-- turn the node into cut grass, wear out item and play sound
			minetest.set_node(pt.under, {name="default:grass"})
		else -- otherwise dig the node
			if not minetest.node_dig(pt.under, under, user) then
				return
			end
		end
		minetest.sound_play("default_dig_crumbly", {
			pos = pt.under,
			gain = 0.5,
		})
		itemstack:add_wear(65535/(uses-1))
		return itemstack
	elseif string.find(under.name, "default:dirt_with_grass") then
		if minetest.is_protected(above_pos, user:get_player_name()) or above.name ~= "air" then
			return
		end
		minetest.set_node(pt.under, {name="default:grass_short"})
		minetest.set_node(above_pos, {name="default:grass"})
		minetest.sound_play("default_dig_crumbly", {
			pos = pt.under,
			gain = 0.5,
		})
		itemstack:add_wear(65535/(uses-1))
		return itemstack
	end
end
-- the tool
minetest.register_tool("default:sickle", {
	description = "Sickle -Used for quick collecting of grasses-",
	inventory_image = "dryplants_sickle.png",
	on_use = function(itemstack, user, pointed_thing)
		return sickle_on_use(itemstack, user, pointed_thing, 220)
	end,
})

-----------------------------------------------------------------------------------------------
-- Cut Grass
-----------------------------------------------------------------------------------------------
minetest.register_node("default:grass", {
	description = "Cut Grass",
	inventory_image = "dryplants_grass.png",
	wield_image = "dryplants_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"dryplants_grass.png"},
	drawtype = "nodebox",
	node_box = {
	    type = "fixed",
        fixed = {-0.5   , -0.5   , -0.5   ,   0.5   , -0.4375,  0.5   },
    },
	groups = {snappy=3, flammable=2, plant_fiber=1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Cut Grass becomes Hay over time
-----------------------------------------------------------------------------------------------
minetest.register_abm({
	nodenames = {"default:grass"},
	interval = HAY_DRYING_TIME, --1200, -- 20 minutes: a minetest-day/night-cycle
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="default:hay"})
	end,
})

-----------------------------------------------------------------------------------------------
-- Hay
-----------------------------------------------------------------------------------------------
minetest.register_node("default:hay", {
	description = "Hay",
	inventory_image = "dryplants_hay.png",
	wield_image = "dryplants_hay.png",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"dryplants_hay.png"},
	drawtype = "nodebox",
	node_box = {
	    type = "fixed",
        fixed = {-0.5   , -0.5   , -0.5   ,   0.5   , -0.4375,  0.5   },
    },
	groups = {snappy=3, flammable=2, plant_fiber=1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Short Grass
-----------------------------------------------------------------------------------------------
minetest.register_node("default:grass_short", {
	description = "Short Grass",
	tiles = {"default_grass.png^dryplants_grass_short.png", "default_dirt.png", "default_dirt.png^default_grass_side.png^dryplants_grass_short_side.png"},
	is_ground_content = true,
	--groups = {crumbly=3,soil=1,not_in_creative_inventory=1},
	groups = {crumbly=2,soil=1, falling_node = 1},
	--drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

-----------------------------------------------------------------------------------------------
-- Short Grass becomes Dirt with Grass over time
-----------------------------------------------------------------------------------------------
minetest.register_abm({
	nodenames = {"default:grass_short"},
	interval = GRASS_REGROWING_TIME, --1200, -- 20 minutes: a minetest-day/night-cycle
	chance = 100/GRASS_REGROWING_CHANCE,
	action = function(pos)
		-- Only become dirt with grass if no cut grass or hay lies on top
		local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
		if above.name ~= "default:grass" and above.name ~= "default:hay" then
			minetest.set_node(pos, {name="default:dirt_with_grass"})
		end
	end,
})

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
-- Dry Plants - Recipes 0.1.0 -- Short Grass -> Dirt
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL		
-- Looked at code from:		darkage, default, farming, sickle, stairs
-- Dependencies: 			default, farming
-- Supports:				flint, stoneage, sumpf			
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Short Grass
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = "default:dirt",
	recipe = {
		{"default:grass_short"},
	}
})

-----------------------------------------------------------------------------------------------
-- Cut Grass
-----------------------------------------------------------------------------------------------
-- grass recipes (remove roots)
minetest.register_craft({
	output = "default:grass",
	recipe = {
		{"default:grass_1"},
	}
})
minetest.register_craft({
	output = "default:grass",
	recipe = {
		{"default:junglegrass"},
	}
})
if minetest.get_modpath("sumpf") ~= nil then
	minetest.register_craft({
		output = "default:grass",
		recipe = {
			{"sumpf:gras"},
		}
	})
end

-----------------------------------------------------------------------------------------------
-- Sickle
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = "default:sickle",
	recipe = {
		{"group:pebble","default:glue"},
		{"", "default:stick"},
		{"default:stick",""}
	}
})
if minetest.get_modpath("flint") ~= nil then
	minetest.register_craft({
		output = "default:sickle",
		recipe = {
			{"flint:flintstone","default:glue"},
			{"", "default:stick"},
			{"default:handle_short",""}
		}
	})
end
if minetest.get_modpath("stoneage") ~= nil then
	minetest.register_craft({
		output = "default:sickle",
		recipe = {
			{"stoneage:silex","default:glue"},
			{"", "default:stick"},
			{"default:handle_short",""}
		}
	})
end

-----------------------------------------------------------------------------------------------
-- Hay
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({
	type = "cooking",
	output = "default:hay",
	recipe = "default:grass",
	cooktime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:hay",
	burntime = 1,
})

-----------------------------------------------------------------------------------------------
-- Wet Reed
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- papyrus -> wetreed
	output = "default:wetreed 2",
	recipe = {
		{"default:papyrus","default:papyrus"},
		{"default:papyrus","default:papyrus"},
	}
})
minetest.register_craft({ -- reedmace_sapling -> wetreed
	output = "default:wetreed 2",
	recipe = {
		{"default:reedmace_sapling","default:reedmace_sapling"},
		{"default:reedmace_sapling","default:reedmace_sapling"},
	}
})
minetest.register_craft({ -- reedmace_top -> wetreed
	output = "default:wetreed 2",
	recipe = {
		{"default:reedmace_top","default:reedmace_top"},
		{"default:reedmace_top","default:reedmace_top"},
	}
})
minetest.register_craft({ -- reedmace -> wetreed
	output = "default:wetreed 2",
	recipe = {
		{"default:reedmace","default:reedmace"},
		{"default:reedmace","default:reedmace"},
	}
})
minetest.register_craft({ -- reedmace_bottom -> wetreed
	output = "default:wetreed 2",
	recipe = {
		{"default:reedmace_bottom","default:reedmace_bottom"},
		{"default:reedmace_bottom","default:reedmace_bottom"},
	}
})


local ReeD = {
	{"wetreed"},
	{"reed"}
}
for i in pairs(ReeD) do
	local reed = "default:"..ReeD[i][1]
	local slab = reed.."_slab"
	local roof = reed.."_roof"
	local corner = roof.."_corner"
	local corner_2 = corner.."_2"
-----------------------------------------------------------------------------------------------
-- Block
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- slab -> block
		output = reed,
		recipe = {
			{slab},
			{slab},
		}
	})
	minetest.register_craft({ -- roof -> block
		output = reed,
		recipe = {
			{roof},
			{roof},
		}
	})
	minetest.register_craft({ -- corner -> block
		type = "shapeless",
		output = reed.." 3",
		recipe = {corner,corner,corner,corner,corner,corner,corner,corner}, -- 8x
	})
	minetest.register_craft({ -- corner_2 -> block
		type = "shapeless",
		output = reed.." 3",
		recipe = {corner_2,corner_2,corner_2,corner_2,corner_2,corner_2,corner_2,corner_2}, -- 8x
	})
-----------------------------------------------------------------------------------------------
-- Slab
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> slab
		output = slab.." 6",
		recipe = {
			{reed,reed,reed},
		}
	})
	minetest.register_craft({ -- roof -> slab
		output = slab,
		recipe = {
			{roof},
		}
	})
	minetest.register_craft({ -- corner -> slab
		output = slab.." 3",
		recipe = {
			{corner,corner},
			{corner,corner},
		}
	})
	minetest.register_craft({ -- corner_2 -> slab
		output = slab.." 3",
		recipe = {
			{corner_2,corner_2},
			{corner_2,corner_2},
		}
	})
-----------------------------------------------------------------------------------------------
-- Roof
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> roof
		output = roof.." 4",
		recipe = {
			{reed,""},
			{"",reed},
		}
	})
	minetest.register_craft({ -- block -> roof
		output = roof.." 4",
		recipe = {
			{"",reed},
			{reed,""},
		}
	})
	minetest.register_craft({ -- slab -> roof
		output = roof,
		recipe = {
			{slab},
		}
	})	
-----------------------------------------------------------------------------------------------
-- Roof Corner
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> corner
		output = corner.." 8",
		recipe = {
			{"",reed,""},
			{reed,"",reed},
		}
	})
	minetest.register_craft({ -- corner_2 -> corner
		output = corner,
		recipe = {
			{corner_2},
		}
	})
-----------------------------------------------------------------------------------------------
-- Roof Corner 2
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> corner_2
		output = corner_2.." 8",
		recipe = {
			{reed,"",reed},
			{"",reed,""},
		}
	})
	minetest.register_craft({ -- corner -> corner_2
		output = corner_2,
		recipe = {
			{corner},
		}
	})
end

-----------------------------------------------------------------------------------------------
-- Reed
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- hay -> reed
	output = "default:reed 2",
	recipe = {
		{"default:hay","default:hay"},
		{"default:hay","default:hay"},
	}
})
--cooking
minetest.register_craft({ -- wetreed -> reed
	type = "cooking",
	output = "default:reed",
	recipe = "default:wetreed",
	cooktime = 2,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "default:reed",
	burntime = 4,
})
-----------------------------------------------------------------------------------------------
-- Reed Slab
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetreed_slab -> reed_slab
	type = "cooking",
	output = "default:reed_slab",
	recipe = "default:wetreed_slab",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "default:reed_slab",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- Reed Roof
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetreed_roof -> reed_roof
	type = "cooking",
	output = "default:reed_roof",
	recipe = "default:wetreed_roof",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "default:reed_roof",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- Reed Roof Corner
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetreed_roof_corner -> reed_roof_corner
	type = "cooking",
	output = "default:reed_roof_corner",
	recipe = "default:wetreed_roof_corner",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "default:reed_roof_corner",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- Wet Reed Roof Corner 2
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetreed_roof_corner -> reed_roof_corner
	type = "cooking",
	output = "default:reed_roof_corner_2",
	recipe = "default:wetreed_roof_corner_2",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "default:reed_roof_corner_2",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- Dandelion Leave 
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("default:dandelion_leave", {
	description = "Dandelion Leave",
	--inventory_image = "dryplants_dandelion_leave.png",
	--inventory_image = "flowers_dandelion_yellow.png^flowers_dandelion_yellow.png^[transformR90 ",
	inventory_image = "flowers_dandelion_yellow.png^[transformR90 ",
	on_use = minetest.item_eat(1),
})
minetest.register_craft({
	type = "shapeless",
	output = "default:dandelion_leave 4",
	recipe = {"flowers:dandelion_yellow"},
--	replacements = {
--		{"flowers:dandelion_yellow", "dye:yellow"}
---	},
})

-----------------------------------------------------------------------------------------------
-- Grasses - Juncus 0.0.5
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- textures & ideas partly by Neuromancer

-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		default			
-----------------------------------------------------------------------------------------------

default.grow_juncus = function(pos)
	local juncus_type = math.random(2,3)
	local right_here = {x=pos.x, y=pos.y+1, z=pos.z}
	if minetest.get_node(right_here).name == "air"  -- instead of check_air = true,
	or minetest.get_node(right_here).name == "default:junglegrass" then
		if juncus_type == 2 then
			minetest.set_node(right_here, {name="default:juncus_02"})
		else
			minetest.set_node(right_here, {name="default:juncus"})
		end
	end
end

minetest.register_node("default:juncus", {
	description = "Juncus",
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	tiles = {"dryplants_juncus_03.png"},
	inventory_image = "dryplants_juncus_inv.png",
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		plant_fiber = 1,
		flora=1, dig_by_water = 1
		--not_in_creative_inventory=1
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.under
		local juncus_type = math.random(2,3)
		local right_here = {x=pos.x, y=pos.y+1, z=pos.z}
		if juncus_type == 2 then
			minetest.set_node(right_here, {name="default:juncus_02"})
		else
			minetest.set_node(right_here, {name="default:juncus"})
		end
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})
minetest.register_node("default:juncus_02", {
	description = "Juncus",
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	tiles = {"dryplants_juncus_02.png"},
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		flora=1,
		plant_fiber = 1,
		not_in_creative_inventory=1, dig_by_water = 1
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	drop = "default:juncus",
})
-----------------------------------------------------------------------------------------------
-- GENERATE SMALL JUNCUS
-----------------------------------------------------------------------------------------------
-- near water or swamp
default:register_generate_plant({
    surface = {
		"default:dirt_with_grass", 
		"default:desert_sand",
		"default:sand",
		"stoneage:grass_with_silex",
		"sumpf:peat",
		"sumpf:sumpf"
	},
    max_count = JUNCUS_NEAR_WATER_PER_MAPBLOCK,
    rarity = 101 - JUNCUS_NEAR_WATER_RARITY,
    min_elevation = 1, -- above sea level
	near_nodes = {"default:water_source","sumpf:dirtywater_source","sumpf:sumpf"},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.grow_juncus
)
-- at dunes/beach
default:register_generate_plant({
    surface = {
		"default:dirt_with_grass", 
		"default:desert_sand",
		"default:sand",
		--"stoneage:grass_with_silex",
		--"sumpf:peat",
		--"sumpf:sumpf"
	},
    max_count = JUNCUS_AT_BEACH_PER_MAPBLOCK,
    rarity = 101 - JUNCUS_AT_BEACH_RARITY,
    min_elevation = 1, -- above sea level
	near_nodes = {"default:dirt_with_grass"},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.grow_juncus
)


-----------------------------------------------------------------------------------------------
-- Grasses - Meadow Variation 0.0.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin

-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		default				
-----------------------------------------------------------------------------------------------

default.grow_grass_variation = function(pos)
	local right_here = {x=pos.x, y=pos.y, z=pos.z}
	minetest.set_node(right_here, {name="default:grass_short"})
end

default:register_generate_plant({
    surface = {
		"default:dirt_with_grass",
	},
    max_count = 4800,
    rarity = 25,
    min_elevation = 1, -- above sea level
	plantlife_limit = -0.9,
  },
  default.grow_grass_variation
)

-----------------------------------------------------------------------------------------------
-- Grasses - More Tall Grass 0.0.2
-----------------------------------------------------------------------------------------------
-- by Mossmanikin

-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		default				
-----------------------------------------------------------------------------------------------

default.grow_grass = function(pos)
	local right_here = {x=pos.x, y=pos.y+1, z=pos.z}
	local grass_size = math.random(1,5)
	if minetest.get_node(right_here).name == "air"  -- instead of check_air = true,
	or minetest.get_node(right_here).name == "default:junglegrass" then
		minetest.set_node(right_here, {name="default:grass_"..grass_size})
	end
end

default:register_generate_plant({
    surface = {
		"default:dirt_with_grass",
		"stoneage:grass_with_silex",
		"sumpf:peat",
		"sumpf:sumpf"
	},
    max_count = TALL_GRASS_PER_MAPBLOCK,
    rarity = 101 - TALL_GRASS_RARITY,
    min_elevation = 1, -- above sea level
	plantlife_limit = -0.9,
  },
  default.grow_grass
)



-----------------------------------------------------------------------------------------------
-- Dry Plants - Reed 0.0.5
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Looked at code from:		darkage, default, stairs
-- Dependencies: 			default			
-----------------------------------------------------------------------------------------------
minetest.register_alias("stairs:stair_wetreed",				"default:wetreed_roof")
minetest.register_alias("stairs:slab_wetreed",				"default:wetreed_slab")
minetest.register_alias("stairs:stair_reed",				"default:reed_roof")
minetest.register_alias("stairs:slab_reed",					"default:reed_slab")


-----------------------------------------------------------------------------------------------
-- Wet Reed
-----------------------------------------------------------------------------------------------
minetest.register_node("default:wetreed", {
	description = "Wet Reed",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed_wet.png"},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet Reed Slab
-----------------------------------------------------------------------------------------------
minetest.register_node("default:wetreed_slab", {
	description = "Wet Reed Slab",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed_wet.png"},
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet Reed Roof
-----------------------------------------------------------------------------------------------
minetest.register_node("default:wetreed_roof", {
	description = "Wet Reed Roof",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed_wet.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

if AUTO_ROOF_CORNER == true then

	local CoRNeR = {
--		  MaTeRiaL
		{"wetreed"},
		{"reed"}
	}

	for i in pairs(CoRNeR) do

		local MaTeRiaL = CoRNeR[i][1]
		local roof = "default:"..MaTeRiaL.."_roof"
		local corner = "default:"..MaTeRiaL.."_roof_corner"
		local corner_2 = "default:"..MaTeRiaL.."_roof_corner_2"

		minetest.register_abm({
			nodenames = {roof},
			interval = 1,
			chance = 1,
			action = function(pos)
	
				local node_east = 			minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z  })
				local node_west = 			minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z  })
				local node_north = 			minetest.get_node({x=pos.x,   y=pos.y, z=pos.z+1})
				local node_south = 			minetest.get_node({x=pos.x,   y=pos.y, z=pos.z-1})
		-- corner 1
				if ((node_west.name == roof and node_west.param2 == 0)
				or (node_west.name == corner and node_west.param2 == 1))
				and ((node_north.name == roof and node_north.param2 == 3)
				or (node_north.name == corner and node_north.param2 == 3))
				then
					minetest.set_node(pos, {name=corner, param2=0})
				end
		
				if ((node_north.name == roof and node_north.param2 == 1)
				or (node_north.name == corner and node_north.param2 == 2))
				and ((node_east.name == roof and node_east.param2 == 0)
				or (node_east.name == corner and node_east.param2 == 0))
				then
					minetest.set_node(pos, {name=corner, param2=1})
				end
		
				if ((node_east.name == roof and node_east.param2 == 2)
				or (node_east.name == corner and node_east.param2 == 3))
				and ((node_south.name == roof and node_south.param2 == 1)
				or (node_south.name == corner and node_south.param2 == 1))
				then
					minetest.set_node(pos, {name=corner, param2=2})
				end
		
				if ((node_south.name == roof and node_south.param2 == 3)
				or (node_south.name == corner and node_south.param2 == 0))
				and ((node_west.name == roof and node_west.param2 == 2)
				or (node_west.name == corner and node_west.param2 == 2))
				then
					minetest.set_node(pos, {name=corner, param2=3})
				end
		-- corner 2
				if ((node_west.name == roof and node_west.param2 == 2)
				or (node_west.name == corner_2 and node_west.param2 == 1))
				and ((node_north.name == roof and node_north.param2 == 1)
				or (node_north.name == corner_2 and node_north.param2 == 3))
				then
					minetest.set_node(pos, {name=corner_2, param2=0})
				end
		
				if ((node_north.name == roof and node_north.param2 == 3)
				or (node_north.name == corner_2 and node_north.param2 == 2))
				and ((node_east.name == roof and node_east.param2 == 2)
				or (node_east.name == corner_2 and node_east.param2 == 0))
				then
					minetest.set_node(pos, {name=corner_2, param2=1})
				end
		
				if ((node_east.name == roof and node_east.param2 == 0)
				or (node_east.name == corner_2 and node_east.param2 == 3))
				and ((node_south.name == roof and node_south.param2 == 3)
				or (node_south.name == corner_2 and node_south.param2 == 1))
				then
					minetest.set_node(pos, {name=corner_2, param2=2})
				end
		
				if ((node_south.name == roof and node_south.param2 == 1)
				or (node_south.name == corner_2 and node_south.param2 == 0))
				and ((node_west.name == roof and node_west.param2 == 0)
				or (node_west.name == corner_2 and node_west.param2 == 2))
				then
					minetest.set_node(pos, {name=corner_2, param2=3})
				end

			end,
		})
	end
end

-----------------------------------------------------------------------------------------------
-- Wet Reed Roof Corner
-----------------------------------------------------------------------------------------------
minetest.register_node("default:wetreed_roof_corner", {
	description = "Wet Reed Roof Corner",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed_wet.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet Reed Roof Corner 2
-----------------------------------------------------------------------------------------------
minetest.register_node("default:wetreed_roof_corner_2", {
	description = "Wet Reed Roof Corner 2",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed_wet.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})
		
-----------------------------------------------------------------------------------------------
-- Wet Reed becomes (dry) Reed over time
-----------------------------------------------------------------------------------------------
if REED_WILL_DRY == true then

	local DRyiNG = {
--	  	  WeT									 DRy
		{"default:wetreed",					"default:reed"},
		{"default:wetreed_slab",				"default:reed_slab"},
		{"default:wetreed_roof",				"default:reed_roof"},
		{"default:wetreed_roof_corner",		"default:reed_roof_corner"},
		{"default:wetreed_roof_corner_2",		"default:reed_roof_corner_2"}
	}
	for i in pairs(DRyiNG) do

		local WeT = DRyiNG[i][1]
		local DRy = DRyiNG[i][2]

		minetest.register_abm({
			nodenames = {WeT},
			interval = REED_DRYING_TIME, --1200, -- 20 minutes: a minetest-day/night-cycle
			chance = 1,
			action = function(pos)
				local direction = minetest.get_node(pos).param2
				minetest.set_node(pos, {name=DRy, param2=direction})
			end,
		})
	end
end

-----------------------------------------------------------------------------------------------
-- Reed
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reed", {
	description = "Reed",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed.png"},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Reed Slab
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reed_slab", {
	description = "Reed Slab",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed.png"},
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Reed Roof
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reed_roof", {
	description = "Reed Roof",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Reed Roof Corner
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reed_roof_corner", {
	description = "Reed Roof Corner",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Reed Roof Corner 2
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reed_roof_corner_2", {
	description = "Reed Roof Corner 2",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	groups = {snappy=3, flammable=2, plant_fiber = 1},
	sounds = default.node_sound_leaves_defaults(),
})


-----------------------------------------------------------------------------------------------
-- Grasses - Reedmace 0.1.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- textures & ideas partly by Neuromancer

-- License (everything): 	WTFPL
-- Contains code from: 		plants_lib
-- Looked at code from:		default, trees				
-----------------------------------------------------------------------------------------------

-- NOTES (from wikipedia, some of this might get implemented)
-- rhizomes are edible
-- outer portion of young plants can be peeled and the heart can be eaten raw or boiled and eaten like asparagus
-- leaf bases can be eaten raw or cooked
-- sheath can be removed from the developing green flower spike, which can then be boiled and eaten like corn on the cob
-- pollen can be collected and used as a flour supplement or thickener
-- Typha stems and leaves can be used to make paper
-- The seed hairs were used by some Native American groups as tinder for starting fires

-----------------------------------------------------------------------------------------------
-- REEDMACE SHAPES
-----------------------------------------------------------------------------------------------

default.grow_reedmace = function(pos)
	local size = math.random(1,3)
	local spikes = math.random(1,3)
	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	local pos_02 = {x = pos.x, y = pos.y + 2, z = pos.z}
	local pos_03 = {x = pos.x, y = pos.y + 3, z = pos.z}
	if minetest.get_node(pos_01).name == "air"  -- bug fix
	or minetest.get_node(pos_01).name == "default:reedmace_sapling" then
		if minetest.get_node(pos_02).name ~= "air" then
			minetest.set_node(pos_01, {name="default:reedmace_top"})
		elseif minetest.get_node(pos_03).name ~= "air" then
			minetest.set_node(pos_01, {name="default:reedmace_height_2"})
		elseif size == 1 then
			minetest.set_node(pos_01, {name="default:reedmace_top"})
		elseif size == 2 then
			minetest.set_node(pos_01, {name="default:reedmace_height_2"})
		elseif size == 3 then
			if spikes == 1 then
				minetest.set_node(pos_01, {name="default:reedmace_height_3_spikes"})
			else
				minetest.set_node(pos_01, {name="default:reedmace_height_3"})
			end
		end
	end
end

default.grow_reedmace_water = function(pos)
	local size = math.random(1,3)
	local spikes = math.random(1,3)
	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	local pos_02 = {x = pos.x, y = pos.y + 2, z = pos.z}
	local pos_03 = {x = pos.x, y = pos.y + 3, z = pos.z}
	local pos_04 = {x = pos.x, y = pos.y + 4, z = pos.z}
	minetest.add_entity(pos_01, "default:reedmace_water_entity")
	if minetest.get_node(pos_02).name == "air" then -- bug fix
		if minetest.get_node(pos_03).name ~= "air" then
			minetest.set_node(pos_02, {name="default:reedmace_top"})
		elseif minetest.get_node(pos_04).name ~= "air" then
			minetest.set_node(pos_02, {name="default:reedmace_height_2"})
		elseif size == 1 then
			minetest.set_node(pos_02, {name="default:reedmace_top"})
		elseif size == 2 then
			minetest.set_node(pos_02, {name="default:reedmace_height_2"})
		elseif size == 3 then
			if spikes == 1 then
				minetest.set_node(pos_02, {name="default:reedmace_height_3_spikes"})
			else
				minetest.set_node(pos_02, {name="default:reedmace_height_3"})
			end	
		end
	end
end

-----------------------------------------------------------------------------------------------
-- REEDMACE SPIKES
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_spikes", {
	description = "Reedmace",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"dryplants_reedmace_spikes.png"},
	inventory_image = "dryplants_reedmace_spikes.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		plant_fiber = 1,
		not_in_creative_inventory=1
	},
	drop = 'default:reedmace_sapling',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})
-----------------------------------------------------------------------------------------------
-- REEDMACE height: 1
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_top", {
	description = "Reedmace, height: 1",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"dryplants_reedmace_top.png"},
	inventory_image = "dryplants_reedmace_top.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		plant_fiber = 1,
		not_in_creative_inventory=1
	},
	drop = 'default:reedmace_sapling',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})
-----------------------------------------------------------------------------------------------
-- REEDMACE height: 2
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_height_2", {
	description = "Reedmace, height: 2",
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	tiles = {"dryplants_reedmace_height_2.png"},
	inventory_image = "dryplants_reedmace_top.png",
	walkable = false,
	groups = {
		snappy=3,
		plant_fiber = 1,
		flammable=2--,
		--not_in_creative_inventory=1
	},
	drop = 'default:reedmace_sapling',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})
-----------------------------------------------------------------------------------------------
-- REEDMACE height: 3
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_height_3", {
	description = "Reedmace, height: 3",
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	tiles = {"dryplants_reedmace_height_3.png"},
	inventory_image = "dryplants_reedmace_top.png",
	walkable = false,
	groups = {
		snappy=3,
		plant_fiber = 1,
		flammable=2--,
		--not_in_creative_inventory=1
	},
	drop = 'default:reedmace_sapling',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})
-----------------------------------------------------------------------------------------------
-- REEDMACE height: 3 & Spikes
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_height_3_spikes", {
	description = "Reedmace, height: 3 & Spikes",
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	tiles = {"dryplants_reedmace_height_3_spikes.png"},
	inventory_image = "dryplants_reedmace_top.png",
	walkable = false,
	groups = {
		snappy=3,
		plant_fiber = 1,
		flammable=2--,
		--not_in_creative_inventory=1
	},
	drop = 'default:reedmace_sapling',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})
-----------------------------------------------------------------------------------------------
-- REEDMACE STEMS
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace", {
	description = "Reedmace",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"dryplants_reedmace.png"},
	inventory_image = "dryplants_reedmace.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		plant_fiber = 1,
		not_in_creative_inventory=1
	},
	drop = 'default:reedmace_sapling',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
        if node.name == "default:reedmace_top"
		or node.name == "default:reedmace_spikes" then 
            minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z}) 
            minetest.add_item(pos,"default:reedmace_sapling")
        end
    end,
})
-----------------------------------------------------------------------------------------------
-- REEDMACE BOTTOM
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_bottom", {
	description = "Reedmace",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"dryplants_reedmace_bottom.png"},
	inventory_image = "dryplants_reedmace_bottom.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		plant_fiber = 1,
		not_in_creative_inventory=1
	},
	drop = 'default:reedmace_sapling',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
        if node.name == "default:reedmace" 
		or node.name == "default:reedmace_top"
		or node.name == "default:reedmace_spikes" then 
            minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z}) 
            minetest.add_item(pos,"default:reedmace_sapling")
        end
    end,
})
-----------------------------------------------------------------------------------------------
-- REEDMACE "SAPLING" (the drop from the above)
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_sapling", {
	description = "Reedmace",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"dryplants_reedmace_sapling.png"},
	inventory_image = "dryplants_reedmace_sapling.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		plant_fiber = 1,
		attached_node=1, dig_by_water = 1
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})
-- abm
minetest.register_abm({
	nodenames = "default:reedmace_sapling",
	interval = REEDMACE_GROWING_TIME,
	chance = 100/REEDMACE_GROWING_CHANCE,
	action = function(pos, node, _, _)
		if string.find(minetest.get_node({x = pos.x + 1, y = pos.y, z = pos.z	 }).name, "default:water")
		or string.find(minetest.get_node({x = pos.x, 	 y = pos.y, z = pos.z + 1}).name, "default:water")
		or string.find(minetest.get_node({x = pos.x - 1, y = pos.y, z = pos.z	 }).name, "default:water")
		or string.find(minetest.get_node({x = pos.x, 	 y = pos.y, z = pos.z - 1}).name, "default:water") then
			if minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" then
				default.grow_reedmace_water({x = pos.x, y = pos.y - 1, z = pos.z})
			end
			minetest.set_node({x=pos.x, y=pos.y, z=pos.z}, {name="default:water_source"})
		else
			default.grow_reedmace({x = pos.x, y = pos.y - 1, z = pos.z})
		end
    end
})
-----------------------------------------------------------------------------------------------
-- REEDMACE WATER (for entity)
-----------------------------------------------------------------------------------------------
minetest.register_node("default:reedmace_water", {
	description = "Reedmace",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"dryplants_reedmace_water.png"},
	inventory_image = "dryplants_reedmace_water.png",
	groups = {not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})
-----------------------------------------------------------------------------------------------
-- REEDMACE WATER ENTITY
-----------------------------------------------------------------------------------------------
minetest.register_entity("default:reedmace_water_entity",{
	visual = "mesh",
	mesh = "plantlike.obj",
	visual_size = {x=10, y=10},
	textures = {"dryplants_reedmace_water.png"},
	collisionbox = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
	on_punch = function(self, puncher)
		if puncher:is_player() and puncher:get_inventory() then
			if not minetest.setting_getbool("creative_mode") then
				puncher:get_inventory():add_item("main", "default:reedmace_sapling")
			end
			self.object:remove()
		end
	end,
})
-----------------------------------------------------------------------------------------------
-- SPAWN REEDMACE
-----------------------------------------------------------------------------------------------
--[[default:spawn_on_surfaces({
	spawn_delay = 1200,
	spawn_plants = {"default:reedmace_sapling"},
	spawn_chance = 400,
	spawn_surfaces = {
		"default:dirt_with_grass",
		"default:desert_sand",
		"default:sand",
		"default:grass_short",
		"stoneage:grass_with_silex"
	},
	seed_diff = 329,
	near_nodes = {"default:water_source"},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
})]]
-----------------------------------------------------------------------------------------------
-- GENERATE REEDMACE
-----------------------------------------------------------------------------------------------
-- near water or swamp
default:register_generate_plant({
    surface = {
		"default:dirt_with_grass", 
		"default:desert_sand",
		"stoneage:grass_with_silex",
		"sumpf:peat",
		"sumpf:sumpf"
	},
    max_count = REEDMACE_NEAR_WATER_PER_MAPBLOCK,
    rarity = 101 - REEDMACE_NEAR_WATER_RARITY,
	--rarity = 60,
    min_elevation = 1, -- above sea level
	near_nodes = {"default:water_source","sumpf:dirtywater_source","sumpf:sumpf"},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.grow_reedmace
)
-- in water
default:register_generate_plant({
    surface = {
		"default:dirt",
		"default:dirt_with_grass", 
		--"default:desert_sand",
		--"stoneage:grass_with_silex",
		"stoneage:sand_with_silex",
		"sumpf:peat",
		"sumpf:sumpf"
	},
    max_count = REEDMACE_IN_WATER_PER_MAPBLOCK,
	rarity = 101 - REEDMACE_IN_WATER_RARITY,
    --rarity = 35,
    min_elevation = 0, -- a bit below sea level
	max_elevation = 0, -- ""
	near_nodes = {"default:water_source","sumpf:dirtywater_source"},
	near_nodes_size = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.grow_reedmace_water
)
-- for oases & tropical beaches & tropical swamps
default:register_generate_plant({
    surface = {
		"default:sand",
		"sumpf:sumpf"
	},
    max_count = REEDMACE_FOR_OASES_PER_MAPBLOCK,
    rarity = 101 - REEDMACE_FOR_OASES_RARITY,
	--rarity = 10,
    neighbors = {"default:water_source","sumpf:dirtywater_source","sumpf:sumpf"},
	ncount = 1,
    min_elevation = 1, -- above sea level
	near_nodes = {"default:desert_sand","sumpf:sumpf"},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.grow_reedmace
)





