
--[[

Copyright (C) 2015 - Auke Kok <sofar@foo-projects.org>

"crops" is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1
of the license, or (at your option) any later version.

--]]

--
-- cooking recipes that don't go directly with any of the
-- crops in this mod - either these combine them in new
-- ways or use other items
--

-- Intllib
local S = farming.intllib

minetest.register_craftitem("farming:unbaked_clay_bowl", {
	description = S("Unbaked clay bowl"),
	inventory_image = "crops_unbaked_clay_bowl.png",
})

minetest.register_craft({
	output = "farming:unbaked_clay_bowl",
	recipe = {
		{ "", "", "" },
		{ "default:clay_lump", "", "default:clay_lump" },
		{ "", "default:clay_lump", "" }
	}
})

minetest.register_craftitem("farming:clay_bowl", {
	description = S("Clay bowl"),
	inventory_image = "crops_clay_bowl.png",
	groups = { food_bowl=1 }
})

minetest.register_craft({
	type = "cooking",
	output = "farming:clay_bowl",
	recipe = "farming:unbaked_clay_bowl"
})

minetest.register_craftitem("farming:vegetable_stew", {
	description = S("Bowl of vegetable stew"),
	inventory_image = "crops_bowl_vegetable_stew.png",
	groups = { eatable=1 },
	on_use = minetest.item_eat(8, "farming:clay_bowl"),
})

minetest.register_craft({
	type = "cooking",
	output = "farming:vegetable_stew",
	recipe = "farming:uncooked_vegetable_stew"
})

minetest.register_craftitem("farming:uncooked_vegetable_stew", {
	description = S("Bowl of uncooked vegetable stew"),
	inventory_image = "crops_bowl_uncooked_vegetable_stew.png",
	groups = { eatable=1 },
	on_use = minetest.item_eat(2, "farming:clay_bowl")
})

minetest.register_craft({
	output = "farming:uncooked_vegetable_stew",
	recipe = {
		{ "", "", "" },
		{ "farming:green_bean", "farming:potato", "farming:tomato" },
		{ "", "group:food_bowl", "" }
	}
})
