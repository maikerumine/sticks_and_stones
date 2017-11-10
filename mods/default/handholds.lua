
-- function to safely remove climbable air
local function remove_air(pos, oldnode)
	local dir = minetest.facedir_to_dir(oldnode.param2)
	local airpos = vector.subtract(pos, dir)

	local north_node = minetest.get_node({x = airpos.x, y = airpos.y, z = airpos.z+1})
	local south_node = minetest.get_node({x = airpos.x, y = airpos.y, z = airpos.z-1})
	local east_node = minetest.get_node({x = airpos.x+1, y = airpos.y, z = airpos.z})
	local west_node = minetest.get_node({x = airpos.x-1, y = airpos.y, z = airpos.z})

	local keep_air =
		(minetest.get_item_group(north_node.name, "default") == 1 and
		north_node.param2 == 0) or
		(minetest.get_item_group(south_node.name, "default") == 1 and
		south_node.param2 == 2) or
		(minetest.get_item_group(east_node.name, "default") == 1 and
		east_node.param2 == 1) or
		(minetest.get_item_group(west_node.name, "default") == 1 and
		west_node.param2 == 3)

	if not keep_air then
		minetest.set_node(airpos, {name = "air"})
	end
end


-- climbable air!
minetest.register_node("default:climbable_air", {
	description = "Air!",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	climbable = true,
	drop = "",
	groups = {not_in_creative_inventory = 1}
})


-- handholds nodes
minetest.register_node("default:hstone", {
	description = "Stone",
	tiles = {
		"default_stone.png", "default_stone.png", 
		"default_stone.png", "default_stone.png", 
		"default_stone.png", "default_stone.png^handholds_holds.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = 1, handholds = 1},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
	after_destruct = function(pos, oldnode)
		remove_air(pos, oldnode)
	end,
})

minetest.register_node("default:hdesert_stone", {
	description = "Stone",
	tiles = {
		"default_desert_stone.png", "default_desert_stone.png", 
		"default_desert_stone.png", "default_desert_stone.png", 
		"default_desert_stone.png", "default_desert_stone.png^handholds_holds.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = 1, handholds = 1},
	drop = 'default:desert_cobble',
	sounds = default.node_sound_stone_defaults(),
	after_destruct = function(pos, oldnode)
		remove_air(pos, oldnode)
	end,
})

minetest.register_node("default:hsandstone", {
	description = "Stone",
	tiles = {
		"default_sandstone.png", "default_sandstone.png", 
		"default_sandstone.png", "default_sandstone.png", 
		"default_sandstone.png", "default_sandstone.png^handholds_holds.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = 1, handholds = 1},
	drop = 'default:sandstone',
	sounds = default.node_sound_stone_defaults(),
	after_destruct = function(pos, oldnode)
		remove_air(pos, oldnode)
	end,
})

minetest.register_node("default:hice", {
	description = "Stone",
	tiles = {
		"default_ice.png", "default_ice.png", 
		"default_ice.png", "default_ice.png", 
		"default_ice.png", "default_ice.png^handholds_holds.png"
	},
	paramtype2 = "facedir",
	groups = {
		cracky = 3, puts_out_fire = 1, cools_lava = 1,
		not_in_creative_inventory = 1, handholds = 1
	},
	drop = 'default:ice',
	sounds = default.node_sound_glass_defaults(),
	after_destruct = function(pos, oldnode)
		remove_air(pos, oldnode)
	end,
})

--[[
-- handholds tool
minetest.register_tool("default:tool_climbing_pick", {
	description = "Climbing Pick",
	inventory_image = "handholds_tool.png^[colorize:red:75",
	sound = {breaks = "default_tool_breaks"},
	on_use = function(itemstack, player, pointed_thing)
		if not pointed_thing or 
				pointed_thing.type ~= "node" or 
				minetest.is_protected(pointed_thing.under, player:get_player_name()) or
				minetest.is_protected(pointed_thing.above, player:get_player_name()) or
				pointed_thing.under.y + 1 == pointed_thing.above.y or
				pointed_thing.under.y - 1 == pointed_thing.above.y then
			return
		end

		local node_def = 
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name]
		if not node_def or not node_def.buildable_to then
			return
		end

		local node_name = minetest.get_node(pointed_thing.under).name
		local rotation = minetest.dir_to_facedir(
			vector.subtract(pointed_thing.under, pointed_thing.above))

		if node_name == "default:stone" then
			minetest.set_node(pointed_thing.under,
				{name = "default:hstone", param2 = rotation})
		elseif node_name == "default:desert_stone" then
			minetest.set_node(pointed_thing.under,
				{name = "default:hdesert_stone", param2 = rotation})
		elseif node_name == "default:sandstone" then
			minetest.set_node(pointed_thing.under,
				{name = "default:hsandstone", param2 = rotation})
		elseif node_name == "default:ice" then
			minetest.set_node(pointed_thing.under,
				{name = "default:hice", param2 = rotation})
		else
			return
		end

		minetest.set_node(pointed_thing.above, {name = "default:climbable_air"})
		minetest.sound_play(
			"default_dig_cracky",
			{pos = pointed_thing.above, gain = 0.5, max_hear_distance = 8}
		)

		if not minetest.setting_getbool("creative_mode") then
			local wdef = itemstack:get_definition()
			itemstack:add_wear(256)
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks,
					{pos = pointed_thing.above, gain = 0.5})
			end
			return itemstack
		end
	end
})

minetest.register_craft({
	output = "default:tool_climbing_pick",
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:stick', 'default:glue', 'default:cord'},
		{'default:handle_medium', 'default:cord', ''},
	},
})

]]
--[[
Textures:
CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
Attribution: Shara RedCat

Code:
License: MIT (https://opensource.org/licenses/MIT)
By Shara RedCat



---

The MIT License (MIT)

Copyright (c) 2017 Shara RedCat

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]