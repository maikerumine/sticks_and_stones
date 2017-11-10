minetest.register_alias("darkage:lamp",        "fire:light")
minetest.register_alias("castle:street_light", "fire:light")
minetest.register_alias("castle:light",        "fire:light")
minetest.register_alias("castle:chandelier",   "fire:chandelier")
minetest.register_alias("castle:chandelier_chain",   "fire:chandelier_chain")

-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

--castle_lighting = {}

--dofile(MP.."/brasier.lua")

minetest.register_node("fire:light",{
	drawtype = "glasslike",
	description = S("Light Block"),
	sunlight_propagates = true,
	light_source = 13,
	tiles = {"darkage_lamp.png"},
	groups = {cracky=2, choppy = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
})

minetest.register_craft({
	output = "fire:light",
	recipe = {
		{"default:stick", "default:glass", "default:stick"},
		{"default:glass", "fire:oil_lamp_off", "default:glass"},
		{"default:stick", "default:glass", "default:stick"},
	}
})

minetest.register_node( "fire:chandelier", {
	drawtype = "plantlike",
	description = S("Chandelier"),
	paramtype = "light",
	wield_image = "castle_chandelier_wield.png",
	inventory_image = "castle_chandelier_wield.png", 
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
	sunlight_propagates = true,
	light_source = 14,
	tiles = {
			{
			name = "castle_chandelier.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.0
			},
		},
	},
	selection_box = {
		type = "fixed",
			fixed = {
				{0.35,-0.375,0.35,-0.35,0.5,-0.35},

		},
	},
})

minetest.register_craft({
	output = "fire:chandelier",
	recipe = {
		{"", "", ""},
		{"", "default:steel_bar", ""},
		{"fire:candle","fire:candle","fire:candle"},
	}
})
--[[
minetest.register_node( "fire:chandelier_chain", {
	drawtype = "plantlike",
	description = S("Chandelier Chain"),
	paramtype = "light",
	wield_image = "castle_chandelier_chain.png",
	inventory_image = "castle_chandelier_chain.png", 
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
	sunlight_propagates = true,
	tiles = {"castle_chandelier_chain.png"},
	selection_box = {
		type = "fixed",
			fixed = {
				{0.1,-0.5,0.1,-0.1,0.5,-0.1},

		},
	},
})

minetest.register_craft({
	output = "fire:chandelier_chain 4",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"", "", ""},
		{"","default:steel_ingot",""},
	}
})
]]