
minetest.register_alias("default:shelf", "vessels:shelf")
minetest.register_alias("default:glass_bottle", "vessels:glass_bottle")
minetest.register_alias("default:drinking_glass", "vessels:drinking_glass")
minetest.register_alias("default:steel_bottle", "vessels:steel_bottle")


--[[
-- vessels/init.lua

-- Minetest 0.4 mod: vessels
-- See README.txt for licensing and other information.

-- Load support for MT game translation.
local S = minetest.get_translator("vessels")


local vessels_shelf_formspec =
	"size[8,7;]" ..
	"list[context;vessels;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;vessels]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 2.85)

local function update_vessels_shelf(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local invlist = inv:get_list("vessels")

	local formspec = vessels_shelf_formspec
	-- Inventory slots overlay
	local vx, vy = 0, 0.3
	local n_items = 0
	for i = 1, 16 do
		if i == 9 then
			vx = 0
			vy = vy + 1
		end
		if not invlist or invlist[i]:is_empty() then
			formspec = formspec ..
				"image[" .. vx .. "," .. vy .. ";1,1;vessels_shelf_slot.png]"
		else
			local stack = invlist[i]
			if not stack:is_empty() then
				n_items = n_items + stack:get_count()
			end
		end
		vx = vx + 1
	end
	meta:set_string("formspec", formspec)
	if n_items == 0 then
		meta:set_string("infotext", S("Empty Vessels Shelf"))
	else
		meta:set_string("infotext", S("Vessels Shelf (@1 items)", n_items))
	end
end

minetest.register_node("vessels:shelf", {
	description = S("Vessels Shelf"),
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png",
		"default_wood.png", "vessels_shelf.png", "vessels_shelf.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		update_vessels_shelf(pos)
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8 * 2)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("vessels")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if minetest.get_item_group(stack:get_name(), "vessel") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			   " moves stuff in vessels shelf at ".. minetest.pos_to_string(pos))
		update_vessels_shelf(pos)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			   " moves stuff to vessels shelf at ".. minetest.pos_to_string(pos))
		update_vessels_shelf(pos)
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			   " takes stuff from vessels shelf at ".. minetest.pos_to_string(pos))
		update_vessels_shelf(pos)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "vessels", drops)
		drops[#drops + 1] = "vessels:shelf"
		minetest.remove_node(pos)
		return drops
	end,
})

minetest.register_craft({
	output = "vessels:shelf",
	recipe = {
		{"sas_core:box", "default:fence_rail_wood", "sas_core:box"},
		{"group:vessel", "group:vessel", "group:vessel"},
		{"sas_core:box", "default:fence_rail_wood", "sas_core:box"},
	}
})

minetest.register_node("vessels:glass_bottle", {
	description = S("Empty Glass Bottle"),
	drawtype = "plantlike",
	tiles = {"vessels_glass_bottle.png"},
	inventory_image = "vessels_glass_bottle.png",
	wield_image = "vessels_glass_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:glass_bottle 10",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:glass", "", "default:glass"},
		{"", "default:glass", ""}
	}
})

minetest.register_node("vessels:drinking_glass", {
	description = S("Empty Drinking Glass"),
	drawtype = "plantlike",
	tiles = {"vessels_drinking_glass.png"},
	inventory_image = "vessels_drinking_glass_inv.png",
	wield_image = "vessels_drinking_glass.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:drinking_glass 14",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:glass", "", "default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

minetest.register_node("vessels:steel_bottle", {
	description = S("Empty Heavy Steel Bottle"),
	drawtype = "plantlike",
	tiles = {"vessels_steel_bottle.png"},
	inventory_image = "vessels_steel_bottle.png",
	wield_image = "vessels_steel_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "vessels:steel_bottle 5",
	recipe = {
		{"sas_core:steel_plate", "", "sas_core:steel_plate"},
		{"sas_core:steel_plate", "", "sas_core:steel_plate"},
		{"", "sas_core:steel_ingot", ""}
	}
})


-- Glass and steel recycling

minetest.register_craftitem("vessels:glass_fragments", {
	description = S("Glass Fragments"),
	inventory_image = "vessels_glass_fragments.png",
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:glass_bottle",
		"vessels:glass_bottle",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:drinking_glass",
		"vessels:drinking_glass",
	},
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "vessels:glass_fragments",
})

minetest.register_craft( {
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "vessels:steel_bottle",
})

minetest.register_craft({
	type = "fuel",
	recipe = "vessels:shelf",
	burntime = 30,
})

]]

--[[

License of source code
----------------------

GNU Lesser General Public License, version 2.1
Copyright (C) 2012-2016 Vanessa Ezekowitz
Copyright (C) 2012-2016 celeron55, Perttu Ahola <celeron55@gmail.com>
Copyright (C) 2012-2016 Various Minetest developers and contributors

This program is free software; you can redistribute it and/or modify it under the terms
of the GNU Lesser General Public License as published by the Free Software Foundation;
either version 2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details:
https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html


Licenses of media (textures)
----------------------------

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
Copyright (C) 2012-2016 Vanessa Ezekowitz
Copyright (C) 2016 Thomas-S

You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

ShareAlike — If you remix, transform, or build upon the material, you must distribute
your contributions under the same license as the original.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/3.0/



Minetest Game mod: vessels
==========================
See license.txt for license information.

Authors of source code
----------------------
Originally by Vanessa Ezekowitz (LGPL 2.1)
Modified by Perttu Ahola <celeron55@gmail.com> (LGPL 2.1)
Various Minetest developers and contributors (LGPL 2.1)

Authors of media (textures)
---------------------------
All not listed below, Vanessa Ezekowitz (CC BY-SA 3.0)

The following textures were modified by Thomas-S (CC BY-SA 3.0):
  vessels_drinking_glass.png
  vessels_drinking_glass_inv.png
  vessels_glass_bottle.png
  vessels_steel_bottle.png

The following texture was created by Wuzzy (CC BY-SA 3.0):
  vessels_shelf_slot.png (based on vessels_glass_bottle.png)

]]


