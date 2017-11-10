


--Stone crafts
minetest.register_craftitem("default:crucible", {
	description = "Small Stone Crucible",
	groups = { vessel = 1},
	inventory_image = "crucible.png"
})

minetest.register_craftitem("default:crucible_glue", {
	description = "Small Stone Crucible with Glue  --Cook in furnace to get glue",
	groups = { glue = 1},
	inventory_image = "crucible_glue.png"
})


--Crafting
--Hand Axe
minetest.register_craft({
	output = "default:tool_hand_axe",
	recipe = {
		{"", "", ""},
		{"default:plant_fiber", "group:pebble", "default:plant_fiber"},
		{"", "default:plant_fiber", ""},
	},
})

minetest.register_craft({
	output = 'default:crucible_glue',
	recipe = {
		{'default:small_rocks', 'default:resin_and_rosin', 'default:small_rocks'},
		{'default:resin_and_rosin', 'default:coal_lump', 'default:resin_and_rosin'},
		{'default:small_rocks', 'default:small_rocks', 'default:small_rocks'},
	}
})

minetest.register_craft({
	output = 'default:crucible_glue',
	recipe = {
		{'', 'default:resin_and_rosin', ''},
		{'default:resin_and_rosin', 'default:coal_lump', 'default:resin_and_rosin'},
		{'', 'default:crucible', ''},
	}
})

minetest.register_craft({
	output = 'default:crucible',
	recipe = {
		{'', '', ''},
		{'default:small_rocks', '', 'default:small_rocks'},
		{'default:small_rocks', 'default:small_rocks', 'default:small_rocks'},
	}
})

minetest.register_craft({
	output = 'default:small_rocks 3',
	recipe = {
		{'cavestuff:pebble_1'},
	}
})

minetest.register_craft({
	output = 'default:small_rocks 3',
	recipe = {
		{'cavestuff:desert_pebble_1'},
	}
})

minetest.register_craft({
	output = 'default:cobble',
	recipe = {
		{'cavestuff:pebble_1', 'cavestuff:pebble_1', 'cavestuff:pebble_1'},
	}
})

minetest.register_craft({
	output = 'default:desert_cobble',
	recipe = {
		{'cavestuff:desert_pebble_1', 'cavestuff:desert_pebble_1', 'cavestuff:desert_pebble_1'},
	}
})

minetest.register_craft({
	output = 'cavestuff:pebble_1',
	recipe = {
		{'default:small_rocks', 'default:small_rocks', 'default:small_rocks'},
	}
})
--[[
minetest.register_craft({
	output = 'default:cobble',
	recipe = {
		{'cavestuff:pebble_1', 'cavestuff:pebble_1'},
		{'cavestuff:pebble_1', 'cavestuff:pebble_1'},
	}
})

minetest.register_craft({
	output = 'default:desert_cobble',
	recipe = {
		{'cavestuff:desert_pebble_1', 'cavestuff:desert_pebble_1'},
		{'cavestuff:desert_pebble_1', 'cavestuff:desert_pebble_1'},
	}
})
]]
minetest.register_craft({
	output = 'cavestuff:pebble_1 3',
	recipe = {
		{'default:cobble'},
	}
})

minetest.register_craft({
	output = 'cavestuff:desert_pebble_1 3',
	recipe = {
		{'default:desert_cobble'},
	}
})