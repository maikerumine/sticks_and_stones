
minetest.register_node(":beds:bed", {})
minetest.register_node(":beds:fancy_bed", {})
--[[
minetest.clear_craft({
    recipe = {
        {'default:tree'},
    }
})

minetest.clear_craft({
    recipe = {
        {'default:tree'},
    }
})
]]

minetest.clear_craft({
	recipe = {
		{"wool:white", "wool:white", "wool:white"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

minetest.clear_craft({
	recipe = {
		{"", "", "group:stick"},
		{"wool:white", "wool:white", "wool:white"},
		{"group:wood", "group:wood", "group:wood"},
	},
})
