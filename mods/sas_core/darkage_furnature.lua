
minetest.register_alias("default:chain", "sas_core:chain")
minetest.register_alias("default:box", "sas_core:box")
minetest.register_alias("default:wood_shelves", "sas_core:wood_shelves")
minetest.register_alias("default:iron_grille", "sas_core:iron_grille")
minetest.register_alias("default:wood_bars", "sas_core:wood_bars")
minetest.register_alias("default:wood_grille", "sas_core:wood_grille")
minetest.register_alias("default:wood_frame", "sas_core:wood_frame")
minetest.register_alias("default:chain", "sas_core:chain")
minetest.register_alias("default:chain", "sas_core:chain")



minetest.register_node("sas_core:chain", {
	description = "Chain",
	drawtype = "plantlike",
	--tiles = {"darkage_chain.png"},
	inventory_image = "darkage_chain.png",
	wield_image = "darkage_chain.png",
	paramtype = "light",
	--paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	climbable = true,
	--selection_box = {
	--	type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	--},
	groups = {snappy=1,cracky=2,oddly_breakable_by_hand=2},
	tiles = {"darkage_chain.png"},
	selection_box = {
		type = "fixed",
			fixed = {
				{0.1,-0.5,0.1,-0.1,0.5,-0.1},

		},
	},
	legacy_wallmounted = true
})

minetest.register_node('sas_core:box', {
	description = "Box",
	tiles = { 'darkage_box_top.png','darkage_box_top.png','darkage_box.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,8]"..
				"list[current_name;main;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", "Box")
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in box at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to box at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from box at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_node('sas_core:wood_shelves', {
	description = "Wooden Shelves",
	tiles = { 'darkage_shelves.png','darkage_shelves.png','darkage_shelves.png',
            'darkage_shelves.png','darkage_shelves.png','darkage_shelves_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,10]"..
        "list[context;up;0,0;8,3;]"..
        "list[context;down;0,3;8,3;]"..
				"list[current_player;main;0,6;8,4;]")
		meta:set_string("infotext", "Wooden Shelves")
		local inv = meta:get_inventory()
		inv:set_size("up", 16)
		inv:set_size("down", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("shape") and inv:is_empty("out") and inv:is_empty("water")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in shelves at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to shelves at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from shelves at "..minetest.pos_to_string(pos))
	end,
})

--minetest.register_node("sas_core:rosace", {
--	description = "Rose Window",
--	tiles = {"darkage_rosace.png"},
--	is_ground_content = true,
--	groups = {cracky=3},
--	sounds = default.node_sound_stone_defaults()
--})

minetest.register_node("sas_core:iron_bars", {
	description = "Iron Bars",
	drawtype = "nodebox",
	paramtype2 = "facedir",
		node_box = {
			type = "connected",
			fixed = {{-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}},
			connect_front = {{-1/32, -1/2, -1/2, 1/32, 1/2, -1/32}},
			connect_left = {{-1/2, -1/2, -1/32, -1/32, 1/2, 1/32}},
			connect_back = {{-1/32, -1/2, 1/32, 1/32, 1/2, 1/2}},
			connect_right = {{1/32, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
	tiles = {"darkage_iron_bars.png"},
	inventory_image = "darkage_iron_bars.png",
	wield_image = "darkage_iron_bars.png",
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3, pane = 1},
	connects_to = {"group:pane", "group:stone", "group:glass", "group:wood", "group:tree"},
	sounds = default.node_sound_metal_defaults()
})
--[[
minetest.register_node("sas_core:lamp", {
	description = "Lamp",
	tiles = {
		"darkage_lamp.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = LIGHT_MAX-1,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,flammable=1},
	sounds = default.node_sound_glass_defaults(),
})
]]
minetest.register_node("sas_core:iron_grille", {
	description = "Iron Grille",
	drawtype = "nodebox",
	paramtype2 = "facedir",
		node_box = {
			type = "connected",
			fixed = {{-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}},
			connect_front = {{-1/32, -1/2, -1/2, 1/32, 1/2, -1/32}},
			connect_left = {{-1/2, -1/2, -1/32, -1/32, 1/2, 1/32}},
			connect_back = {{-1/32, -1/2, 1/32, 1/32, 1/2, 1/2}},
			connect_right = {{1/32, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
	tiles = {"darkage_iron_grille.png"},
	inventory_image = "darkage_iron_grille.png",
	wield_image = "darkage_iron_grille.png",
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3, pane = 1},
	connects_to = {"group:pane", "group:stone", "group:glass", "group:wood", "group:tree"},
	sounds = default.node_sound_metal_defaults()
})

minetest.register_node("sas_core:wood_bars", {
	description = "Wooden Bars",
  drawtype = "glasslike",
	tiles = {"darkage_wood_bars.png"},
  inventory_image = "darkage_wood_bars.png",
	wield_image = "darkage_wood_bars.png",
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:wood_grille", {
	description = "Wooden Grille",
  drawtype = "glasslike",
	tiles = {"darkage_wood_grille.png"},
  inventory_image = "darkage_wood_grille.png",
	wield_image = "darkage_wood_grille.png",
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("sas_core:wood_frame", {
	description = "Wooden Frame",
  drawtype = "glasslike",
	tiles = {"darkage_wood_frame.png"},
  inventory_image = "darkage_wood_frame.png",
	wield_image = "darkage_wood_frame.png",
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

---------------
-- Crafts Item
---------------


----------
-- Crafts 
----------

minetest.register_craft({
	output = 'sas_core:box',
	recipe = {
    {'default:wood','','default:wood'},
    {'','',''},
		{'default:wood','','default:wood'},
	}
})

minetest.register_craft({
	output = 'sas_core:chain 9',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"}},
	recipe = {
    {'','sas_core:redhot_steel_bar',''},
    {'','sas_core:redhot_steel_bar',''},
    {'sas_core:tool_gravel_sieve_hammer','sas_core:redhot_steel_bar','sas_core:tool_anvil'},
	}
})

minetest.register_craft({
	output = 'sas_core:iron_bars',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"}},
	recipe = {
	{'','',''},
    {'sas_core:steel_bar','sas_core:steel_bar','sas_core:steel_bar'},
	{'sas_core:tool_gravel_sieve_hammer','','sas_core:tool_anvil'},
	}
})

minetest.register_craft({
	output = 'sas_core:iron_grille 3',
	recipe = {
    {'','sas_core:iron_bars',''},
    {'sas_core:iron_bars','sas_core:iron_hardware','sas_core:iron_bars'},
    {'','sas_core:iron_bars',''},
	}
})

--maybe OP unlimited fuel
--[[
minetest.register_craft({
	output = 'sas_core:lamp',
	recipe = {
    {'sas_core:stick','','sas_core:stick'},
    {'','sas_core:torch',''},
    {'sas_core:stick','','sas_core:stick'},
	}
})
]]
minetest.register_craft({
	output = 'sas_core:wood_bars 2',
	recipe = {
    {'default:stick','','default:stick'},
    {'default:stick','','default:stick'},
    {'default:stick','','default:stick'},
	}
})

minetest.register_craft({
	output = 'sas_core:wood_grille 3',
	recipe = {
    {'','sas_core:wood_bars',''},
    {'sas_core:wood_bars','','sas_core:wood_bars'},
    {'','sas_core:wood_bars',''},
	}
})

minetest.register_craft({
	output = 'sas_core:wood_shelves',
	recipe = {
    {'sas_core:box'},
    {'sas_core:box'},
	}
})

minetest.register_craft({
	output = 'sas_core:wood_frame',
	recipe = {
    {'default:stick','','default:stick'},
    {'','default:glass',''},
    {'default:stick','','default:stick'},
	}
})


-- Cookings
minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "sas_core:wood_frame",
})


