-- A couple variables used throughout.
percent = 100
-- GUI related stuff
default.gui_bg = 'bgcolor[#080808BB;true]'
default.gui_bg_img = 'background[5,5;1,1;gui_formbg.png;true]'
default.gui_slots = 'listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]'

--more_fire = {}

--[[
dofile(minetest.get_modpath('fire')..'/config.txt')
dofile(minetest.get_modpath('fire')..'/functions.lua')
dofile(minetest.get_modpath('fire')..'/abms.lua')
dofile(minetest.get_modpath('fire')..'/nodes.lua')
dofile(minetest.get_modpath('fire')..'/craftitems.lua')
dofile(minetest.get_modpath('fire')..'/crafts.lua')
dofile(minetest.get_modpath('fire')..'/tools.lua')
if pyromania then
	dofile(minetest.get_modpath('fire')..'/molotov.lua')
	dofile(minetest.get_modpath('fire')..'/smokebomb.lua')
end
]]


minetest.register_node('fire:oil_lamp_on', {
	description = 'oil lamp wall',
	drawtype = 'mesh',
	mesh = 'more_fire_lamp_wall.obj',
	tiles = {'more_fire_lamp.png'},
	groups = {choppy=2, dig_immediate=2, not_in_creative_inventory=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	walkable = false,
	light_source = LIGHT_MAX,
	drop = 'fire:oil_lamp_off',
	selection_box = {
		type = 'fixed',
		fixed = {-.2, -.4, -0.1, 0.2, .35, .5},
		},
	on_timer = function(pos, itemstack)
		local node = minetest.get_node(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('fuel', 'fire:oil') then
			local fuelstack = inv:get_stack('fuel', 1)
			timer:start(12*60)
			fuelstack:take_item()
			inv:set_stack('fuel', 1, fuelstack)
			if inv:is_empty('fuel') then
				minetest.set_node(pos, {name = 'fire:oil_lamp_off', param2=node.param2})
				end
				timer:stop()
		elseif inv:is_empty('fuel') then
			minetest.set_node(pos, {name = 'fire:oil_lamp_off', param2=node.param2})
			timer:stop()
		end
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('fuel')
	end,
})

minetest.register_node('fire:oil_lamp_off', {
	description = 'oil lamp off',
	drawtype = 'mesh',
	mesh = 'more_fire_lamp_wall.obj',
	tiles = {'more_fire_lamp.png'},
	groups = {choppy=2, dig_immediate=2,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	walkable = false,
	inventory_image = 'more_fire_lamp_inv.png',
	wield_image = 'more_fire_lamp_inv.png',
	light_source = 1,
	selection_box = {
		type = 'fixed',
		fixed = {-.2, -.4, -0.1, 0.2, .35, .5},
		},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('fuel', 1)
		meta:set_string('formspec',
			'size[8,6]'..
			'label[2,.75;Add lantern oil for a bright flame.]' ..
            'list[current_name;fuel;1,.5;1,1]'..
            'list[current_player;main;0,2;8,4;]')
		meta:set_string('infotext', 'Oil Lantern')
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		local node = minetest.get_node(pos)
		if inv:contains_item('fuel', 'fire:oil') then
			minetest.swap_node(pos, {name = 'fire:oil_lamp_on', param2=node.param2})
			timer:start(12*60) --one oil unit will burn for 12 minutes
			meta:set_string('infotext', 'Burning Oil Lamp')
			meta:set_string('formspec',
			'size[8,6]'..
			'label[2,.75;keep filled with lantern oil for a bright flame.]' ..
            'list[current_name;fuel;1,.5;1,1]'..
            'list[current_player;main;0,2;8,4;]')
		end
	end,
	can_dig = function(pos, player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			if not inv:is_empty('fuel') then
				return false
			end
			return true
		end,
})

minetest.register_node('fire:oil_lamp_table_on', {
	description = 'oil lamp table',
	drawtype = 'mesh',
	mesh = 'more_fire_lamp_table.obj',
	tiles = {'more_fire_lamp.png'},
	groups = {choppy=2, dig_immediate=2, not_in_creative_inventory=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	walkable = false,
	light_source = LIGHT_MAX,
	drop = 'fire:oil_lamp_off',
	selection_box = {
		type = 'fixed',
		fixed = {-.2, -.5, -0.2, 0.2, .25, .2},
		},
	on_timer = function(pos, itemstack)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('fuel', 'fire:oil') then
			local fuelstack = inv:get_stack('fuel', 1)
			timer:start(12*60)
			fuelstack:take_item()
			inv:set_stack('fuel', 1, fuelstack)
			if inv:is_empty('fuel') then
				minetest.set_node(pos, {name = 'fire:oil_lamp_table_off'})
				end
				timer:stop()
		elseif inv:is_empty('fuel') then
			minetest.set_node(pos, {name = 'fire:oil_lamp_table_off'})
			timer:stop()
		end
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('fuel')
	end,
})

minetest.register_node('fire:oil_lamp_table_off', {
	description = 'oil lamp',
	drawtype = 'mesh',
	mesh = 'more_fire_lamp_table.obj',
	tiles = {'more_fire_lamp.png'},
	groups = {choppy=2, dig_immediate=2,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	walkable = false,
	inventory_image = 'more_fire_lamp_table_inv.png',
	wield_image = 'more_fire_lamp_table_inv.png',
	light_source = 1,
	selection_box = {
		type = 'fixed',
		fixed = {-.2, -.5, -0.2, 0.2, .25, .2},
		},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('fuel', 1)
		meta:set_string('formspec',
			'size[8,6]'..
			'label[2,.75;Add lantern oil for a bright flame.]' ..
            'list[current_name;fuel;1,.5;1,1]'..
            'list[current_player;main;0,2;8,4;]')
		meta:set_string('infotext', 'Oil Lantern')
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('fuel', 'fire:oil') then
			minetest.swap_node(pos, {name = 'fire:oil_lamp_table_on'})
			timer:start(12*60) --one oil unit will burn for 12 minutes
			meta:set_string('infotext', 'Burning Oil Lamp')
			meta:set_string('formspec',
			'size[8,6]'..
			'label[2,.75;keep filled with lantern oil for a bright flame.]' ..
            'list[current_name;fuel;1,.5;1,1]'..
            'list[current_player;main;0,2;8,4;]')
		end
	end,
	can_dig = function(pos, player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			if not inv:is_empty('fuel') then
				return false
			end
			return true
		end,
})




minetest.register_craft({
		output = 'fire:oil_lamp_off 1',
		recipe = {
		{'default:glass'},
		{'sas_core:cord'},
		{'sas_core:steel_plate'},
		}
})

minetest.register_craft({
		output = 'fire:oil 1',
		recipe = {
		{'group:wax', 'group:wax', 'group:wax'},
		{'group:wax', 'group:wax', 'group:wax'},
		{'', 'vessels:glass_bottle', ''},
		}
})

minetest.register_craft({
	output = 'fire:oil_lamp_off 1',
	recipe = {
		{'fire:oil_lamp_table_off'}
	}
})

minetest.register_craft({
	output = 'fire:oil_lamp_table_off 1',
	recipe = {
		{'fire:oil_lamp_off'}
	}
})


minetest.register_craftitem('fire:oil', {
	description = 'lantern oil',
	inventory_image = 'more_fire_oil.png',
})
