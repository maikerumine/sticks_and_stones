
minetest.register_alias("default:plant_fiber", "sas_core:plant_fiber")
minetest.register_alias("default:cord", "sas_core:cord")
minetest.register_alias("default:fabric", "sas_core:fabric")
minetest.register_alias("default:resin_and_rosin", "sas_core:resin_and_rosin")
minetest.register_alias("default:glue", "sas_core:glue")



--Plant crafts

--Plant Fiber for cords and glue
minetest.register_craftitem("sas_core:plant_fiber", {
	description = "Plant Fiber",
	--groups = { plant_fiber = 1},
	inventory_image = "plant_fiber.png"
})

minetest.register_craftitem("sas_core:cord", {
	description = "Plant Fiber Cord",
	groups = { cord = 1},
	inventory_image = "plant_fiber_cord.png"
})

minetest.register_craftitem("sas_core:fabric", {
	description = "Plant Fiber Fabric",
	groups = { fabric = 1},
	inventory_image = "plant_fiber_cloth.png"
})

minetest.register_craftitem("sas_core:resin_and_rosin", {
	description = "Tree Resin and Rosin",
	groups = { glue = 1},
	inventory_image = "default_copper_lump.png"
})

minetest.register_craftitem("sas_core:glue", {
	description = "Glue",
	groups = { glue = 1},
	inventory_image = "default_copper_lump.png^default_gold_lump.png"
})


--Crafting
minetest.register_craft({
	output = 'sas_core:plant_fiber',
	recipe = {
		{'', '', ''},
		{'group:plant_fiber', 'group:plant_fiber', 'group:plant_fiber'},
		{'group:plant_fiber', 'group:plant_fiber', 'group:plant_fiber'},
	}
})

minetest.register_craft({
	output = 'sas_core:plant_fiber',
	recipe = {
		{'', '', ''},
		{'group:grass', 'group:grass', 'group:grass'},
		{'group:grass', 'group:grass', 'group:grass'},
	}
})
minetest.register_craft({
	output = 'sas_core:cord 2',
	replacements = {{"default:stick", "default:stick"}},
	recipe = {
		{'', '', ''},
		{'sas_core:plant_fiber', 'sas_core:plant_fiber', 'sas_core:plant_fiber'},
		{'sas_core:plant_fiber', 'default:stick', 'sas_core:plant_fiber'},
	}
})

minetest.register_craft({
	output = 'sas_core:cord 3',
	replacements = {{"default:stick", "default:stick"}},
	recipe = {
		{'farming:string', '', ''},
		{'farming:string', '', ''},
		{'farming:string', '', ''},
	}
})

minetest.register_craft({
	output = 'sas_core:cord 3',
	replacements = {{"default:stick", "default:stick"}},
	recipe = {
		{'group:vines', '', ''},
		{'group:vines', '', ''},
		{'group:vines', '', ''},
	}
})
minetest.register_craft({
	output = 'sas_core:resin_and_rosin',
	replacements = {{"default:tree", "sas_core:tree_extracted"}, {"sas_core:small_rocks", "sas_core:plant_fiber"}},
	recipe = {
		{'', '', ''},
		{'', '', ''},
		{'sas_core:small_rocks', 'default:tree', 'sas_core:small_rocks'},
	}
})

minetest.register_craft({
	output = 'sas_core:resin_and_rosin',
	replacements = {{"default:jungletree", "sas_core:tree_extracted"}, {"sas_core:small_rocks", "sas_core:plant_fiber"}},
	recipe = {
		{'', '', ''},
		{'', '', ''},
		{'sas_core:small_rocks', 'default:jungletree', 'sas_core:small_rocks'},
	}
})

minetest.register_craft({
	output = 'sas_core:resin_and_rosin',
	replacements = {{"sas_core:fern_trunk_big", "sas_core:tree_extracted"}, {"sas_core:small_rocks", "sas_core:plant_fiber"}},
	recipe = {
		{'', '', ''},
		{'', '', ''},
		{'sas_core:small_rocks', 'sas_core:fern_trunk_big', 'sas_core:small_rocks'},
	}
})

minetest.register_craft({
	output = 'sas_core:fabric',
	recipe = {
		{'sas_core:cord', 'sas_core:cord', 'sas_core:cord'},
		{'sas_core:cord', 'sas_core:cord', 'sas_core:cord'},
		{'sas_core:cord', 'sas_core:cord', 'sas_core:cord'},
	}
})
