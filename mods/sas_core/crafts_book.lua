--Book crafts

--OVERRIDE ITEM
--[[
minetest.override_item("default:mese", {
    light_source = LIGHT_MAX,
    groups = {unbreakable=1},
})
]]

minetest.register_craft({
	output = 'default:book',
	recipe = {
		{'sas_core:glue', 'default:paper',''},
		{'sas_core:glue', 'default:paper',''},
		{'sas_core:glue', 'default:paper',''},
	}
})

minetest.register_craft({
	output = "default:bookshelf",
	recipe = {
		{"sas_core:box", "default:fence_rail_wood", "sas_core:box"},
		{"default:book", "default:book", "default:book"},
		{"sas_core:box", "default:fence_rail_wood", "sas_core:box"},
	}
})

