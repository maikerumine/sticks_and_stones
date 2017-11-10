--Wood crafts
minetest.register_craftitem("default:stick", {
	description = "Stick",
	inventory_image = "default_stick.png",
	groups = {stick = 1, flammable = 2, kindling = 1},
})

--Handles
minetest.register_craft({
	output = "default:handle_short",
	recipe = {
		{"", "", ""},
		{"default:cord", "", "default:glue"},
		{"", "default:stick", ""},
	},
})
minetest.register_craft({
	output = "default:handle_medium",
	recipe = {
		{"", "", ""},
		{"default:cord", "default:stick", "default:glue"},
		{"", "default:stick", ""},
	},
})
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{"", "default:stick", ""},
		{"default:cord", "default:stick", "default:glue"},
		{"", "default:stick", ""},
	},
})
minetest.register_craft({
	output = "default:handle_stock",
	replacements = {{"default:tool_steel_saw", "default:tool_steel_saw"}},
	recipe = {
		{"default:tool_steel_saw", "stairs:slab_wood", ""},
		{"default:iron_hardware", "default:glue", "default:wood"},
		{"default:steel_spring_light", "stairs:slab_wood", ""},
	},
})


--Crafting
minetest.register_craft({
	output = 'default:wood 4',
	replacements = {{"default:tool_steel_saw", "default:tool_steel_saw"}},
	recipe = {
		{'', 'default:tool_steel_saw', ''},
		{'', 'default:tree', ''},
	}
})

minetest.register_craft({
	output = 'default:junglewood 4',
	replacements = {{"default:tool_steel_saw", "default:tool_steel_saw"}},
	recipe = {
		{'', 'default:tool_steel_saw', ''},
		{'', 'default:jungletree', ''},
	}
})



minetest.register_craft({
	output = 'default:stick 4',
	replacements = {{"default:tool_steel_saw", "default:tool_steel_saw"}},
	recipe = {
	{'', 'default:tool_steel_saw', ''},
		{'' ,'group:wood', ''},
	}
})

minetest.register_craft({
	output = 'default:sign_wall_wood 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'default:cord', 'default:stick', 'default:cord'},
	}
})

minetest.register_craft({
	output = 'default:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'default:iron_hardware', 'default:iron_hinge', 'default:iron_hardware'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = "default:ladder_wood 5",
	recipe = {
		{"default:stick", "default:cord", "default:stick"},
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:cord", "default:stick"},
	}
})

