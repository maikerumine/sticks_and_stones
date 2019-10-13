
minetest.register_alias("default:adobe", "sas_core:adobe")
minetest.register_alias("default:basalt", "sas_core:basalt")
minetest.register_alias("default:basalt_cobble", "sas_core:basalt_cobble")
minetest.register_alias("default:chalk", "sas_core:chalk")
minetest.register_alias("default:cobble_with_plaster", "sas_core:cobble_with_plaster")
minetest.register_alias("default:desert_stone_cobble", "sas_core:desert_stone_cobble")
minetest.register_alias("default:desert_stone_with_iron", "sas_core:desert_stone_with_iron")
minetest.register_alias("default:darkdirt", "sas_core:darkdirt")
minetest.register_alias("default:dry_leaves", "sas_core:dry_leaves")
minetest.register_alias("default:gneiss", "sas_core:gneiss")
minetest.register_alias("default:gneiss_cobble", "sas_core:gneiss_cobble")
minetest.register_alias("default:marble", "sas_core:marble")
minetest.register_alias("default:mud", "sas_core:mud")
minetest.register_alias("default:ors", "sas_core:ors")
minetest.register_alias("default:ors_cobble", "sas_core:ors_cobble")
minetest.register_alias("default:sandstone_cobble", "sas_core:sandstone_cobble")
minetest.register_alias("default:serpentine", "sas_core:serpentine")
minetest.register_alias("default:shale", "sas_core:shale")
minetest.register_alias("default:schist", "sas_core:schist")
minetest.register_alias("default:silt", "sas_core:silt")
minetest.register_alias("default:slate", "sas_core:slate")
minetest.register_alias("default:slate_cobble", "sas_core:slate_cobble")
minetest.register_alias("default:slate_tile", "sas_core:slate_tile")
minetest.register_alias("default:slate_tale", "sas_core:slate_tile")
minetest.register_alias("default:straw", "sas_core:straw")
minetest.register_alias("default:stone_brick", "sas_core:stone_brick")
minetest.register_alias("default:straw_bale", "sas_core:straw_bale")
minetest.register_alias("default:marble", "sas_core:marble")
minetest.register_alias("default:marble_tile", "sas_core:marble_tile")

minetest.register_alias("default:chalk_powder", "sas_core:chalk_powder")
minetest.register_alias("default:mud_lump", "sas_core:mud_lump")
minetest.register_alias("default:silt_lump", "sas_core:silt_lump")


print (" ---- Dark Age is Loading! ---- ")
-- Commend this lines if you don't like some of this features
--dofile(minetest.get_modpath("sas_core").."/darkage_mapgen.lua") 20191004-Removed - too laggy
dofile(minetest.get_modpath("sas_core").."/darkage_building.lua")
dofile(minetest.get_modpath("sas_core").."/darkage_furnature.lua")
dofile(minetest.get_modpath("sas_core").."/darkage_stairs.lua")  --moved to stairs mod

----------
-- Items
----------

minetest.register_node("sas_core:adobe", {
	description = "Adobe",
	tiles = {"darkage_adobe.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("sas_core:basalt", {
  description = "Basalt",
	tiles = {"darkage_basalt.png"},
	is_ground_content = true,
  drop = 'sas_core:basalt_cobble',
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:basalt_cobble", {
  description = "Basalt Cobble",
	tiles = {"darkage_basalt_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:chalk", {
  description = "Chalk",
	tiles = {"darkage_chalk.png"},
	is_ground_content = true,
  drop = 'sas_core:chalk_powder 2',
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:cobble_with_plaster", {
	description = "Cobblestone With Plaster",
	tiles = {"darkage_cobble_with_plaster_D.png", "darkage_cobble_with_plaster_B.png", "darkage_cobble_with_plaster_C.png",
		"darkage_cobble_with_plaster_A.png", "default_cobble.png", "darkage_chalk.png"},
	is_ground_content = true,
  paramtype2 = "facedir",
  drop = 'sas_core:cobble',
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sas_core:desert_stone_cobble", {
	description = "Desert Stone Cobble",
	tiles = {"darkage_desert_stone_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:desert_stone_with_iron", {
	description = "Desert Iron Ore",
	tiles = {"default_desert_stone.png^darkage_mineral_iron.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sas_core:darkdirt", {
	description = "Dark Dirt",
	tiles = {"darkage_darkdirt.png"},
	is_ground_content = true,
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("sas_core:dry_leaves", {
	description = "Dry Leaves",
	tiles = {"darkage_dry_leaves.png"},
	is_ground_content = true,
  paramtype = "light",
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults()
})

minetest.register_node("sas_core:gneiss", {
  description = "Gneiss",
	tiles = {"darkage_gneiss.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get cobbles with 1/3 chance
				items = {'sas_core:gneiss_cobble'},
				rarity = 3,
			},
			{
				items = {'sas_core:gneiss'},
			}
		}
	},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:gneiss_cobble", {
  description = "Gneiss Cobble",
	tiles = {"darkage_gneiss_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:marble", {
  description = "Marble",
	tiles = {"darkage_marble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})


minetest.register_node("sas_core:mud", {
  description = "Mud",
	tiles = {"darkage_mud_up.png","darkage_mud.png"},
	is_ground_content = true,
	groups = {crumbly=3},
  drop = 'sas_core:mud_lump 4',
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("sas_core:ors", {
  description = "Old Red Sandstone",
	tiles = {"darkage_ors.png"},
	is_ground_content = true,
  drop = 'sas_core:ors_cobble',
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:ors_cobble", {
  description = "Old Red Sandstone Cobble",
	tiles = {"darkage_ors_cobble.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})


minetest.register_node("sas_core:sandstone_cobble", {
  description = "Sandstone Cobble",
	tiles = {"darkage_sandstone_cobble.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:serpentine", {
  description = "Serpentine",
	tiles = {"darkage_serpentine.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:shale", {
  description = "Shale",
	tiles = {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:schist", {
  description = "Schist",
	tiles = {"darkage_schist.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:silt", {
  description = "Silt",
	tiles = {"darkage_silt.png"},
	is_ground_content = true,
	groups = {crumbly=3},
  drop = 'sas_core:silt_lump 4',
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("sas_core:slate", {
  description = "Slate",
	tiles = {"darkage_slate.png","darkage_slate.png","darkage_slate_side.png"},
	is_ground_content = true,
  drop = 'sas_core:slate_cobble',
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:slate_cobble", {
  description = "Slate Cobble",
	tiles = {"darkage_slate_cobble.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:slate_tile", {
  description = "Slate TIle",
	tiles = {"darkage_slate_tile.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:straw", {
  description = "Straw",
	tiles = {"darkage_straw.png"},
	is_ground_content = true,
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("sas_core:stone_brick", {
  description = "Stone Brick",
	tiles = {"darkage_stone_brick.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:straw_bale", {
  description = "Straw Bale",
	tiles = {"darkage_straw_bale.png"},
	is_ground_content = true,
  drop = 'sas_core:straw 4',
	groups = {snappy=2, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("sas_core:marble", {
  description = "Marble",
	tiles = {"darkage_marble.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:marble_tile", {
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
				items = {'sas_core:desert_stone_cobble'},
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
minetest.register_craftitem("sas_core:chalk_powder", {
	description = "Chalk Powder",
	inventory_image = "darkage_chalk_powder.png",
})

minetest.register_craftitem("sas_core:mud_lump", {
	description = "Mud Lump",
	inventory_image = "darkage_mud_lump.png",
})

minetest.register_craftitem("sas_core:silt_lump", {
	description = "Silt Lump",
	inventory_image = "darkage_silt_lump.png",
})

----------
-- Crafts
----------

--sand+clay+water+straw

minetest.register_craft({
	output = 'sas_core:adobe 4',
	recipe = {
    {'default:sand','default:sand'},
		{'default:clay_lump','sas_core:straw'},
	}
})


minetest.register_craft({
	output = 'sas_core:basalt_cobble 4',
	recipe = {
    {'default:cobble','default:cobble'},
		{'default:coal_lump','default:coal_lump'},
	}
})

minetest.register_craft({
	output = 'sas_core:cobble_with_plaster 2',
	recipe = {
    {'default:cobble','sas_core:chalk_powder'},
		{'default:cobble','sas_core:chalk_powder'},
	}
})

minetest.register_craft({
	output = 'sas_core:cobble_with_plaster 2',
	recipe = {
    {'sas_core:chalk_powder','default:cobble'},
		{'sas_core:chalk_powder','default:cobble'},
	}
})

minetest.register_craft({
	output = 'sas_core:darkdirt 4',
	recipe = {
    {'default:dirt','default:dirt'},
		{'default:gravel','default:gravel'},
	}
})

minetest.register_craft({
	output = 'sas_core:mud 3',
	recipe = {
    {'default:dirt','default:dirt'},
		{'default:clay_lump','default:silt_lump'},
	}
})

minetest.register_craft({
	output = 'sas_core:mud',
	recipe = {
    {'sas_core:mud_lump','sas_core:mud_lump'},
    {'sas_core:mud_lump','sas_core:mud_lump'},
	}
})

minetest.register_craft({
	output = 'sas_core:ors 4',
	recipe = {
    {'default:sandstone','default:sandstone'},
		{'default:iron_lump','default:sandstone'},
	}
})

minetest.register_craft({
	output = 'sas_core:ors_cobble 4',
	recipe = {
    {'sas_core:sandstone_cobble','sas_core:sandstone_cobble'},
		{'default:iron_lump','sas_core:sandstone_cobble'},
	}
})

minetest.register_craft({
	output = 'sas_core:silt 3',
	recipe = {
    {'default:sand','default:sand'},
		{'sas_core:clay_lump','default:clay_lump'},
	}
})

minetest.register_craft({
	output = 'sas_core:silt',
	recipe = {
    {'sas_core:silt_lump','sas_core:silt_lump'},
		{'sas_core:silt_lump','sas_core:silt_lump'},
	}
})

minetest.register_craft({
	output = 'sas_core:slate_tile 2',
	recipe = {
    {'sas_core:slate_cobble','sas_core:slate_cobble'},
		{'sas_core:slate_cobble','sas_core:slate_cobble'},
	}
})

minetest.register_craft({
	output = 'sas_core:stone_brick 3',
	recipe = {
    {'default:cobble','default:cobble'},
		{'default:cobble','default:cobble'},
	}
})

minetest.register_craft({
	output = 'sas_core:desert_stone_cobble 3',
	recipe = {
    {'default:desert_cobble','default:cobble'},
		{'default:cobble','default:desert_cobble'},
	}
})

minetest.register_craft({
	output = 'sas_core:straw 2',
	recipe = {
    {'default:dry_shrub','default:dry_shrub'},
		{'default:dry_shrub','default:dry_shrub'},
	}
})

minetest.register_craft({
	output = 'sas_core:straw 2',
	recipe = {
    {'sas_core:dry_leaves','sas_core:dry_leaves'},
		{'sas_core:dry_leaves','sas_core:dry_leaves'},
	}
})

minetest.register_craft({
	output = 'sas_core:straw_bale',
	recipe = {
    {'sas_core:straw','sas_core:straw'},
    {'sas_core:straw','sas_core:straw'},
	}
})


-- Cookings
minetest.register_craft({
	type = "cooking",
	output = "sas_core:basalt",
	recipe = "sas_core:basalt_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_stone_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:dry_leaves",
	recipe = "default:leaves",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:sandstone_cobble",
	recipe = "default:sandstone",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:gneiss",
	recipe = "sas_core:schist",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:gneiss",
	recipe = "sas_core:gneiss_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:ors",
	recipe = "sas_core:ors_cobble",
})


minetest.register_craft({
	type = "cooking",
	output = "sas_core:ors_cobble",
	recipe = "default:sandstone",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:schist",
	recipe = "sas_core:slate",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:shale",
	recipe = "sas_core:mud",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:slate",
	recipe = "sas_core:shale",
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:slate",
	recipe = "sas_core:slate_cobble",
})

-- Desert
minetest.register_craft({
	type = "cooking",
	output = "sas_core:ors_cobble",
	recipe = "sas_core:desert_stone",
})
--[[
minetest.register_craft({
	output = 'sas_core:desert_stone 2',
	recipe = {
    {'sas_core:desert_sand','sas_core:desert_sand'},
		{'sas_core:desert_sand','sas_core:desert_sand'},
	}
})
]]
