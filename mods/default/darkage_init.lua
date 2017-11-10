
print (" ---- Dark Age is Loading! ---- ")
-- Commend this lines if you don't like some of this features
dofile(minetest.get_modpath("default").."/darkage_mapgen.lua")
dofile(minetest.get_modpath("default").."/darkage_building.lua")
dofile(minetest.get_modpath("default").."/darkage_furnature.lua")
--dofile(minetest.get_modpath("default").."/darkage_stairs.lua")  --moved to stairs mod

----------
-- Items
----------

minetest.register_node("default:adobe", {
	description = "Adobe",
	tiles = {"darkage_adobe.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:basalt", {
  description = "Basalt",
	tiles = {"darkage_basalt.png"},
	is_ground_content = true,
  drop = 'default:basalt_cobble',
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:basalt_cobble", {
  description = "Basalt Cobble",
	tiles = {"darkage_basalt_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:chalk", {
  description = "Chalk",
	tiles = {"darkage_chalk.png"},
	is_ground_content = true,
  drop = 'default:chalk_powder 2',
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:cobble_with_plaster", {
	description = "Cobblestone With Plaster",
	tiles = {"darkage_cobble_with_plaster_D.png", "darkage_cobble_with_plaster_B.png", "darkage_cobble_with_plaster_C.png",
		"darkage_cobble_with_plaster_A.png", "default_cobble.png", "darkage_chalk.png"},
	is_ground_content = true,
  paramtype2 = "facedir",
  drop = 'default:cobble',
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_cobble", {
	description = "Desert Stone Cobble",
	tiles = {"darkage_desert_stone_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:desert_stone_with_iron", {
	description = "Desert Iron Ore",
	tiles = {"default_desert_stone.png^darkage_mineral_iron.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:darkdirt", {
	description = "Dark Dirt",
	tiles = {"darkage_darkdirt.png"},
	is_ground_content = true,
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dry_leaves", {
	description = "Dry Leaves",
	tiles = {"darkage_dry_leaves.png"},
	is_ground_content = true,
  paramtype = "light",
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults()
})

minetest.register_node("default:gneiss", {
  description = "Gneiss",
	tiles = {"darkage_gneiss.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get cobbles with 1/3 chance
				items = {'default:gneiss_cobble'},
				rarity = 3,
			},
			{
				items = {'default:gneiss'},
			}
		}
	},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:gneiss_cobble", {
  description = "Gneiss Cobble",
	tiles = {"darkage_gneiss_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:marble", {
  description = "Marble",
	tiles = {"darkage_marble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})


minetest.register_node("default:mud", {
  description = "Mud",
	tiles = {"darkage_mud_up.png","darkage_mud.png"},
	is_ground_content = true,
	groups = {crumbly=3},
  drop = 'default:mud_lump 4',
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("default:ors", {
  description = "Old Red Sandstone",
	tiles = {"darkage_ors.png"},
	is_ground_content = true,
  drop = 'default:ors_cobble',
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:ors_cobble", {
  description = "Old Red Sandstone Cobble",
	tiles = {"darkage_ors_cobble.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})


minetest.register_node("default:sandstone_cobble", {
  description = "Sandstone Cobble",
	tiles = {"darkage_sandstone_cobble.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:serpentine", {
  description = "Serpentine",
	tiles = {"darkage_serpentine.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:shale", {
  description = "Shale",
	tiles = {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:schist", {
  description = "Schist",
	tiles = {"darkage_schist.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:silt", {
  description = "Silt",
	tiles = {"darkage_silt.png"},
	is_ground_content = true,
	groups = {crumbly=3},
  drop = 'default:silt_lump 4',
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("default:slate", {
  description = "Slate",
	tiles = {"darkage_slate.png","darkage_slate.png","darkage_slate_side.png"},
	is_ground_content = true,
  drop = 'default:slate_cobble',
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:slate_cobble", {
  description = "Slate Cobble",
	tiles = {"darkage_slate_cobble.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:slate_tile", {
  description = "Slate TIle",
	tiles = {"darkage_slate_tile.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:straw", {
  description = "Straw",
	tiles = {"darkage_straw.png"},
	is_ground_content = true,
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("default:default_stone_brick", {
  description = "Stone Brick",
	tiles = {"darkage_stone_brick.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:straw_bale", {
  description = "Straw Bale",
	tiles = {"darkage_straw_bale.png"},
	is_ground_content = true,
  drop = 'default:straw 4',
	groups = {snappy=2, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("default:marble", {
  description = "Marble",
	tiles = {"darkage_marble.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:marble_tile", {
  description = "Marble Tile",
	tiles = {"darkage_marble_tile.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

---------------
-- Overrides
---------------
minetest.registered_nodes["default:desert_stone"].drop= {
		max_items = 1,
		items = {
			{
				-- player will get cobbles with 1/3 chance
				items = {'default:desert_stone_cobble'},
				rarity = 2,
			},
			{
				items = {'cavestuff:desert_pebble_1 3'},
			}
		}
}


---------------
-- Crafts Items
---------------
minetest.register_craftitem("default:chalk_powder", {
	description = "Chalk Powder",
	inventory_image = "darkage_chalk_powder.png",
})

minetest.register_craftitem("default:mud_lump", {
	description = "Mud Lump",
	inventory_image = "darkage_mud_lump.png",
})

minetest.register_craftitem("default:silt_lump", {
	description = "Silt Lump",
	inventory_image = "darkage_silt_lump.png",
})

----------
-- Crafts
----------

--sand+clay+water+straw

minetest.register_craft({
	output = 'default:adobe 4',
	recipe = {
    {'default:sand','default:sand'},
		{'default:clay_lump','default:straw'},
	}
})


minetest.register_craft({
	output = 'default:basalt_cobble 4',
	recipe = {
    {'default:cobble','default:cobble'},
		{'default:coal_lump','default:coal_lump'},
	}
})

minetest.register_craft({
	output = 'default:cobble_with_plaster 2',
	recipe = {
    {'default:cobble','default:chalk_powder'},
		{'default:cobble','default:chalk_powder'},
	}
})

minetest.register_craft({
	output = 'default:cobble_with_plaster 2',
	recipe = {
    {'default:chalk_powder','default:cobble'},
		{'default:chalk_powder','default:cobble'},
	}
})

minetest.register_craft({
	output = 'default:darkdirt 4',
	recipe = {
    {'default:dirt','default:dirt'},
		{'default:gravel','default:gravel'},
	}
})

minetest.register_craft({
	output = 'default:mud 3',
	recipe = {
    {'default:dirt','default:dirt'},
		{'default:clay_lump','default:silt_lump'},
	}
})

minetest.register_craft({
	output = 'default:mud',
	recipe = {
    {'default:mud_lump','default:mud_lump'},
    {'default:mud_lump','default:mud_lump'},
	}
})

minetest.register_craft({
	output = 'default:ors 4',
	recipe = {
    {'default:sandstone','default:sandstone'},
		{'default:iron_lump','default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:ors_cobble 4',
	recipe = {
    {'default:sandstone_cobble','default:sandstone_cobble'},
		{'default:iron_lump','default:sandstone_cobble'},
	}
})

minetest.register_craft({
	output = 'default:silt 3',
	recipe = {
    {'default:sand','default:sand'},
		{'default:clay_lump','default:clay_lump'},
	}
})

minetest.register_craft({
	output = 'default:silt',
	recipe = {
    {'default:silt_lump','default:silt_lump'},
		{'default:silt_lump','default:silt_lump'},
	}
})

minetest.register_craft({
	output = 'default:slate_tile 2',
	recipe = {
    {'default:slate_cobble','default:slate_cobble'},
		{'default:slate_cobble','default:slate_cobble'},
	}
})

minetest.register_craft({
	output = 'default:default_stone_brick 3',
	recipe = {
    {'default:cobble','default:cobble'},
		{'default:cobble','default:cobble'},
	}
})

minetest.register_craft({
	output = 'default:straw 2',
	recipe = {
    {'default:dry_shrub','default:dry_shrub'},
		{'default:dry_shrub','default:dry_shrub'},
	}
})

minetest.register_craft({
	output = 'default:straw 2',
	recipe = {
    {'default:dry_leaves','default:dry_leaves'},
		{'default:dry_leaves','default:dry_leaves'},
	}
})

minetest.register_craft({
	output = 'default:straw_bale',
	recipe = {
    {'default:straw','default:straw'},
    {'default:straw','default:straw'},
	}
})


-- Cookings
minetest.register_craft({
	type = "cooking",
	output = "default:basalt",
	recipe = "default:basalt_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_stone_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:dry_leaves",
	recipe = "default:leaves",
})

minetest.register_craft({
	type = "cooking",
	output = "default:sandstone_cobble",
	recipe = "default:sandstone",
})

minetest.register_craft({
	type = "cooking",
	output = "default:gneiss",
	recipe = "default:schist",
})

minetest.register_craft({
	type = "cooking",
	output = "default:gneiss",
	recipe = "default:gneiss_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:ors",
	recipe = "default:ors_cobble",
})


minetest.register_craft({
	type = "cooking",
	output = "default:ors_cobble",
	recipe = "default:sandstone",
})

minetest.register_craft({
	type = "cooking",
	output = "default:schist",
	recipe = "default:slate",
})

minetest.register_craft({
	type = "cooking",
	output = "default:shale",
	recipe = "default:mud",
})

minetest.register_craft({
	type = "cooking",
	output = "default:slate",
	recipe = "default:shale",
})

minetest.register_craft({
	type = "cooking",
	output = "default:slate",
	recipe = "default:slate_cobble",
})

-- Desert
minetest.register_craft({
	type = "cooking",
	output = "default:ors_cobble",
	recipe = "default:desert_stone",
})
--[[
minetest.register_craft({
	output = 'default:desert_stone 2',
	recipe = {
    {'default:desert_sand','default:desert_sand'},
		{'default:desert_sand','default:desert_sand'},
	}
})
]]
