--Plant crafts

--Plant Fiber for cords and glue
minetest.register_craftitem("default:plant_fiber", {
	description = "Plant Fiber",
	--groups = { plant_fiber = 1},
	inventory_image = "plant_fiber.png"
})

minetest.register_craftitem("default:cord", {
	description = "Plant Fiber Cord",
	groups = { cord = 1},
	inventory_image = "plant_fiber_cord.png"
})

minetest.register_craftitem("default:fabric", {
	description = "Plant Fiber Fabric",
	groups = { fabric = 1},
	inventory_image = "plant_fiber_cloth.png"
})

minetest.register_craftitem("default:resin_and_rosin", {
	description = "Tree Resin and Rosin",
	groups = { glue = 1},
	inventory_image = "default_copper_lump.png"
})

minetest.register_craftitem("default:glue", {
	description = "Glue",
	groups = { glue = 1},
	inventory_image = "default_copper_lump.png^default_gold_lump.png"
})


--Crafting
minetest.register_craft({
	output = 'default:plant_fiber',
	recipe = {
		{'', '', ''},
		{'group:plant_fiber', 'group:plant_fiber', 'group:plant_fiber'},
		{'group:plant_fiber', 'group:plant_fiber', 'group:plant_fiber'},
	}
})

minetest.register_craft({
	output = 'default:plant_fiber',
	recipe = {
		{'', '', ''},
		{'group:grass', 'group:grass', 'group:grass'},
		{'group:grass', 'group:grass', 'group:grass'},
	}
})
minetest.register_craft({
	output = 'default:cord 2',
	replacements = {{"default:stick", "default:stick"}},
	recipe = {
		{'', '', ''},
		{'default:plant_fiber', 'default:plant_fiber', 'default:plant_fiber'},
		{'default:plant_fiber', 'default:stick', 'default:plant_fiber'},
	}
})

minetest.register_craft({
	output = 'default:cord 3',
	replacements = {{"default:stick", "default:stick"}},
	recipe = {
		{'default:vines', '', ''},
		{'default:vines', '', ''},
		{'default:vines', '', ''},
	}
})

minetest.register_craft({
	output = 'default:cord 3',
	replacements = {{"default:stick", "default:stick"}},
	recipe = {
		{'group:vines', '', ''},
		{'group:vines', '', ''},
		{'group:vines', '', ''},
	}
})
minetest.register_craft({
	output = 'default:resin_and_rosin',
	replacements = {{"default:tree", "default:tree_extracted"}, {"default:small_rocks", "default:plant_fiber"}},
	recipe = {
		{'', '', ''},
		{'', '', ''},
		{'default:small_rocks', 'default:tree', 'default:small_rocks'},
	}
})

minetest.register_craft({
	output = 'default:resin_and_rosin',
	replacements = {{"default:jungletree", "default:tree_extracted"}, {"default:small_rocks", "default:plant_fiber"}},
	recipe = {
		{'', '', ''},
		{'', '', ''},
		{'default:small_rocks', 'default:jungletree', 'default:small_rocks'},
	}
})

minetest.register_craft({
	output = 'default:resin_and_rosin',
	replacements = {{"default:fern_trunk_big", "default:tree_extracted"}, {"default:small_rocks", "default:plant_fiber"}},
	recipe = {
		{'', '', ''},
		{'', '', ''},
		{'default:small_rocks', 'ferns:fern_trunk_big', 'default:small_rocks'},
	}
})

minetest.register_craft({
	output = 'default:fabric',
	recipe = {
		{'default:cord', 'default:cord', 'default:cord'},
		{'default:cord', 'default:cord', 'default:cord'},
		{'default:cord', 'default:cord', 'default:cord'},
	}
})