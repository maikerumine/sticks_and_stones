
--[[

Copyright (C) 2015 - Auke Kok <sofar@foo-projects.org>

"crops" is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1
of the license, or (at your option) any later version.

--]]

-- Intllib
local S = farming.intllib

minetest.register_node("farming:corn", {
	description = S("Corn"),
	inventory_image = "crops_corn.png",
	wield_image = "crops_corn.png",
	tiles = { "crops_corn_base_seed.png" },
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	waving = 1,
	sunlight_propagates = true,
	use_texture_alpha = true,
	walkable = true,
	paramtype = "light",
	node_placement_prediction = "farming:corn_base_seed",
	groups = { snappy=3,flammable=3,flora=1,attached_node=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),

	on_place = function(itemstack, placer, pointed_thing)
		local under = minetest.get_node(pointed_thing.under)
		if minetest.get_item_group(under.name, "soil") <= 1 then
			return
		end
		farming.plant(pointed_thing.above, {name="farming:corn_base_seed", param2 = 3})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_craftitem("farming:corn_cob", {
	description = S("Corn Cob"),
	inventory_image = "crops_corn_cob.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:corn",
	recipe = { "farming:corn_cob" }
})

minetest.register_craftitem("farming:corn_on_the_cob", {
	description = S("Corn on the Cob"),
	inventory_image = "crops_corn_on_the_cob.png",
	on_use = minetest.item_eat(1)
})

minetest.register_craft({
	type = "cooking",
	output = "farming:corn_on_the_cob",
	recipe = "farming:corn_cob"
})

minetest.register_node("farming:corn_base_seed", {
	visual = "mesh",
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	waving = 1,
	tiles = { "crops_corn_base_seed.png" },
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5,  0.5, -0.3, 0.5}
	}
})

minetest.register_abm({
	nodenames = { "farming:corn_base_seed" },
	neighbors = { "group:soil" },
	interval = farming.settings.interval,
	chance = farming.settings.chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if not farming.can_grow(pos) then
			return
		end
		minetest.swap_node(pos, { name = "farming:corn_base_1", param2 = 3 })
	end
})

minetest.register_node("farming:corn_base_1", {
	visual = "mesh",
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	tiles = { "crops_corn_base_1.png" },
	waving = 1,
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_abm({
	nodenames = { "farming:corn_base_1" },
	neighbors = { "group:soil" },
	interval = farming.settings.interval,
	chance = farming.settings.chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if not farming.can_grow(pos) then
			return
		end
		if not minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" then
			return
		end
		minetest.swap_node(pos, { name = "farming:corn_base_2", param2 = 3 })
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		minetest.set_node(above , { name = "farming:corn_top_1", param2 = 3 })
		local meta = minetest.get_meta(above)
		meta:set_int("crops_top_half", 1)
	end
})

minetest.register_node("farming:corn_base_2", {
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	tiles = { "crops_corn_base_2.png" },
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
	on_dig = function(pos, node, digger)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if minetest.get_node(above).name == "farming:corn_top_1" or minetest.get_node(above).name == "farming:corn_top_2" then
			minetest.remove_node(above)
			minetest.remove_node(pos)
			return
		end
		if not minetest.get_node(above).name == "farming:corn_top_3" then
			minetest.remove_node(pos)
		end

		local meta = minetest.get_meta(pos)
		local damage = meta:get_int("crops_damage")
		local drops = {}
		--   0 - 2-4
		--  50 - 2-3
		-- 100 - 1-1
		for i = 1,math.random(2 - (damage / 100), 4 - (3 * (damage / 100))) do
			table.insert(drops, ('farming:corn_cob'))
		end
		minetest.set_node(pos, { name = "farming:corn_base_3", param2 = 3 })
		minetest.set_node(above, { name = "farming:corn_top_4", param2 = 3 })
		core.handle_node_drops(above, drops, digger)
	end
})

minetest.register_node("farming:corn_base_3", {
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	tiles = { "crops_corn_base_3.png" },
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1 , dig_by_water = 1},
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
	on_dig = function(pos, node, digger)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if minetest.get_node(above).name == "farming:corn_top_4" then
			minetest.remove_node(above)
		end
		minetest.remove_node(pos)
	end
})

minetest.register_node("farming:corn_top_1", {
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	tiles = { "crops_corn_base_1.png" },
	waving = 1,
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,not_in_creative_inventory=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
	on_dig = function(pos, node, digger)
		local below = {x = pos.x, y = pos.y - 1, z = pos.z}
		if not minetest.get_node(below).name == "farming:base_2" then
			return
		end
		minetest.remove_node(below)
		minetest.remove_node(pos)
	end
})

minetest.register_abm({
	nodenames = { "farming:corn_top_1" },
	neighbors = { "farming:corn_base_2" },
	interval = farming.settings.interval,
	chance = farming.settings.chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_node_light(pos, nil) < farming.settings.light then
			return
		end
		minetest.swap_node(pos, { name = "farming:corn_top_2", param2 = 3 })
	end
})

minetest.register_node("farming:corn_top_2", {
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	tiles = { "crops_corn_top_1.png" },
	waving = 1,
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,not_in_creative_inventory=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
	
	on_dig = function(pos, node, digger)
		local below = {x = pos.x, y = pos.y - 1, z = pos.z}
		if not minetest.get_node(below).name == "farming:base_2" then
			return
		end
		minetest.remove_node(below)
		minetest.remove_node(pos)
	end
})

minetest.register_abm({
	nodenames = { "farming:corn_top_2" },
	neighbors = { "farming:corn_base_2" },
	interval = farming.settings.interval,
	chance = farming.settings.chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		-- we don't call farming.grow here otherwise there would be 2 abm's hitting
		-- this stack, and dmg needs to be applied to the bottom part
		if minetest.get_node_light(pos, nil) < farming.settings.light then
			return
		end
		minetest.swap_node(pos, { name = "farming:corn_top_3", param2 = 3 })
	end
})

minetest.register_node("farming:corn_top_3", {
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	tiles = { "crops_corn_top_2.png" },
	waving = 1,
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,not_in_creative_inventory=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
	
	on_dig = function(pos, node, digger)
		local below = { x = pos.x, y = pos.y - 1, z = pos.z }
		local meta = minetest.get_meta(below)
		local damage = meta:get_int("crops_damage")
		local drops = {}
		--   0 - 2-4
		--  50 - 2-3
		-- 100 - 1-1
		for i = 1,math.random(2 - (damage / 100), 4 - (3 * (damage / 100))) do
			table.insert(drops, ('farming:corn_cob'))
		end
		farming.die(below)
		core.handle_node_drops(pos, drops, digger)
	end
})

minetest.register_node("farming:corn_top_4", {
	description = S("Corn plant"),
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	tiles = { "crops_corn_top_3.png" },
	waving = 1,
	use_texture_alpha = true,
	walkable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = { snappy=3,flammable=3,flora=1,not_in_creative_inventory=1, dig_by_water = 1 },
	drop = {},
	sounds = default.node_sound_leaves_defaults(),
	
	on_dig = function(pos, node, digger)
		local below = {x = pos.x, y = pos.y - 1, z = pos.z}
		if minetest.get_node(below).name == "farming:corn_base_3" then
			minetest.remove_node(below)
		end
		minetest.remove_node(pos)
	end
})

farming.corn_die = function(pos)
	minetest.set_node(pos, { name = "farming:corn_base_3", param2 = 3 })
	local above = {x = pos.x, y = pos.y + 1, z = pos.z}
	minetest.set_node(above, { name = "farming:corn_top_4", param2 = 3 })
end

local properties = {
	die = farming.corn_die,
	waterstart = 40,
	wateruse = 1,
	night = 5,
	soak = 60,
	soak_damage = 75,
	wither = 10,
	wither_damage = 5,
	doublesize = true,
}

farming.register({ name = "farming:corn_base_seed", properties = properties })
farming.register({ name = "farming:corn_base_1", properties = properties })
farming.register({ name = "farming:corn_base_2", properties = properties })
farming.register({ name = "farming:corn_base_3", properties = properties })

