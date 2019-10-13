--Wood crafts
--[[
minetest.register_craftitem("sas_core:stick", {
	description = "Stick",
	inventory_image = "default_stick.png",
	groups = {stick = 1, flammable = 2, kindling = 1},
})
]]

--Handles
minetest.register_craft({
	output = "sas_core:handle_short",
	recipe = {
		{"", "", ""},
		{"sas_core:cord", "", "sas_core:glue"},
		{"", "default:stick", ""},
	},
})
minetest.register_craft({
	output = "sas_core:handle_medium",
	recipe = {
		{"", "", ""},
		{"sas_core:cord", "default:stick", "sas_core:glue"},
		{"", "default:stick", ""},
	},
})
minetest.register_craft({
	output = "sas_core:handle_long",
	recipe = {
		{"", "default:stick", ""},
		{"sas_core:cord", "default:stick", "sas_core:glue"},
		{"", "default:stick", ""},
	},
})
minetest.register_craft({
	output = "sas_core:handle_stock",
	replacements = {{"sas_core:tool_steel_saw", "sas_core:tool_steel_saw"}},
	recipe = {
		{"sas_core:tool_steel_saw", "stairs:slab_wood", ""},
		{"sas_core:iron_hardware", "sas_core:glue", "default:wood"},
		{"sas_core:steel_spring_light", "stairs:slab_wood", ""},
	},
})


--Crafting
minetest.register_craft({
	output = 'default:wood 4',
	replacements = {{"sas_core:tool_steel_saw", "sas_core:tool_steel_saw"}},
	recipe = {
		{'', 'sas_core:tool_steel_saw', ''},
		{'', 'default:tree', ''},
	}
})

minetest.register_craft({
	output = 'default:junglewood 4',
	replacements = {{"sas_core:tool_steel_saw", "sas_core:tool_steel_saw"}},
	recipe = {
		{'', 'sas_core:tool_steel_saw', ''},
		{'', 'default:jungletree', ''},
	}
})



minetest.register_craft({
	output = 'default:stick 4',
	replacements = {{"sas_core:tool_steel_saw", "sas_core:tool_steel_saw"}},
	recipe = {
	{'', 'sas_core:tool_steel_saw', ''},
		{'' ,'group:wood', ''},
	}
})

minetest.register_craft({
	output = 'default:sign_wall_wood 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'sas_core:cord', 'default:stick', 'sas_core:cord'},
	}
})

minetest.register_craft({
	output = 'default:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'sas_core:iron_hardware', 'sas_core:iron_hinge', 'sas_core:iron_hardware'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = "default:ladder_wood 5",
	recipe = {
		{"default:stick", "sas_core:cord", "default:stick"},
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "sas_core:cord", "default:stick"},
	}
})


--firefly
minetest.register_craft( {
	output = "fireflies:bug_net",
	recipe = {
		{"sas_core:cord", "sas_core:cord"},
		{"sas_core:cord", "sas_core:cord"},
		{"group:stick", ""}
	}
})


