-- mods/default/nodes.lua


--[[ Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

--]]


--[[ Index:

Stone
-----
(1. Material 2. Cobble variant 3. Brick variant 4. Modified forms)

default:stone
default:cobble
default:stonebrick
default:stone_block
default:mossycobble

default:desert_stone
default:desert_cobble
default:desert_stonebrick
default:desert_stone_block

default:sandstone
default:sandstonebrick
default:sandstone_block
default:desert_sandstone
default:desert_sandstone_brick
default:desert_sandstone_block
default:silver_sandstone
default:silver_sandstone_brick
default:silver_sandstone_block

default:obsidian
default:obsidianbrick
default:obsidian_block

Soft / Non-Stone
----------------
(1. Material 2. Modified forms)

default:dirt
default:dirt_with_grass
default:dirt_with_grass_footsteps
default:dirt_with_dry_grass
default:dirt_with_snow
default:dirt_with_rainforest_litter

default:sand
default:desert_sand
default:silver_sand

default:gravel

default:clay

default:snow
default:snowblock

default:ice

Trees
-----
(1. Trunk 2. Fabricated trunk 3. Leaves 4. Sapling 5. Fruits)

default:tree
default:wood
default:leaves
default:sapling
default:apple

default:jungletree
default:junglewood
default:jungleleaves
default:junglesapling

default:pine_tree
default:pine_wood
default:pine_needles
default:pine_sapling

default:acacia_tree
default:acacia_wood
default:acacia_leaves
default:acacia_sapling

default:aspen_tree
default:aspen_wood
default:aspen_leaves
default:aspen_sapling

Ores
----
(1. In stone 2. Blocks)

default:stone_with_coal
default:coalblock

default:stone_with_iron
default:steelblock

default:stone_with_copper
default:copperblock

default:stone_with_tin
default:tinblock

default:bronzeblock

default:stone_with_gold
default:goldblock

default:stone_with_mese
default:mese

default:stone_with_diamond
default:diamondblock

Plantlife
---------

default:cactus
default:papyrus
default:dry_shrub
default:junglegrass

default:grass_1
default:grass_2
default:grass_3
default:grass_4
default:grass_5

default:dry_grass_1
default:dry_grass_2
default:dry_grass_3
default:dry_grass_4
default:dry_grass_5

default:bush_stem
default:bush_leaves
default:bush_sapling
default:acacia_bush_stem
default:acacia_bush_leaves
default:acacia_bush_sapling

Corals
------

default:coral_brown
default:coral_orange
default:coral_skeleton

Liquids
-------
(1. Source 2. Flowing)

default:water_source
default:water_flowing

default:river_water_source
default:river_water_flowing

default:lava_source
default:lava_flowing

Tools / "Advanced" crafting / Non-"natural"
-------------------------------------------

default:chest
default:chest_locked

default:bookshelf

default:sign_wall_wood
default:sign_wall_steel

default:ladder_wood
default:ladder_steel

default:fence_wood
default:fence_acacia_wood
default:fence_junglewood
default:fence_pine_wood
default:fence_aspen_wood

default:glass
default:obsidian_glass

default:brick

default:meselamp
default:mese_post_light

Misc
----

default:cloud

--]]

--maikerumine egg
minetest.register_node("default:maikerumine_stone", {
	description = "Maikerumine Glow Grow Stone",
	tiles = {"(foo.png)^(icon.png^[makealpha:255,255,255)"},
	groups = {cracky = 1, stone = 1, soil = 1, spreading_dirt_type = 1
	--, not_in_creative_inventory = 1
	},
	drop = 'cavestuff:pebble_1 3',
	sunlight_propagates = true,
	light_source = 13,
	paramtype = "light",
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

--invis
minetest.register_node("default:invis", {
	description = "Invisable Node",
	drawtype = "airlike",
	tiles = {"(bubble.png)^(icon.png^[makealpha:255,255,255)"},
			node_box = {
		type = "fixed",
		--fixed = {-1/14, -1/12, -1/14, 1/14, 1/12, 1/14},
		fixed = {0.1, 0.1,0.1, 0.1, 0.1,0.1},
	},
	selection_box = {
		type = "fixed",
		--fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		fixed = {0.1, 0.1,0.1, 0.1, 0.1,0.1},
	},
	
	groups = { not_in_creative_inventory = 1
	},
	--drop = 'cavestuff:pebble_1 3',
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	sunlight_propagates = true,
	paramtype = "light",
	legacy_mineral = true,
	sounds = default.node_sound_metal_defaults(),
})

--
-- Stone
--

minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:pebble_1 3',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	drop = 'default:pebble_1 3',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stonebrick", {
	description = "Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_stone_brick.png"},
	drop = 'default:cobble 4',
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_block", {
	description = "Stone Block",
	tiles = {"default_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"default_mossycobble.png"},
	drop = 'default:pebble_1 3',
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone", {
	description = "Desert Stone",
	tiles = {"default_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:desert_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_cobble", {
	description = "Desert Cobblestone",
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stonebrick", {
	description = "Desert Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_block", {
	description = "Desert Stone Block",
	tiles = {"default_desert_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})
<<<<<<< HEAD

minetest.register_node("default:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstonebrick", {
	description = "Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

=======

minetest.register_node("default:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstonebrick", {
	description = "Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

>>>>>>> 86dc014e7c1625a2766b034656883b4bfa4322fb
minetest.register_node("default:sandstone_block", {
	description = "Sandstone Block",
	tiles = {"default_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_sandstone", {
	description = "Desert Sandstone",
	tiles = {"default_desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_sandstone_brick", {
	description = "Desert Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_sandstone_block", {
	description = "Desert Sandstone Block",
	tiles = {"default_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:silver_sandstone", {
	description = "Silver Sandstone",
	tiles = {"default_silver_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:silver_sandstone_brick", {
	description = "Silver Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_silver_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:silver_sandstone_block", {
	description = "Silver Sandstone Block",
	tiles = {"default_silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("default:obsidianbrick", {
	description = "Obsidian Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("default:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})
--
-- Soft / Non-Stone
--

minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'default:slug_raw'},
			rarity = 30,
			},
			{
			items = {'default:worm_raw'},
			rarity = 30,
			},
			{
			items = {'default:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
	groups = {crumbly = 2, soil = 1, falling_node = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
<<<<<<< HEAD
	drop = {
		max_items = 2,
		items = {
			{
			items = {'default:slug_raw'},
			rarity = 30,
			},
			{
			items = {'default:worm_raw'},
			rarity = 30,
			},
			{
			items = {'default:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
=======
	drop = 'default:dirt',
>>>>>>> 86dc014e7c1625a2766b034656883b4bfa4322fb
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_grass_footsteps", {
	description = "Dirt with Grass and Footsteps",
	tiles = {"default_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, not_in_creative_inventory = 1, falling_node = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass",
	tiles = {"default_dry_grass.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("default:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, spreading_dirt_type = 1, snowy = 1, falling_node = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("default:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter",
	tiles = {
		"default_rainforest_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
<<<<<<< HEAD
	drop = {
		max_items = 2,
		items = {
			{
			items = {'default:slug_raw'},
			rarity = 30,
			},
			{
			items = {'default:worm_raw'},
			rarity = 30,
			},
			{
			items = {'default:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
=======
	drop = "default:dirt",
>>>>>>> 86dc014e7c1625a2766b034656883b4bfa4322fb
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("default:dirt_with_coniferous_litter", {
	description = "Dirt with Coniferous Litter",
	tiles = {
		"default_coniferous_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_coniferous_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1},
<<<<<<< HEAD
	drop = {
		max_items = 2,
		items = {
			{
			items = {'default:slug_raw'},
			rarity = 30,
			},
			{
			items = {'default:worm_raw'},
			rarity = 30,
			},
			{
			items = {'default:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
=======
	drop = "default:dirt",
>>>>>>> 86dc014e7c1625a2766b034656883b4bfa4322fb
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("default:permafrost", {
	description = "Permafrost",
	tiles = {"default_permafrost.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:permafrost_with_stones", {
	description = "Permafrost with Stones",
	tiles = {"default_permafrost.png^default_stones.png",
		"default_permafrost.png"},
	groups = {cracky = 2},
	drop = "default:permafrost",
	sounds = default.node_sound_gravel_defaults(),
})

minetest.register_node("default:permafrost_with_moss", {
	description = "Permafrost with Moss",
	tiles = {"default_moss.png", "default_permafrost.png",
		{name = "default_permafrost.png^default_moss_side.png",
			tileable_vertical = false}},
	groups = {cracky = 2},
	drop = "default:permafrost",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:desert_sand", {
	description = "Desert Sand",
	tiles = {"default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:silver_sand", {
	description = "Silver Sand",
	tiles = {"default_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

--quicksand desert / survival sand
minetest.register_node("default:quicksand_shore", {
	description = "Quicksand",
	tiles = {"default_desert_sand.png^default_footprint.png"},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'survival:oyster_raw'},
			rarity = 2,
			},
			{
			items = {'survival:mussel_raw'},
			rarity = 2,
			},
			{
			items = {'default:desert_sand'},
			},
			},
		},
	liquid_viscosity = 19,
	liquidtype = "source",
	liquid_alternative_flowing = "default:quicksand_shore",
	liquid_alternative_source = "default:quicksand_shore",
	liquid_renewable = false,
	liquid_range = 0,
	drowning = 3,
	walkable = false,
	climbable = false,
	liquid_renewable = false,
	post_effect_color = { a = 255, r = 43, g = 23, b = 9 },
	groups = {crumbly=3, falling_node=1, sand=1, liquid=3, disable_jump=1},
	sounds = default.node_sound_sand_defaults(),
})
minetest.register_abm({
	nodenames = {"default:sand_with_food_trail","default:quicksand_shore"},
	interval = 12.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		hacky_swap_node(pos,"default:quicksand_shore")
		return
	end,
})

--quicksand
minetest.register_node("default:quicksand_beach", {
	description = "Quicksand",
	tiles = {"default_sand.png^default_footprint.png"},
	drop = "default:sand",
	liquid_viscosity = 19,
	liquidtype = "source",
	liquid_alternative_flowing = "default:quicksand_beach",
	liquid_alternative_source = "default:quicksand_beach",
	liquid_renewable = false,
	liquid_range = 0,
	drowning = 3,
	walkable = false,
	climbable = false,
	liquid_renewable = false,
	post_effect_color = { a = 255, r = 43, g = 23, b = 9 },
	groups = {crumbly=3, falling_node=1, sand=1, liquid=3, disable_jump=1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_abm({
	nodenames = {"default:sand_trail"},
	neighbors = {"default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 1,
	action = function(pos)
		minetest.env:add_node(pos, {name="default:quicksand_beach"})
	end,
})

minetest.register_node("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 3, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'default:flint'}, rarity = 16},
			{items = {'default:gravel'}}
		}
	}
})

minetest.register_node("default:clay", {
	description = "Clay",
	tiles = {"default_clay.png"},
	groups = {crumbly = 3},
	drop = 'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults(),
})


minetest.register_node("default:snow", {
	description = "Snow",
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1, snowy = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

minetest.register_node("default:snowblock", {
	description = "Snow Block",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1, falling_node = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

-- 'is ground content = false' to avoid tunnels in sea ice or ice rivers
minetest.register_node("default:ice", {
	description = "Ice",
	tiles = {"default_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1, slippery = 3},
	sounds = default.node_sound_glass_defaults(),
})

-- Mapgen-placed ice with 'is ground content = true' to contain tunnels
minetest.register_node("default:cave_ice", {
	description = "Cave Ice",
	tiles = {"default_ice.png"},
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1, slippery = 3},
	drop = "default:ice",
	sounds = default.node_sound_glass_defaults(),
})

--
-- Trees
--



	

minetest.register_node("default:tree_extracted", {
	description = "Tree Extracted  --Use for fuel now",
	--tiles = {"default_tree_top.png^[colorize:gray:75", "default_tree_top.png^[colorize:gray:75", "default_tree.png^[colorize:gray:75"},
	tiles = {"default_tree_top.png^[colorize:gray:75", "default_tree_top.png^[colorize:gray:75", "default_tree_top.png^[colorize:gray:75"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2, falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:tree", {
	description = "Tree",
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2, falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:wood", {
	description = "Wooden Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_wood.png"},
	drop = 'default:stick 4',
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})



minetest.register_node("default:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, dig_by_water = 1},

	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'default:sapling'},
				rarity = 20,
			},
			--{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				--items = {'default:leaves'},
			--}
			{
				-- player will get sapling with 1/40 chance
				items = {'default:apple'},
				rarity = 40,
			},
		}
	},
	

	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,

})

--[[
minetest.register_node("default:apple", {
	description = "Apple",
	drawtype = "plantlike",
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, falling_node=1, dig_by_water = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "default:apple", param2 = 1})
		end
	end,
})
]]

--==new mt code
minetest.register_node("default:apple", {
	description = "Apple",
	drawtype = "plantlike",
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1, falling_node=1, dig_by_water = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "default:apple", param2 = 1})
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if oldnode.param2 == 0 then
			minetest.set_node(pos, {name = "default:apple_mark"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
})

minetest.register_node("default:apple_mark", {
	description = "Apple Marker",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_timer = function(pos, elapsed)
		if not minetest.find_node_near(pos, 1, "default:leaves") then
			minetest.remove_node(pos)
		elseif minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "default:apple"})
		end
	end
})
--==


minetest.register_node("default:jungletree", {
	description = "Jungle Tree",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png",
		"default_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2,falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:junglewood", {
	description = "Jungle Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_junglewood.png"},
	is_ground_content = false,
	drop = 'default:stick 4',
	groups = {choppy = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:jungleleaves", {
	description = "Jungle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_jungleleaves.png"},
	special_tiles = {"default_jungleleaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, dig_by_water = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:junglesapling'}, rarity = 20},
			--{items = {'default:jungleleaves'}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,

})
--[[
minetest.register_node("default:junglesapling", {
	description = "Jungle Sapling",
	drawtype = "plantlike",
	tiles = {"default_junglesapling.png"},
	inventory_image = "default_junglesapling.png",
	wield_image = "default_junglesapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:junglesapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})
]]
--==new mt
minetest.register_node("default:junglesapling", {
	description = "Jungle Tree Sapling",
	drawtype = "plantlike",
	tiles = {"default_junglesapling.png"},
	inventory_image = "default_junglesapling.png",
	wield_image = "default_junglesapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:junglesapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("default:emergent_jungle_sapling", {
	description = "Emergent Jungle Tree Sapling",
	drawtype = "plantlike",
	tiles = {"default_emergent_jungle_sapling.png"},
	inventory_image = "default_emergent_jungle_sapling.png",
	wield_image = "default_emergent_jungle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:emergent_jungle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -3, y = -5, z = -3},
			{x = 3, y = 31, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})




--EXTRA TREES


minetest.register_node("default:pine_tree", {
	description = "Pine Tree",
	tiles = {"default_pine_tree_top.png", "default_pine_tree_top.png",
		"default_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	drop = "default:tree",
	groups = {tree = 1, choppy = 3, flammable = 3,falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})
--[[
minetest.register_node("default:pine_wood", {
	description = "Pine Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_pine_wood.png"},
	is_ground_content = false,
	drop = "default:wood",
	groups = {choppy = 3, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
]]
minetest.register_node("default:pine_needles",{
	description = "Pine Needles",
	drawtype = "allfaces_optional",
	tiles = {"default_pine_needles.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, dig_by_water = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_sapling"}, rarity = 20},
			--{items = {"default:pine_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,

})

minetest.register_node("default:pine_sapling", {
	description = "Pine Sapling",
	drawtype = "plantlike",
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})


minetest.register_node("default:acacia_tree", {
	description = "Acacia Tree",
	tiles = {"default_acacia_tree_top.png", "default_acacia_tree_top.png",
		"default_acacia_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	drop = "default:tree",
	groups = {tree = 1, choppy = 2, flammable = 2,falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})
--[[
minetest.register_node("default:acacia_wood", {
	description = "Acacia Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_acacia_wood.png"},
	is_ground_content = false,
	drop = "default:wood",
	groups = {choppy = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
]]
minetest.register_node("default:acacia_leaves", {
	description = "Acacia Leaves",
	drawtype = "allfaces_optional",
	tiles = {"default_acacia_leaves.png"},
	special_tiles = {"default_acacia_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, dig_by_water = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:acacia_sapling"}, rarity = 20},
			--{items = {"default:acacia_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,

})

minetest.register_node("default:acacia_sapling", {
	description = "Acacia Tree Sapling",
	drawtype = "plantlike",
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:acacia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 6, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("default:aspen_tree", {
	description = "Aspen Tree",
	tiles = {"default_aspen_tree_top.png", "default_aspen_tree_top.png",
		"default_aspen_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	drop = "default:tree",
	groups = {tree = 1, choppy = 3, flammable = 3,falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})
--[[
minetest.register_node("default:aspen_wood", {
	description = "Aspen Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_aspen_wood.png"},
	is_ground_content = false,
	drop = "default:wood",
	groups = {choppy = 3, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
]]
minetest.register_node("default:aspen_leaves", {
	description = "Aspen Leaves",
	drawtype = "allfaces_optional",
	tiles = {"default_aspen_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, dig_by_water = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:aspen_sapling"}, rarity = 20},
			--{items = {"default:aspen_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
	

})

minetest.register_node("default:aspen_sapling", {
	description = "Aspen Tree Sapling",
	drawtype = "plantlike",
	tiles = {"default_aspen_sapling.png"},
	inventory_image = "default_aspen_sapling.png",
	wield_image = "default_aspen_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:aspen_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

--[[
--============
default.register_leave = function()
local leave_name = 'default:leaves'
local drop_node = leave_name
end
--============
default.dig_leaves = function( pos, node_name, user )
  --only dig give the leaves if shears are used
	if not user then return false end
  local wielded = user:get_wielded_item()
  if 'default:tool_shears' == wielded:get_name() then
    local inv = user:get_inventory()
    if inv then
      inv:add_item("main", ItemStack( node_name ))
    end
  end
end


--FROM VINES
	after_dig_node = function( pos, node, oldmetadata, user )
      default.dig_leaves( pos, drop_node, user )
    end
--============
]]

--
-- Ores
--

minetest.register_node("default:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coalblock", {
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('default:charcoal_block', {
	description = 'Charcoal Block',
	tiles = {'more_fire_charcoal_block.png'},
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=2,cracky=3,flammable=1,},
})

--I R O N
minetest.register_node("default:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:steelblock", {
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:redhot_steelblock", {
	description = "Redhot Steel Block  --Let sit outside to cool into Steelblock",
	tiles = {"default_steel_block.png^[colorize:red:175"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

--C O P P E R
--[[
minetest.register_node("default:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})
]]
minetest.register_node("default:copperblock", {
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:orangehot_copperblock", {
	description = "Orangehot Copper Block",
	tiles = {"default_copper_block.png^[colorize:red:75"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})



minetest.register_abm({
	nodenames = {"default:redhot_steelblock","default:steelblock"},
	interval = 112.0,
	chance = 3,
	drop = "default:redhot_steel_ingot 9",
	light_source = 14,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Redhot Steel Block just cooled, craft some ingots now.")
			hacky_swap_node(pos,"default:steelblock")
			return
	end,
	on_rightclick = function(pos, node, clicker)
			minetest.sound_play("heads_ow", {
			pos = ppos,
			max_hear_distance = 10,
			gain = 10.0,
			})
			clicker:set_hp( 1)
			local holding = clicker:get_wielded_item()
			if holding:to_string() ~= "" then
				-- take stack
				local sta = holding:take_item(holding:get_count())
				clicker:set_wielded_item(holding)
				-- incase of lag, reset stack
				minetest.after(0.1, function()
					clicker:set_wielded_item(holding)
					-- drop stack
					local obj = minetest.add_item(clicker:getpos(), sta)
					obj:setvelocity({x = 0, y = 5, z = 0})
				end)
			end
		--end
	end,
})


--
-- Plantlife (non-cubic)
--

minetest.register_node("default:cactus", {
	description = "Cactus",
	tiles = {"default_cactus_top.png", "default_cactus_top.png",
		"default_cactus_side.png"},
	paramtype2 = "facedir",
	groups = {choppy = 3, falling_node=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("default:papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2, plant_fiber = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_node("default:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1, falling_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16},
	},
})

minetest.register_node("default:junglegrass", {
	description = "Jungle Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.69,
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1, plant_fiber = 1, falling_node=1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 1.19, 7 / 16},
	},
})


minetest.register_node("default:grass_1", {
	description = "Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1,  plant_fiber = 1, falling_node=1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("default:grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:grass_" .. i, {
		description = "Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_grass_" .. i .. ".png"},
		inventory_image = "default_grass_" .. i .. ".png",
		wield_image = "default_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "default:grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1, plant_fiber = 1, falling_node=1, dig_by_water = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:dry_grass_1", {
	description = "Dry Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_grass_1.png"},
	inventory_image = "default_dry_grass_3.png",
	wield_image = "default_dry_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1, dry_grass = 1, plant_fiber = 1, falling_node=1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("default:dry_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:dry_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:dry_grass_" .. i, {
		description = "Dry Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_dry_grass_" .. i .. ".png"},
		inventory_image = "default_dry_grass_" .. i .. ".png",
		wield_image = "default_dry_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, falling_node=1,
			not_in_creative_inventory=1, dry_grass = 1, dig_by_water = 1},
		drop = "default:dry_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:fern_1", {
	description = "Fern",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_fern_1.png"},
	inventory_image = "default_fern_1.png",
	wield_image = "default_fern_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, plant_fiber = 1, falling_node=1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random fern node
		local stack = ItemStack("default:fern_" .. math.random(1, 3))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:fern_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	minetest.register_node("default:fern_" .. i, {
		description = "Fern",
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 2,
		tiles = {"default_fern_" .. i .. ".png"},
		inventory_image = "default_fern_" .. i .. ".png",
		wield_image = "default_fern_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1, plant_fiber = 1, falling_node=1, dig_by_water = 1},
		drop = "default:fern_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})
end


minetest.register_node("default:marram_grass_1", {
	description = "Marram Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_marram_grass_1.png"},
	inventory_image = "default_marram_grass_1.png",
	wield_image = "default_marram_grass_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1, plant_fiber = 1, falling_node=1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random marram grass node
		local stack = ItemStack("default:marram_grass_" .. math.random(1, 3))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:marram_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	minetest.register_node("default:marram_grass_" .. i, {
		description = "Marram Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_marram_grass_" .. i .. ".png"},
		inventory_image = "default_marram_grass_" .. i .. ".png",
		wield_image = "default_marram_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, attached_node = 1,
			not_in_creative_inventory=1, plant_fiber = 1, falling_node=1, dig_by_water = 1},
		drop = "default:marram_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})
end

--EXTRA Plantlife
minetest.register_node("default:bush_stem", {
	description = "Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_bush_stem.png"},
	inventory_image = "default_bush_stem.png",
	wield_image = "default_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, falling_node=1},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("default:bush_leaves", {
	description = "Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, falling_node=1, dig_by_water = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:bush_sapling"}, rarity = 5},
			--{items = {"default:bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:bush_sapling", {
	description = "Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_bush_sapling.png"},
	inventory_image = "default_bush_sapling.png",
	wield_image = "default_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, falling_node=1 ,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("default:acacia_bush_stem", {
	description = "Acacia Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_acacia_bush_stem.png"},
	inventory_image = "default_acacia_bush_stem.png",
	wield_image = "default_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, falling_node=1},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("default:acacia_bush_leaves", {
	description = "Acacia Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_acacia_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, falling_node=1, dig_by_water = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:acacia_bush_sapling"}, rarity = 5},
			--{items = {"default:acacia_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:acacia_bush_sapling", {
	description = "Acacia Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_acacia_bush_sapling.png"},
	inventory_image = "default_acacia_bush_sapling.png",
	wield_image = "default_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 2 / 16, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("default:sand_with_kelp", {
	description = "Kelp",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_kelp.png", tileable_vertical = true}},
	inventory_image = "default_kelp.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-2/16, 0.5, -2/16, 2/16, 3.5, 2/16},
		},
	},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",

	on_place = function(itemstack, placer, pointed_thing)
		-- Call on_rightclick if the pointed node defines it
		if pointed_thing.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = minetest.get_node(pointed_thing.under)
			local def_ptu = minetest.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
					itemstack, pointed_thing)
			end
		end

		local pos = pointed_thing.under
		if minetest.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		local height = math.random(4, 6)
		local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
		local node_top = minetest.get_node(pos_top)
		local def_top = minetest.registered_nodes[node_top.name]
		local player_name = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				minetest.get_item_group(node_top.name, "water") > 0 then
			if not minetest.is_protected(pos, player_name) and
					not minetest.is_protected(pos_top, player_name) then
				minetest.set_node(pos, {name = "default:sand_with_kelp",
					param2 = height * 16})
				if not (creative and creative.is_enabled_for
						and creative.is_enabled_for(player_name)) then
					itemstack:take_item()
				end
			else
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:sand"})
	end
})

--
-- Corals
--

minetest.register_node("default:coral_brown", {
	description = "Brown Coral",
	tiles = {"default_coral_brown.png"},
	groups = {cracky = 3},
	drop = "default:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_orange", {
	description = "Orange Coral",
	tiles = {"default_coral_orange.png"},
	groups = {cracky = 3},
	drop = "default:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_skeleton", {
	description = "Coral Skeleton",
	tiles = {"default_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


--
-- Liquids
--

minetest.register_node("default:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	--groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1, falling_node=1},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("default:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"default_river_water.png"},
	special_tiles = {
		{
			name = "default_river_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_river_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})



minetest.register_node("default:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("default:lava_flowing", {
	description = "Flowing Lava",
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

--MOLTEN METAL!!!
minetest.register_node("default:metal_molten_source", {
	description = "Molten Iiron Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_molten_iron_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "default_molten_iron_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:metal_molten_flowing",
	liquid_alternative_source = "default:metal_molten_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("default:metal_molten_flowing", {
	description = "Flowing Molten Iron",
	drawtype = "flowingliquid",
	tiles = {"default_molten_iron.png"},
	special_tiles = {
		{
			name = "default_molten_iron_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "default_molten_iron_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:metal_molten_flowing",
	liquid_alternative_source = "default:metal_molten_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})


--[[
--Extra waters
minetest.register_node("default:river_water_source", {
	description = "River Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:river_water_flowing",
	liquid_alternative_source = "default:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("default:river_water_flowing", {
	description = "Flowing River Water",
	drawtype = "flowingliquid",
	tiles = {"default_river_water.png"},
	special_tiles = {
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:river_water_flowing",
	liquid_alternative_source = "default:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})
]]
--
-- Tools / "Advanced" crafting / Non-"natural"
--

local function get_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[8,9]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;8,4;]" ..
		"list[current_player;main;0,4.85;8,1;]" ..
		"list[current_player;main;0,6.08;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]" ..
		default.get_hotbar_bg(0,4.85)
	return formspec
end

local function chest_lid_obstructed(pos)
	local above = { x = pos.x, y = pos.y + 1, z = pos.z }
	local def = minetest.registered_nodes[minetest.get_node(above).name]
	-- allow ladders, signs, wallmounted things and torches to not obstruct
	if def.drawtype == "airlike" or
			def.drawtype == "signlike" or
			def.drawtype == "torchlike" or
			(def.drawtype == "nodebox" and def.paramtype2 == "wallmounted") then
		return false
	end
	return true
end

local open_chests = {}

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "default:chest" then
		return
	end
	if not player or not fields.quit then
		return
	end
	local pn = player:get_player_name()

	if not open_chests[pn] then
		return
	end

	local pos = open_chests[pn].pos
	local sound = open_chests[pn].sound
	local swap = open_chests[pn].swap
	local node = minetest.get_node(pos)

	open_chests[pn] = nil
	for k, v in pairs(open_chests) do
		if v.pos.x == pos.x and v.pos.y == pos.y and v.pos.z == pos.z then
			return true
		end
	end
	minetest.after(0.2, minetest.swap_node, pos, { name = "default:" .. swap,
			param2 = node.param2 })
	minetest.sound_play(sound, {gain = 0.3, pos = pos, max_hear_distance = 10})
	return true
end)

function default.register_chest(name, d)
	local def = table.copy(d)
	def.drawtype = "mesh"
	def.visual = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.legacy_facedir_simple = true
	def.is_ground_content = false

	if def.protected then
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", "Locked Chest")
			meta:set_string("owner", "")
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end
		def.after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
			meta:set_string("infotext", "Locked Chest (owned by " ..
					meta:get_string("owner") .. ")")
		end
		def.can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main") and
					default.can_interact_with_node(player, pos)
		end
		def.allow_metadata_inventory_move = function(pos, from_list, from_index,
				to_list, to_index, count, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return count
		end
		def.allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return stack:get_count()
		end
		def.allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return stack:get_count()
		end
		def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			if not default.can_interact_with_node(clicker, pos) then
				return itemstack
			end

			minetest.sound_play(def.sound_open, {gain = 0.3,
					pos = pos, max_hear_distance = 10})
			if not chest_lid_obstructed(pos) then
				minetest.swap_node(pos,
						{ name = "default:" .. name .. "_open",
						param2 = node.param2 })
			end
			minetest.after(0.2, minetest.show_formspec,
					clicker:get_player_name(),
					"default:chest", get_chest_formspec(pos))
			open_chests[clicker:get_player_name()] = { pos = pos,
					sound = def.sound_close, swap = name }
		end
		def.on_blast = function() end
		def.on_key_use = function(pos, player)
			local secret = minetest.get_meta(pos):get_string("key_lock_secret")
			local itemstack = player:get_wielded_item()
			local key_meta = itemstack:get_meta()

			if key_meta:get_string("secret") == "" then
				key_meta:set_string("secret", minetest.parse_json(itemstack:get_metadata()).secret)
				itemstack:set_metadata("")
			end

			if secret ~= key_meta:get_string("secret") then
				return
			end

			minetest.show_formspec(
				player:get_player_name(),
				"default:chest_locked",
				get_chest_formspec(pos)
			)
		end
		def.on_skeleton_key_use = function(pos, player, newsecret)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			local pn = player:get_player_name()

			-- verify placer is owner of lockable chest
			if owner ~= pn then
				minetest.record_protection_violation(pos, pn)
				minetest.chat_send_player(pn, "You do not own this chest.")
				return nil
			end

			local secret = meta:get_string("key_lock_secret")
			if secret == "" then
				secret = newsecret
				meta:set_string("key_lock_secret", secret)
			end

			return secret, "a locked chest", owner
		end
	else
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", "Chest")
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end
		def.can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main")
		end
		def.on_rightclick = function(pos, node, clicker)
			minetest.sound_play(def.sound_open, {gain = 0.3, pos = pos,
					max_hear_distance = 10})
			if not chest_lid_obstructed(pos) then
				minetest.swap_node(pos, {
						name = "default:" .. name .. "_open",
						param2 = node.param2 })
			end
			minetest.after(0.2, minetest.show_formspec,
					clicker:get_player_name(),
					"default:chest", get_chest_formspec(pos))
			open_chests[clicker:get_player_name()] = { pos = pos,
					sound = def.sound_close, swap = name }
		end
	end

	def.on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. minetest.pos_to_string(pos))
	end
	def.on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to chest at " .. minetest.pos_to_string(pos))
	end
	def.on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from chest at " .. minetest.pos_to_string(pos))
	end
	def.on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "main", drops)
		drops[#drops+1] = "default:chest"
		minetest.remove_node(pos)
		return drops
	end

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_opened.mesh = "chest_open.obj"
	def_opened.drop = "default:" .. name
	def_opened.groups.not_in_creative_inventory = 1
	def_opened.selection_box = {
		type = "fixed",
		fixed = { -1/2, -1/2, -1/2, 1/2, 3/16, 1/2 },
		}
	def_opened.can_dig = function()
		return false
	end

	def_closed.mesh = nil
	def_closed.drawtype = nil
	def_closed.tiles[6] = def.tiles[5] -- swap textures around for "normal"
	def_closed.tiles[5] = def.tiles[3] -- drawtype to make them match the mesh
	def_closed.tiles[3] = def.tiles[3].."^[transformFX"

	minetest.register_node("default:" .. name, def_closed)
	minetest.register_node("default:" .. name .. "_open", def_opened)

	-- convert old chests to this new variant
	minetest.register_lbm({
		label = "update chests to opening chests",
		name = "default:upgrade_" .. name .. "_v2",
		nodenames = {"default:" .. name},
		action = function(pos, node)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", nil)
			local inv = meta:get_inventory()
			local list = inv:get_list("default:chest")
			if list then
				inv:set_size("main", 8*4)
				inv:set_list("main", list)
				inv:set_list("default:chest", nil)
			end
		end
	})
end


default.register_chest("chest", {
	description = "Chest",
	tiles = {
		"default_chest_top.png",
		"default_chest_top.png",
		"default_chest_side.png",
		"default_chest_side.png",
		"default_chest_front.png",
		"default_chest_inside.png"
	},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "default_chest_open",
	sound_close = "default_chest_close",
	groups = {choppy = 2},
})

local function register_sign(material, desc, def)
	minetest.register_node("default:sign_wall_" .. material, {
		description = desc .. " Sign",
		drawtype = "nodebox",
		tiles = {"default_sign_wall_" .. material .. ".png"},
		inventory_image = "default_sign_" .. material .. ".png",
		wield_image = "default_sign_" .. material .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			--local n = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local meta = minetest.get_meta(pos)
			if not fields.text then return end
			minetest.log("action", (player_name or "") .. " wrote \"" ..
				fields.text .. "\" to sign at " .. minetest.pos_to_string(pos))
			meta:set_string("text", fields.text)
			meta:set_string("infotext", '"' .. fields.text .. '"')
		end,
	})
end

register_sign("wood", "Wooden", {
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 2, attached_node = 1, flammable = 2}
})

minetest.register_node("default:ladder_wood", {
	description = "Wooden Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png"},
	inventory_image = "default_ladder_wood.png",
	wield_image = "default_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	drop = "default:glass_fragments",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:brick", {
	description = "Brick Block",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


--
-- register trees for leafdecay
--

if minetest.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"default:tree"},
		leaves = {"default:apple", "default:leaves"},
		radius = 2,
	})

	default.register_leafdecay({
		trunks = {"default:jungletree"},
		leaves = {"default:jungleleaves"},
		radius = 3,
	})

else
	default.register_leafdecay({
		trunks = {"default:tree"},
		leaves = {"default:apple", "default:leaves"},
		radius = 3,
	})

	default.register_leafdecay({
		trunks = {"default:jungletree"},
		leaves = {"default:jungleleaves"},
		radius = 2,
	})

end




--Fence BS


--
-- Fence registration helper
--

function default.register_fence(name, def)
	minetest.register_craft({
		output = name .. " 4",
		recipe = {
			{ def.material, 'default:stick', def.material },
			{ def.material, 'default:stick', def.material },
		}
	})

	local fence_texture = "default_fence_overlay.png^" .. def.texture ..
			"^default_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
	}
	for k, v in pairs(default_fields) do
		if not def[k] then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end


default.register_fence("default:fence_wood", {
	description = "Wooden Fence",
	texture = "default_fence_wood.png",
	inventory_image = "default_fence_overlay.png^default_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

--[[
default.register_fence("default:fence_acacia_wood", {
	description = "Acacia Fence",
	texture = "default_fence_acacia_wood.png",
	inventory_image = "default_fence_overlay.png^default_acacia_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_acacia_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_junglewood", {
	description = "Jungle Wood Fence",
	texture = "default_fence_junglewood.png",
	inventory_image = "default_fence_overlay.png^default_junglewood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_junglewood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_pine_wood", {
	description = "Pine Fence",
	texture = "default_fence_pine_wood.png",
	inventory_image = "default_fence_overlay.png^default_pine_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_pine_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_aspen_wood", {
	description = "Aspen Fence",
	texture = "default_fence_aspen_wood.png",
	inventory_image = "default_fence_overlay.png^default_aspen_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_aspen_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:aspen_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})
]]


--
-- register trees for leafdecay
--

if minetest.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"default:tree"},
		leaves = {"default:apple", "default:leaves"},
		radius = 2,
	})

	default.register_leafdecay({
		trunks = {"default:jungletree"},
		leaves = {"default:jungleleaves"},
		radius = 3,
	})

	default.register_leafdecay({
		trunks = {"default:pine_tree"},
		leaves = {"default:pine_needles"},
		radius = 3,
	})
else
	default.register_leafdecay({
		trunks = {"default:tree"},
		leaves = {"default:apple", "default:leaves"},
		radius = 3,
	})

	default.register_leafdecay({
		trunks = {"default:jungletree"},
		leaves = {"default:jungleleaves"},
		radius = 2,
	})

	default.register_leafdecay({
		trunks = {"default:pine_tree"},
		leaves = {"default:pine_needles"},
		radius = 2,
	})
end

default.register_leafdecay({
	trunks = {"default:acacia_tree"},
	leaves = {"default:acacia_leaves"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:aspen_tree"},
	leaves = {"default:aspen_leaves"},
	radius = 3,
})

default.register_leafdecay({
	trunks = {"default:bush_stem"},
	leaves = {"default:bush_leaves"},
	radius = 1,
})

default.register_leafdecay({
	trunks = {"default:acacia_bush_stem"},
	leaves = {"default:acacia_bush_leaves"},
	radius = 1,
})

--ADD MORE HERE
