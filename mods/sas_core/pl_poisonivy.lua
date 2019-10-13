-- This file supplies poison ivy for the plantlife modpack
-- Last revision:  2013-01-24

local S = sas_core.intllib

local SPAWN_DELAY = 1000
local SPAWN_CHANCE = 200
local GROW_DELAY = 500
local GROW_CHANCE = 30
local poisonivy_seed_diff = 339
local walls_list = {
	"default:dirt",
	"default:dirt_with_grass",
	"default:stone",
	"default:cobble",
	"default:mossycobble",
	"default:brick",
	"default:tree",
	"default:jungletree",
	"default:stone_with_coal",
	"default:stone_with_iron"
},
minetest.register_node('sas_core:seedling', {
	description = S("Poison ivy (seedling)"),
	drawtype = 'plantlike',
	waving = 1,
	tiles = { 'poisonivy_seedling.png' },
	inventory_image = 'poisonivy_seedling.png',
	wield_image = 'poisonivy_seedling.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3, poisonivy=1, flora_block=1, dig_by_water = 1 },
	sounds = default.node_sound_leaves_defaults(),
	buildable_to = true,
})

minetest.register_node('sas_core:sproutling', {
	description = S("Poison ivy (sproutling)"),
	drawtype = 'plantlike',
	waving = 1,
	tiles = { 'poisonivy_sproutling.png' },
	inventory_image = 'poisonivy_sproutling.png',
	wield_image = 'poisonivy_sproutling.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3, poisonivy=1, flora_block=1 , dig_by_water = 1},
	sounds = default.node_sound_leaves_defaults(),
	buildable_to = true,
})

minetest.register_node('sas_core:climbing', {
	description = S("Poison ivy (climbing plant)"),
	drawtype = 'signlike',
	tiles = { 'poisonivy_climbing.png' },
	inventory_image = 'poisonivy_climbing.png',
	wield_image = 'poisonivy_climbing.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = 'wallmounted',
	walkable = false,
	groups = { snappy = 3, poisonivy=1, flora_block=1, plant_fiber = 1 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
	buildable_to = true,
})

sas_core:spawn_on_surfaces({
	spawn_delay = SPAWN_DELAY,
	spawn_plants = {"sas_core:seedling"},
	avoid_radius = 10,
	spawn_chance = SPAWN_CHANCE/10,
	spawn_surfaces = {"sas_core:dirt_with_grass"},
	avoid_nodes = {"group:poisonivy", "group:flower", "group:flora"},
	seed_diff = poisonivy_seed_diff,
	light_min = 7,
	alt_wallnode = "sas_core:climbing",
	verticals_list = walls_list
})

sas_core:grow_plants({
	grow_delay = SPAWN_DELAY,
	grow_chance = GROW_CHANCE,
	grow_plant = "sas_core:seedling",
	grow_result = "sas_core:sproutling",
	grow_nodes = {"default:dirt_with_grass"}
})

sas_core:grow_plants({
	grow_delay = GROW_DELAY,
	grow_chance = GROW_CHANCE*2,
	grow_plant = "sas_core:climbing",
	need_wall = true,
	grow_vertically = true,
	verticals_list = walls_list,
	ground_nodes = {"default:dirt_with_grass"}
})

print(S("[Poison Ivy] Loaded."))
