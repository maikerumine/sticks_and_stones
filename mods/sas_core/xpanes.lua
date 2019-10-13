
minetest.register_alias("default:pane", "xpanes:pane")
minetest.register_alias("default:pane_flat", "xpanes:pane_flat")
minetest.register_alias("default:bar", "xpanes:bar")
minetest.register_alias("default:gen2", "xpanes:gen2")
-- xpanes/init.lua


--[[
-- Load support for MT game translation.
local S = minetest.get_translator("xpanes")

-- xpanes/init.lua

-- Load support for MT game translation.
local S = minetest.get_translator("xpanes")


local function is_pane(pos)
	return minetest.get_item_group(minetest.get_node(pos).name, "pane") > 0
end

local function connects_dir(pos, name, dir)
	local aside = vector.add(pos, minetest.facedir_to_dir(dir))
	if is_pane(aside) then
		return true
	end

	local connects_to = minetest.registered_nodes[name].connects_to
	if not connects_to then
		return false
	end
	local list = minetest.find_nodes_in_area(aside, aside, connects_to)

	if #list > 0 then
		return true
	end

	return false
end

local function swap(pos, node, name, param2)
	if node.name == name and node.param2 == param2 then
		return
	end

	minetest.swap_node(pos, {name = name, param2 = param2})
end

local function update_pane(pos)
	if not is_pane(pos) then
		return
	end
	local node = minetest.get_node(pos)
	local name = node.name
	if name:sub(-5) == "_flat" then
		name = name:sub(1, -6)
	end

	local any = node.param2
	local c = {}
	local count = 0
	for dir = 0, 3 do
		c[dir] = connects_dir(pos, name, dir)
		if c[dir] then
			any = dir
			count = count + 1
		end
	end

	if count == 0 then
		swap(pos, node, name .. "_flat", any)
	elseif count == 1 then
		swap(pos, node, name .. "_flat", (any + 1) % 4)
	elseif count == 2 then
		if (c[0] and c[2]) or (c[1] and c[3]) then
			swap(pos, node, name .. "_flat", (any + 1) % 4)
		else
			swap(pos, node, name, 0)
		end
	else
		swap(pos, node, name, 0)
	end
end

minetest.register_on_placenode(function(pos, node)
	if minetest.get_item_group(node, "pane") then
		update_pane(pos)
	end
	for i = 0, 3 do
		local dir = minetest.facedir_to_dir(i)
		update_pane(vector.add(pos, dir))
	end
end)

minetest.register_on_dignode(function(pos)
	for i = 0, 3 do
		local dir = minetest.facedir_to_dir(i)
		update_pane(vector.add(pos, dir))
	end
end)

xpanes = {}
function xpanes.register_pane(name, def)
	for i = 1, 15 do
		minetest.register_alias("xpanes:" .. name .. "_" .. i, "xpanes:" .. name .. "_flat")
	end

	local flatgroups = table.copy(def.groups)
	flatgroups.pane = 1
	minetest.register_node(":xpanes:" .. name .. "_flat", {
		description = def.description,
		drawtype = "nodebox",
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		inventory_image = def.inventory_image,
		wield_image = def.wield_image,
		paramtype2 = "facedir",
		tiles = {
				def.textures[3],
				def.textures[3],
				def.textures[3],
				def.textures[3],
				def.textures[1],
				def.textures[1]
		},
		groups = flatgroups,
		drop = "xpanes:" .. name .. "_flat",
		sounds = def.sounds,
		use_texture_alpha = def.use_texture_alpha or false,
		node_box = {
			type = "fixed",
			fixed = {{-1/2, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-1/2, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
		connect_sides = { "left", "right" },
	})

	local groups = table.copy(def.groups)
	groups.pane = 1
	groups.not_in_creative_inventory = 1
	minetest.register_node(":xpanes:" .. name, {
		drawtype = "nodebox",
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		description = def.description,
		tiles = {def.textures[3], def.textures[3], def.textures[1]},
		groups = groups,
		drop = "xpanes:" .. name .. "_flat",
		sounds = def.sounds,
		use_texture_alpha = def.use_texture_alpha or false,
		node_box = {
			type = "connected",
			fixed = {{-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}},
			connect_front = {{-1/32, -1/2, -1/2, 1/32, 1/2, -1/32}},
			connect_left = {{-1/2, -1/2, -1/32, -1/32, 1/2, 1/32}},
			connect_back = {{-1/32, -1/2, 1/32, 1/32, 1/2, 1/2}},
			connect_right = {{1/32, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
		connects_to = {"group:pane", "group:stone", "group:glass", "group:wood", "group:tree"},
	})

	minetest.register_craft({
		output = "xpanes:" .. name .. "_flat 16",
		recipe = def.recipe
	})
end

xpanes.register_pane("pane", {
	description = S("Glass Pane"),
	textures = {"default_glass.png","xpanes_pane_half.png","xpanes_edge.png"},
	inventory_image = "default_glass.png",
	wield_image = "default_glass.png",
	sounds = default.node_sound_glass_defaults(),
	groups = {snappy=2, cracky=3, oddly_breakable_by_hand=3},
	recipe = {
		{"default:glass", "default:glass", "default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

xpanes.register_pane("obsidian_pane", {
	description = S("Obsidian Glass Pane"),
	textures = {"default_obsidian_glass.png","xpanes_pane_half.png","xpanes_edge_obsidian.png"},
	inventory_image = "default_obsidian_glass.png",
	wield_image = "default_obsidian_glass.png",
	sounds = default.node_sound_glass_defaults(),
	groups = {snappy=2, cracky=3},
	recipe = {
		{"default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass"},
		{"default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass"}
	}
})

xpanes.register_pane("bar", {
	description = S("Steel Bars"),
	textures = {"xpanes_bar.png","xpanes_bar.png","xpanes_bar_top.png"},
	inventory_image = "xpanes_bar.png",
	wield_image = "xpanes_bar.png",
	groups = {cracky=2},
	sounds = default.node_sound_metal_defaults(),
	recipe = {
		{"sas_core:iron_bars", "sas_core:iron_bars", "sas_core:iron_bars"},
		{"sas_core:iron_bars", "sas_core:iron_bars", "sas_core:iron_bars"}
	}
})

minetest.register_lbm({
	name = "xpanes:gen2",
	nodenames = {"group:pane"},
	action = function(pos, node)
		update_pane(pos)
		for i = 0, 3 do
			local dir = minetest.facedir_to_dir(i)
			update_pane(vector.add(pos, dir))
		end
	end
})

-- Register steel bar doors and trapdoors

if minetest.get_modpath("doors") then

	doors.register("xpanes:door_steel_bar", {
		tiles = {{name = "xpanes_door_steel_bar.png", backface_culling = true}},
		description = S("Steel Bar Door"),
		inventory_image = "xpanes_item_steel_bar.png",
		protected = true,
		groups = {cracky = 1, level = 2},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "xpanes_steel_bar_door_open",
		sound_close = "xpanes_steel_bar_door_close",
		recipe = {
			{"sas_core:iron_hinge", "xpanes:bar_flat", "xpanes:bar_flat"},
			{"sas_core:iron_hardware", "xpanes:bar_flat", "xpanes:bar_flat"},
			{"sas_core:iron_hinge", "xpanes:bar_flat", "xpanes:bar_flat"},
		},
	})

	doors.register_trapdoor("xpanes:trapdoor_steel_bar", {
		description = S("Steel Bar Trapdoor"),
		inventory_image = "xpanes_trapdoor_steel_bar.png",
		wield_image = "xpanes_trapdoor_steel_bar.png",
		tile_front = "xpanes_trapdoor_steel_bar.png",
		tile_side = "xpanes_trapdoor_steel_bar_side.png",
		protected = true,
		groups = {cracky = 1, level = 2, door = 1},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "xpanes_steel_bar_door_open",
		sound_close = "xpanes_steel_bar_door_close",
	})

	minetest.register_craft({
		output = "xpanes:trapdoor_steel_bar",
		recipe = {
			{"sas_core:iron_hardware", "xpanes:bar_flat", "xpanes:bar_flat"},
			{"sas_core:iron_hinge", "xpanes:bar_flat", "xpanes:bar_flat"},
		}
	})
end

License of source code
----------------------

The MIT License (MIT)
Copyright (C) 2014-2016 xyz
Copyright (C) 2014-2016 BlockMen
Copyright (C) 2016 Auke Kok <sofar@foo-projects.org>
Copyright (C) 2014-2016 Various Minetest developers and contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

For more details:
https://opensource.org/licenses/MIT


Licenses of media (textures)
----------------------------

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
Copyright (C) 2014-2016 xyz
Copyright (C) 2013-2016 Gambit
Copyright (C) 2016 paramat

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







Minetest Game mod: xpanes
=========================
See license.txt for license information.

Authors of source code
----------------------
Originally by xyz (MIT)
BlockMen (MIT)
sofar (MIT)
Various Minetest developers and contributors (MIT)

Authors of media (textures)
---------------------------
xyz (CC BY-SA 3.0):
  All textures not mentioned below.

Gambit (CC BY-SA 3.0):
  xpanes_bar.png

paramat (CC BY-SA 3.0):
  xpanes_bar_top.png

]]
