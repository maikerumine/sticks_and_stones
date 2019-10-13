
--[[

Torch mod - formerly mod "Torches"
======================

(c) Copyright BlockMen (2013-2015)
(C) Copyright sofar <sofar@foo-projects.org> (2016)

This mod changes the default torch drawtype from "torchlike" to "mesh",
giving the torch a three dimensional appearance. The mesh contains the
proper pixel mapping to make the animation appear as a particle above
the torch, while in fact the animation is just the texture of the mesh.


License:
~~~~~~~~
(c) Copyright BlockMen (2013-2015)

Textures and Meshes/Models:
CC-BY 3.0 BlockMen
Note that the models were entirely done from scratch by sofar.

Code:
Licensed under the GNU LGPL version 2.1 or higher.
You can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License
as published by the Free Software Foundation;

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

See LICENSE.txt and http://www.gnu.org/licenses/lgpl-2.1.txt

--]]
minetest.register_alias("sas_core:torch", "default:torch")
--minetest.register_alias("default:torch", "sas_core:torch")

--minetest.register_node(":default:torch", {})
--minetest.clear_craft({output = "default:torch 4"}) 

minetest.clear_craft({
	output = "default:torch 4",
})


minetest.register_craft({
   output = "default:torch 4",
	recipe = {
		{'','default:coal_lump',''},
		{'','group:vines',''},
		{'','group:stick',''},
	}
})

minetest.register_craft({
   output = "default:torch 4",
	recipe = {
		{'default:coal_lump'},
		{'group:vines'},
		{'group:stick'},
	}
})



--[[
-- default/torch.lua

-- support for MT game translation.
local S = default.get_translator

local function on_flood(pos, oldnode, newnode)
	minetest.add_item(pos, ItemStack("sas_core:torch 1"))
	-- Play flame-extinguish sound if liquid is not an 'igniter'
	local nodedef = minetest.registered_items[newnode.name]
	if not (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
		minetest.sound_play(
			"default_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = 0.1}
		)
	end
	-- Remove the torch node
	return false
end

minetest.register_node("sas_core:torch", {
	description = S("Torch"),
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	tiles = {{
		    name = "default_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
	drop = "sas_core:torch",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("sas_core:torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("sas_core:torch")
		else
			fakestack:set_name("sas_core:torch_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("sas_core:torch")

		return itemstack
	end,
	floodable = true,
	on_flood = on_flood,
})

minetest.register_node("sas_core:torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {{
		    name = "default_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "sas_core:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	floodable = true,
	on_flood = on_flood,
})

minetest.register_node("sas_core:torch_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	tiles = {{
		    name = "default_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "sas_core:torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	floodable = true,
	on_flood = on_flood,
})

minetest.register_lbm({
	name = "sas_core:3dtorch",
	nodenames = {"sas_core:torch", "torches:floor", "torches:wall"},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "sas_core:torch_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "sas_core:torch",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "sas_core:torch_wall",
				param2 = node.param2})
		end
	end
})

--Crafting
minetest.register_craft({
	output = 'sas_core:torch 4',
	recipe = {
		{'default:coal_lump'},
		{'sas_core:cord'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'sas_core:torch 4',
	recipe = {
		{'default:coal_lump'},
		{'group:vines'},
		{'group:stick'},
	}
})
]]
