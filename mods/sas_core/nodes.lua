
minetest.register_alias("default:maikerumine_stone", "sas_core:maikerumine_stone")
minetest.register_alias("default:invis", "sas_core:invis")
minetest.register_alias("default:lights", "default:torch")
minetest.register_alias("default:quicksand_shore", "sas_core:quicksand_shore")
minetest.register_alias("default:quicksand_beach", "sas_core:quicksand_beach")
minetest.register_alias("default:sand_trail", "sas_core:sand_trail")
minetest.register_alias("default:tree_extracted", "sas_core:tree_extracted")
minetest.register_alias("default:charcoal_block", "sas_core:charcoal_block")

--stel
minetest.register_alias("default:metal_molten_source", "sas_core:metal_molten_source")
minetest.register_alias("default:metal_molten_flowing", "sas_core:metal_molten_flowing")

minetest.register_alias("default:redhot_steelblock", "sas_core:redhot_steelblock")
minetest.register_alias("sas_core:redhot_steel_slab", "stairs:slab_redhot_steelblock")

minetest.register_alias("default:slab_redhot_steelblock", "stairs:slab_redhot_steelblock")
minetest.register_alias("default:stair_redhot_steelblock", "stairs:stair_redhot_steelblock")
minetest.register_alias("default:stair_inner_redhot_steelblock", "stairs:stair_inner_redhot_steelblock")
minetest.register_alias("default:stair_outer_redhot_steelblock", "stairs:stair_outer_redhot_steelblock")
--copperminetest.register_alias("default:orangehot_copperblock", "sas_core:orangehot_copperblock")

minetest.register_alias("default:orangehot_copperslab", "stairs:orangehot_copperblock")
minetest.register_alias("sas_core:orangehot_copper_slab", "stairs:orangehot_copperblock")

minetest.register_alias("default:slab_orangehot_copperblock", "stairs:slab_orangehot_copperblock")
minetest.register_alias("default:stair_orangehot_copperblock", "stairs:stair_orangehot_copperblock")
minetest.register_alias("default:stair_inner_orangehot_copperblock", "stairs:stair_inner_orangehot_copperblock")
minetest.register_alias("default:stair_outer_orangehot_copperblock", "stairs:stair_outer_orangehot_copperblock")



-- mods/sas_core/nodes.lua


--OVERRIDE ITEM
--[[
minetest.override_item("default:mese", {
    light_source = LIGHT_MAX,
    groups = {unbreakable=1},
})
]]

--Remove Default
minetest.register_node(":default:obsidianbrick", {})
minetest.register_node(":stairs:slab_obsidianbrick", {})
minetest.register_node(":stairs:stair_obsidianbrick", {})
minetest.register_node(":stairs:stair_inner_obsidianbrick", {})
minetest.register_node(":stairs:stair_outer_obsidianbrick", {})

minetest.register_node(":default:obsidian_block", {})
minetest.register_node(":stairs:slab_obsidian_block", {})
minetest.register_node(":stairs:stair_obsidian_block", {})
minetest.register_node(":stairs:stair_inner_obsidian_block", {})
minetest.register_node(":stairs:stair_outer_obsidian_block", {})

minetest.register_node(":default:tinblock", {})
minetest.register_node(":stairs:slab_tinblock", {})
minetest.register_node(":stairs:stair_tinblock", {})
minetest.register_node(":stairs:stair_inner_tinblock", {})
minetest.register_node(":stairs:stair_outer_tinblock", {})

minetest.register_node(":default:bronzeblock", {})
minetest.register_node(":stairs:slab_bronzeblock", {})
minetest.register_node(":stairs:stair_bronzeblock", {})
minetest.register_node(":stairs:stair_inner_bronzeblock", {})
minetest.register_node(":stairs:stair_outer_bronzeblock", {})

minetest.register_node(":default:goldblock", {})
minetest.register_node(":stairs:slab_goldblock", {})
minetest.register_node(":stairs:stair_goldblock", {})
minetest.register_node(":stairs:stair_inner_goldblock", {})
minetest.register_node(":stairs:stair_outer_goldblock", {})

minetest.register_node(":default:mese", {})
minetest.register_node(":default:diamondblock", {})

minetest.register_node(":default:sign_wall_steel", {})
minetest.register_node(":default:ladder_steel", {})

minetest.register_node(":default:fence_acacia_wood", {})
minetest.register_node(":default:fence_junglewood", {})
minetest.register_node(":default:fence_pine_wood", {})
minetest.register_node(":default:fence_aspen_wood", {})

minetest.register_node(":default:fence_rail_acacia_wood", {})
minetest.register_node(":default:fence_rail_junglewood", {})
minetest.register_node(":default:fence_rail_pine_wood", {})
minetest.register_node(":default:fence_rail_aspen_wood", {})

minetest.register_node(":doors:gate_acacia_wood", {})
minetest.register_node(":doors:gate_junglewood", {})
minetest.register_node(":doors:gate_pine_wood", {})
minetest.register_node(":doors:gate_aspen_wood", {})
minetest.register_node(":doors:gate_acacia_wood_open", {})
minetest.register_node(":doors:gate_junglewood_open", {})
minetest.register_node(":doors:gate_pine_wood_open", {})
minetest.register_node(":doors:gate_aspen_wood_open", {})
minetest.register_node(":doors:gate_acacia_wood_closed", {})
minetest.register_node(":doors:gate_junglewood_closed", {})
minetest.register_node(":doors:gate_pine_wood_closed", {})
minetest.register_node(":doors:gate_aspen_wood_closed", {})

minetest.register_node(":doors:trapdoor_steel", {})

minetest.register_node(":doors:door_glass", {})
minetest.register_node(":doors:door_obsidian_glass", {})
minetest.register_node(":doors:door_glass_a", {})
minetest.register_node(":doors:door_obsidian_glass_a", {})
minetest.register_node(":doors:door_glass_b", {})
minetest.register_node(":doors:door_obsidian_glassb", {})



minetest.register_node(":default:obsidian_glass", {})
minetest.register_node(":stairs:slab_obsidian_glass", {})
minetest.register_node(":stairs:stair_obsidian_glass", {})
minetest.register_node(":stairs:stair_inner_obsidian_glass", {})
minetest.register_node(":stairs:stair_outer_obsidian_glass", {})

minetest.register_node(":default:meselamp", {})
minetest.register_node(":default:mese_post_light", {})

minetest.register_node(":default:glass", {})
minetest.register_node(":stairs:slab_glass", {})
minetest.register_node(":stairs:stair_glass", {})
minetest.register_node(":stairs:stair_inner_glass", {})
minetest.register_node(":stairs:stair_outer_glass", {})

minetest.register_node(":xpanes:obsidian_glass_pane", {})
minetest.register_node(":xpanes:obsidian_pane", {})
minetest.register_node(":xpanes:obsidian_pane_flat", {})


--maikerumine egg
minetest.register_node("sas_core:maikerumine_stone", {
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
minetest.register_node("sas_core:invis", {
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

minetest.override_item("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'sas_core:pebble_1 3',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	drop = 'sas_core:pebble_1 3',
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:stonebrick", {
	description = "Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_stone_brick.png"},
	drop = 'default:cobble 4',
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:stone_block", {
	description = "Stone Block",
	tiles = {"default_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"default_mossycobble.png"},
	drop = 'sas_core:pebble_1 3',
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:desert_stone", {
	description = "Desert Stone",
	tiles = {"default_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:desert_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:desert_cobble", {
	description = "Desert Cobblestone",
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:desert_stonebrick", {
	description = "Desert Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:desert_stone_block", {
	description = "Desert Stone Block",
	tiles = {"default_desert_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:sandstonebrick", {
	description = "Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:sandstone_block", {
	description = "Sandstone Block",
	tiles = {"default_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:desert_sandstone", {
	description = "Desert Sandstone",
	tiles = {"default_desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:desert_sandstone_brick", {
	description = "Desert Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:desert_sandstone_block", {
	description = "Desert Sandstone Block",
	tiles = {"default_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:silver_sandstone", {
	description = "Silver Sandstone",
	tiles = {"default_silver_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:silver_sandstone_brick", {
	description = "Silver Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_silver_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:silver_sandstone_block", {
	description = "Silver Sandstone Block",
	tiles = {"default_silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
    drop = 'default:obsidian_shard',
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.override_item("default:obsidianbrick", {
	description = "Obsidian Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.override_item("default:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})
--
-- Soft / Non-Stone
--

minetest.override_item("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:slug_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:worm_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:milipede_raw'},
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

minetest.override_item("default:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:slug_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:worm_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.override_item("default:dirt_with_grass_footsteps", {
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

minetest.override_item("default:dirt_with_dry_grass", {
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

minetest.override_item("default:dirt_with_snow", {
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

minetest.override_item("default:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter",
	tiles = {
		"default_rainforest_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:slug_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:worm_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.override_item("default:dirt_with_coniferous_litter", {
	description = "Dirt with Coniferous Litter",
	tiles = {
		"default_coniferous_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_coniferous_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:slug_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:worm_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.override_item("default:dry_dirt", {
	description = "Dry Dirt",
	tiles = {"default_dry_dirt.png"},
	groups = {crumbly = 2, soil = 1},
    drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:slug_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:worm_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.override_item("default:dry_dirt_with_dry_grass", {
	description = "Dry Dirt with Dry Grass",
	tiles = {"default_dry_grass.png", "default_dry_dirt.png",
		{name = "default_dry_dirt.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:slug_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:worm_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'sas_core:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dry_dirt'},
			},
		},
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.override_item("default:permafrost", {
	description = "Permafrost",
	tiles = {"default_permafrost.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.override_item("default:permafrost_with_stones", {
	description = "Permafrost with Stones",
	tiles = {"default_permafrost.png^default_stones.png",
		"default_permafrost.png"},
	groups = {cracky = 2},
--	drop = "default:permafrost",
    drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:small_rocks'},
			rarity = 30,
			},
			{
			items = {'default:permafrost'},
			},
		},
	},
	sounds = default.node_sound_gravel_defaults(),
})

minetest.override_item("default:permafrost_with_moss", {
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

minetest.override_item("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.override_item("default:desert_sand", {
	description = "Desert Sand",
	tiles = {"default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.override_item("default:silver_sand", {
	description = "Silver Sand",
	tiles = {"default_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

--quicksand desert / survival sand
minetest.register_node("sas_core:quicksand_shore", {
	description = "Quicksand",
	tiles = {"default_desert_sand.png^default_footprint.png"},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'sas_core:oyster_raw'},
			rarity = 2,
			},
			{
			items = {'sas_core:mussel_raw'},
			rarity = 2,
			},
			{
			items = {'default:desert_sand'},
			},
			},
		},
	liquid_viscosity = 19,
	liquidtype = "source",
	liquid_alternative_flowing = "sas_core:quicksand_shore",
	liquid_alternative_source = "sas_core:quicksand_shore",
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
	nodenames = {"sas_core:sand_with_food_trail","sas_core:quicksand_shore"},
	interval = 12.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		hacky_swap_node(pos,"sas_core:quicksand_shore")
		return
	end,
})

--quicksand
minetest.register_node("sas_core:quicksand_beach", {
	description = "Quicksand",
	tiles = {"default_sand.png^default_footprint.png"},
	drop = "default:sand",
	liquid_viscosity = 19,
	liquidtype = "source",
	liquid_alternative_flowing = "sas_core:quicksand_beach",
	liquid_alternative_source = "sas_core:quicksand_beach",
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
	nodenames = {"sas_core:sand_trail"},
	neighbors = {"default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 1,
	action = function(pos)
		minetest.env:add_node(pos, {name="sas_core:quicksand_beach"})
	end,
})

minetest.override_item("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 3, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'default:flint'}, rarity = 16},
			{items = {'sas_core:small_rocks'}, rarity = 16},
			{items = {'default:gravel'}}
		}
	}
})

minetest.override_item("default:clay", {
	description = "Clay",
	tiles = {"default_clay.png"},
	groups = {crumbly = 3},
	drop = 'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults(),
})


minetest.override_item("default:snow", {
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
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -7 / 16, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1, snowy = 1},
	sounds = default.node_sound_snow_defaults(),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

minetest.override_item("default:snowblock", {
	description = "Snow Block",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1, falling_node = 1},
	sounds = default.node_sound_snow_defaults(),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

-- 'is ground content = false' to avoid tunnels in sea ice or ice rivers
minetest.override_item("default:ice", {
	description = "Ice",
	tiles = {"default_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1, slippery = 3},
	sounds = default.node_sound_glass_defaults(),
})

-- Mapgen-placed ice with 'is ground content = true' to contain tunnels
minetest.override_item("default:cave_ice", {
	description = "Cave Ice",
	tiles = {"default_ice.png"},
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1, slippery = 3, not_in_creative_inventory = 1},
	drop = "default:ice",
	sounds = default.node_sound_glass_defaults(),
})


--
-- Trees
--

minetest.register_node("sas_core:tree_extracted", {
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

minetest.override_item("default:tree", {
	description = "Apple Tree",
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2, falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.override_item("default:wood", {
	description = "Apple Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_wood.png"},
	drop = 'default:stick 4',
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.override_item("default:leaves", {
	description = "Apple Tree Leaves",
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

})

minetest.override_item("default:apple", {
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

minetest.override_item("default:jungletree", {
	description = "Jungle Tree",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png",
		"default_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2,falling_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.override_item("default:junglewood", {
	description = "Jungle Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_junglewood.png"},
	is_ground_content = false,
	drop = 'default:stick 4',
	groups = {choppy = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.override_item("default:jungleleaves", {
	description = "Jungle Tree Leaves",
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

})



--EXTRA TREES
minetest.override_item("default:pine_tree", {
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

minetest.override_item("default:pine_wood", {
	description = "Pine Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_pine_wood.png"},
	is_ground_content = false,
	drop = "default:wood",
	groups = {choppy = 3, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.override_item("default:pine_needles",{
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
})

minetest.override_item("default:acacia_tree", {
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

minetest.override_item("default:acacia_wood", {
	description = "Acacia Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_acacia_wood.png"},
	is_ground_content = false,
	drop = "default:wood",
	groups = {choppy = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.override_item("default:acacia_leaves", {
	description = "Acacia Tree Leaves",
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

})



minetest.override_item("default:aspen_tree", {
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

minetest.override_item("default:aspen_wood", {
	description = "Aspen Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_aspen_wood.png"},
	is_ground_content = false,
	drop = "default:wood",
	groups = {choppy = 3, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.override_item("default:aspen_leaves", {
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

	--after_place_node = after_place_leaves,
})



--
-- Ores
--

minetest.override_item("default:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:coalblock", {
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sas_core:charcoal_block", {
	description = 'Charcoal Block',
	tiles = {'more_fire_charcoal_block.png'},
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=2,cracky=3,flammable=1,},
})

--I R O N
minetest.override_item("default:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:steelblock", {
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("sas_core:redhot_steelblock", {
	description = "Redhot Steel Block  --Let sit outside to cool into Steelblock",
	tiles = {"default_steel_block.png^[colorize:red:175"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

--C O P P E R

minetest.override_item("default:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'sas_core:copper_nugget',
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:copperblock", {
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("sas_core:orangehot_copperblock", {
	description = "Orangehot Copper Block",
	tiles = {"default_copper_block.png^[colorize:red:75"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


minetest.register_abm({
	nodenames = {"sas_core:redhot_steelblock","default:steelblock"},
	interval = 112.0,
	chance = 3,
	drop = "sas_core:redhot_steel_ingot 9",
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

minetest.override_item("default:cactus", {
	description = "Cactus",
	tiles = {"default_cactus_top.png", "default_cactus_top.png",
		"default_cactus_side.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, falling_node=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})


minetest.override_item("default:papyrus", {
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

minetest.override_item("default:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
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

minetest.override_item("default:junglegrass", {
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
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})


minetest.override_item("default:grass_1", {
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
	minetest.override_item("default:grass_" .. i, {
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

minetest.override_item("default:dry_grass_1", {
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
	minetest.override_item("default:dry_grass_" .. i, {
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

minetest.override_item("default:fern_1", {
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
	minetest.override_item("default:fern_" .. i, {
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


minetest.override_item("default:marram_grass_1", {
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
	minetest.override_item("default:marram_grass_" .. i, {
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
minetest.override_item("default:bush_stem", {
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

minetest.override_item("default:bush_leaves", {
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

	--after_place_node = after_place_leaves,
})

minetest.override_item("default:bush_sapling", {
	description = "Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_bush_sapling.png"},
	inventory_image = "default_bush_sapling.png",
	wield_image = "default_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	--on_timer = grow_sapling,
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
--[[
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
]]
})

minetest.override_item("default:blueberry_bush_leaves_with_berries", {
	description = "Blueberry Bush Leaves with Berries",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_blueberry_bush_leaves.png^default_blueberry_overlay.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3, falling_node=1},
	drop = "default:blueberries",
	sounds = default.node_sound_leaves_defaults(),
	node_dig_prediction = "default:blueberry_bush_leaves",

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name = "default:blueberry_bush_leaves"})
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,
})

minetest.override_item("default:blueberry_bush_leaves", {
	description = "Blueberry Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_blueberry_bush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, falling_node=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:blueberry_bush_sapling"}, rarity = 5},
			{items = {"default:blueberry_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	on_timer = function(pos, elapsed)
		if minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "default:blueberry_bush_leaves_with_berries"})
		end
	end,

	--after_place_node = after_place_leaves,
})

minetest.override_item("default:blueberry_bush_sapling", {
	description = "Blueberry Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_blueberry_bush_sapling.png"},
	inventory_image = "default_blueberry_bush_sapling.png",
	wield_image = "default_blueberry_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	--on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1, falling_node=1, dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:blueberry_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.override_item("default:acacia_bush_stem", {
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

minetest.override_item("default:acacia_bush_leaves", {
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

})

minetest.override_item("default:acacia_bush_sapling", {
	description = "Acacia Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_acacia_bush_sapling.png"},
	inventory_image = "default_acacia_bush_sapling.png",
	wield_image = "default_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	--on_timer = grow_sapling,
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
--[[
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
]]
})

minetest.override_item("default:pine_bush_stem", {
	description = "Pine Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_pine_bush_stem.png"},
	inventory_image = "default_pine_bush_stem.png",
	wield_image = "default_pine_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, falling_node=1},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.override_item("default:pine_bush_needles", {
	description = "Pine Bush Needles",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_pine_needles.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, falling_node=1, dig_by_water = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_bush_sapling"}, rarity = 5},
			{items = {"default:pine_bush_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

})

minetest.override_item("default:pine_bush_sapling", {
	description = "Pine Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_pine_bush_sapling.png"},
	inventory_image = "default_pine_bush_sapling.png",
	wield_image = "default_pine_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	--on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, falling_node=1, dig_by_water = 1,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
--[[
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:pine_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
]]
})

minetest.override_item("default:sand_with_kelp", {
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
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

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

local function coral_on_place(itemstack, placer, pointed_thing)
	if pointed_thing.type ~= "node" or not placer then
		return itemstack
	end

	local player_name = placer:get_player_name()
	local pos_under = pointed_thing.under
	local pos_above = pointed_thing.above
	local node_under = minetest.get_node(pos_under)
	local def_under = minetest.registered_nodes[node_under.name]

	if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
		return def_under.on_rightclick(pos_under, node_under.name,
				placer, itemstack, pointed_thing) or itemstack
	end

	if node_under.name ~= "default:coral_skeleton" or
			minetest.get_node(pos_above).name ~= "default:water_source" then
		return itemstack
	end

	if minetest.is_protected(pos_under, player_name) or
			minetest.is_protected(pos_above, player_name) then
		minetest.log("action", player_name
			.. " tried to place " .. itemstack:get_name()
			.. " at protected position "
			.. minetest.pos_to_string(pos_under))
		minetest.record_protection_violation(pos_under, player_name)
		return itemstack
	end

	node_under.name = itemstack:get_name()
	minetest.set_node(pos_under, node_under)
	if not (creative and creative.is_enabled_for(player_name)) then
		itemstack:take_item()
	end

	return itemstack
end

minetest.override_item("default:coral_green", {
	description = "Green Coral",
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {{name = "default_coral_green.png", tileable_vertical = true}},
	inventory_image = "default_coral_green.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = coral_on_place,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

minetest.override_item("default:coral_pink", {
	description = "Pink Coral",
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {{name = "default_coral_pink.png", tileable_vertical = true}},
	inventory_image = "default_coral_pink.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = coral_on_place,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

minetest.override_item("default:coral_cyan", {
	description = "Cyan Coral",
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {{name = "default_coral_cyan.png", tileable_vertical = true}},
	inventory_image = "default_coral_cyan.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = coral_on_place,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

minetest.override_item("default:coral_brown", {
	description = "Brown Coral",
	tiles = {"default_coral_brown.png"},
	groups = {cracky = 3},
	drop = "default:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:coral_orange", {
	description = "Orange Coral",
	tiles = {"default_coral_orange.png"},
	groups = {cracky = 3},
	drop = "default:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.override_item("default:coral_skeleton", {
	description = "Coral Skeleton",
	tiles = {"default_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


--
-- Liquids
--

minetest.override_item("default:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "default_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "default_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
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

minetest.override_item("default:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_water_flowing_animated.png",
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

minetest.override_item("default:river_water_source", {
	description = "River Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_river_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "default_river_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
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
	-- Not renewable to avoid horizontal spread of water sources in sloping
	-- rivers that can cause water to overflow riverbanks and cause floods.
	-- River water source is instead made renewable by the 'force renew'
	-- option used in the 'bucket' mod by the river water bucket.
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.override_item("default:river_water_flowing", {
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
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.override_item("default:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
		{
			name = "default_lava_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
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

minetest.override_item("default:lava_flowing", {
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
minetest.register_node("sas_core:metal_molten_source", {
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
	liquid_alternative_flowing = "sas_core:metal_molten_flowing",
	liquid_alternative_source = "sas_core:metal_molten_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("sas_core:metal_molten_flowing", {
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
	liquid_alternative_flowing = "sas_core:metal_molten_flowing",
	liquid_alternative_source = "sas_core:metal_molten_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})



minetest.override_item("default:ladder_wood", {
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

minetest.override_item("default:glass", {
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

minetest.override_item("default:brick", {
	description = "Brick Block",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})





--ADD MORE HERE

stairs.register_stair_and_slab(
	"redhot_steelblock",
	"default:redhot_steelblock",
	{cracky = 1, level = 2},
	{"default_steel_block.png^[colorize:red:175"},
	"Redhot Steel Block Stair",
	"Redhot Steel Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"orangehot_copperblock",
	"default:orangehot_copperblock",
	{cracky = 1, level = 2},
	{"default_copper_block.png^[colorize:red:75"},
	"Orangehot Copper Block Stair",
	"Orangehot Copper Block Slab",
	default.node_sound_metal_defaults()
)
