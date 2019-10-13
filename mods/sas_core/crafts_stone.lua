
minetest.register_alias("default:crucible", "sas_core:crucible")
minetest.register_alias("default:crucible_glue", "sas_core:crucible_glue")



--Stone crafts
minetest.register_craftitem("sas_core:crucible", {
	description = "Small Stone Crucible",
	groups = { vessel = 1},
	inventory_image = "crucible.png"
})

minetest.register_craftitem("sas_core:crucible_glue", {
	description = "Small Stone Crucible with Glue  --Cook in furnace to get glue",
	groups = { glue = 1},
	inventory_image = "crucible_glue.png"
})


--Crafting
--Hand Axe
minetest.register_craft({
	output = "sas_core:tool_hand_axe",
	recipe = {
		{"", "", ""},
		{"sas_core:plant_fiber", "group:pebble", "sas_core:plant_fiber"},
		{"", "sas_core:plant_fiber", ""},
	},
})

minetest.register_craft({
	output = 'sas_core:crucible_glue',
	recipe = {
		{'sas_core:small_rocks', 'sas_core:resin_and_rosin', 'sas_core:small_rocks'},
		{'sas_core:resin_and_rosin', 'default:coal_lump', 'sas_core:resin_and_rosin'},
		{'sas_core:small_rocks', 'sas_core:small_rocks', 'sas_core:small_rocks'},
	}
})

minetest.register_craft({
	output = 'sas_core:crucible_glue',
	recipe = {
		{'', 'sas_core:resin_and_rosin', ''},
		{'sas_core:resin_and_rosin', 'default:coal_lump', 'sas_core:resin_and_rosin'},
		{'', 'sas_core:crucible', ''},
	}
})

minetest.register_craft({
	output = 'sas_core:crucible',
	recipe = {
		{'', '', ''},
		{'sas_core:small_rocks', '', 'sas_core:small_rocks'},
		{'sas_core:small_rocks', 'sas_core:small_rocks', 'sas_core:small_rocks'},
	}
})

minetest.register_craft({
	output = 'sas_core:small_rocks 3',
	recipe = {
		{'sas_core:pebble_1'},
	}
})

minetest.register_craft({
	output = 'sas_core:small_rocks 3',
	recipe = {
		{'sas_core:desert_pebble_1'},
	}
})

minetest.register_craft({
	output = 'default:cobble',
	recipe = {
		{'sas_core:pebble_1', 'sas_core:pebble_1', 'sas_core:pebble_1'},
	}
})

minetest.register_craft({
	output = 'default:desert_cobble',
	recipe = {
		{'sas_core:desert_pebble_1', 'sas_core:desert_pebble_1', 'sas_core:desert_pebble_1'},
	}
})

minetest.register_craft({
	output = 'sas_core:pebble_1',
	recipe = {
		{'sas_core:small_rocks', 'sas_core:small_rocks', 'sas_core:small_rocks'},
	}
})
--[[
minetest.register_craft({
	output = 'sas_core:cobble',
	recipe = {
		{'cavestuff:pebble_1', 'cavestuff:pebble_1'},
		{'cavestuff:pebble_1', 'cavestuff:pebble_1'},
	}
})

minetest.register_craft({
	output = 'sas_core:desert_cobble',
	recipe = {
		{'cavestuff:desert_pebble_1', 'cavestuff:desert_pebble_1'},
		{'cavestuff:desert_pebble_1', 'cavestuff:desert_pebble_1'},
	}
})
]]
minetest.register_craft({
	output = 'sas_core:pebble_1 3',
	recipe = {
		{'default:cobble'},
	}
})

minetest.register_craft({
	output = 'sas_core:desert_pebble_1 3',
	recipe = {
		{'default:desert_cobble'},
	}
})
