

minetest.register_node("fire:candle", {
	description = "Candle  --Gives off 9 light",
	drawtype = "mesh",
	mesh = "homedecor_candle_thin.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_thin_inv.png",
	paramtype = "light",
	--paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 9,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1, dig_by_water = 1},
	drop = "fire:candle",
	selection_box = {
	type = "fixed",
		fixed =
		{ -0.125, -0.5, -0.125, 0.125, 0.05, 0.125 },
	},
	sounds = default.node_sound_wood_defaults(),
	--[[
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			((not placer) or (placer and not placer:get_player_control().sneak)) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("default:torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("default:torch")
		else
			fakestack:set_name("default:torch_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("default:torch")

		return itemstack
	end
	]]
})



--Crafting
minetest.register_craft({
	output = 'fire:candle 4',
	recipe = {
		{'default:coal_lump'},
		{'sas_core:cord'},
		{'group:wax'},
	}
})

minetest.register_craft({
	output = 'fire:candle 4',
	recipe = {
		{'default:coal_lump'},
		{'group:vines'},
		{'group:wax'},
	}
})



--[[
local tc_cbox = {
	type = "fixed",
	fixed = {
		{ -0.1875, -0.5, -0.1875, 0.1875, 0.375, 0.1875 },
	}
}

homedecor.register("candle", {
	description = S("Thick Candle"),
	mesh = "homedecor_candle_thick.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_inv.png",
	selection_box = tc_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local c_cbox = {
	type = "fixed",
	fixed = {
		{ -0.125, -0.5, -0.125, 0.125, 0.05, 0.125 },
	}
}

homedecor.register("candle_thin", {
	description = S("Thin Candle"),
	mesh = "homedecor_candle_thin.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_thin_inv.png",
	selection_box = c_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local cs_cbox = {
	type = "fixed",
	fixed = {
		{ -0.15625, -0.5, -0.15625, 0.15625, 0.3125, 0.15625 },
	}
}

homedecor.register("candlestick_wrought_iron", {
	description = S("Candlestick (wrought iron)"),
	mesh = "homedecor_candlestick.obj",
	tiles = {
		"homedecor_candle_sides.png",
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		"homedecor_generic_metal_wrought_iron.png",
	},
	inventory_image = "homedecor_candlestick_wrought_iron_inv.png",
	selection_box = cs_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})


Most code and all textures by Vanessa Ezekowitz.

Some code copied and modified from the game's default mods (especially 
doors) and ironzorg's flowers mod.

Licenses: 
* For the lua code, LGPL. 
* For the door open/close sound, CC-By-SA 3.0 by Slanesh on freesound.org
	http://freesound.org/people/Slanesh/sounds/31768/
* For the gate open/close sound, CC0, by j1987 on freesound.org
	http://freesound.org/people/j1987/sounds/106116/
* For the doorbell sound, CC0 by guitarguy1985 on freesound.org
	http://freesound.org/people/guitarguy1985/sounds/69384/
* For the book sound, Public Domain by mckinneysound's on http://www.freesfx.co.uk/
	http://www.freesfx.co.uk/sfx/book?p=3
* For the phone ring, Public Domain by andyt's on http://www.freesfx.co.uk/
	http://www.freesfx.co.uk/sfx/phone?p=5
* For all images and everything else, WTFPL.







]]
