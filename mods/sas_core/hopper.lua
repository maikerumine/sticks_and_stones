
minetest.register_alias("hopper:sorter", "sas_core:sorter")
minetest.register_alias("hopper:hopper_item", "sas_core:hopper_item")
minetest.register_alias("hopper:hopper", "sas_core:hopper")
minetest.register_alias("hopper:hopper_side", "sas_core:hopper_side")

minetest.register_alias("default:sorter", "sas_core:sorter")
minetest.register_alias("default:hopper_item", "sas_core:hopper_item")
minetest.register_alias("default:hopper", "sas_core:hopper")
minetest.register_alias("default:hopper_side", "sas_core:hopper_side")


local hopper_formspec =
	"size[8,6]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"label[0,0;Item Hopper]"..
	"list[current_name;main;1.5,0.3;5,1;]"..
	"list[current_player;main;0,1.85;8,1;]"..
	"list[current_player;main;0,3.08;8,3;8]"..
	"listring[current_name;main]" ..
	"listring[current_player;main]"
	default.get_hotbar_bg(0, 4.85)

local hopper_input = {}
hopper_input["default:chest"] = "main"
hopper_input["sas_core:box"] = "main"
hopper_input["sas_core:wood_shelves"] = "main"
hopper_input["sas_core:sorter"] = "main"
hopper_input["sas_core:hopper"] = "main"
hopper_input["sas_core:furnace"] = "dst"
hopper_input["sas_core:furnace_active"] = "dst"
hopper_input["sas_core:bloomery"] = "dst"
hopper_input["sas_core:bloomery_active"] = "dst"
hopper_input["sas_core:auto_sieve"] = "dst"
hopper_input["sas_core:auto_sieve0"] = "dst"
hopper_input["sas_core:auto_sieve1"] = "dst"
hopper_input["sas_core:auto_sieve2"] = "dst"
hopper_input["sas_core:auto_sieve3"] = "dst"

local hopper_output = {}
hopper_output["default:chest"] = {"main", "main"}
hopper_output["sas_core:box"] = {"main", "main"}
hopper_output["sas_core:wood_shelves"] = {"main", "main"}
hopper_output["sas_core:furnace"] = {"src", "fuel"}
hopper_output["sas_core:furnace_active"] = {"src", "fuel"}
hopper_output["sas_core:bloomery"] = {"src", "fuel"}
hopper_output["sas_core:bloomery_active"] = {"src", "fuel"}
hopper_output["sas_core:auto_sieve"] = {"src", "fuel"}
hopper_output["sas_core:auto_sieve0"] = {"src", "fuel"}
hopper_output["sas_core:auto_sieve1"] = {"src", "fuel"}
hopper_output["sas_core:auto_sieve2"] = {"src", "fuel"}
hopper_output["sas_core:auto_sieve3"] = {"src", "fuel"}

local sorter_output_pos = {}
sorter_output_pos[0] = {x = 1, y = 0, z = 0}
sorter_output_pos[1] = {x = 0, y = 0, z = -1}
sorter_output_pos[2] = {x = -1, y = 0, z = 0}
sorter_output_pos[3] = {x = 0, y = 0, z = 1}

local function suck_items(pos)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	local objects_near = minetest.get_objects_inside_radius(
			{x = pos.x, y = pos.y + 1, z = pos.z}, 1
	)
	for _,object in ipairs(objects_near) do
		if not object:is_player()
				and object:get_luaentity()
				and object:get_luaentity().name == "__builtin:item" then
			if inv and inv:room_for_item("main", ItemStack(
					object:get_luaentity().itemstring)) then
				local posob = object:getpos()
				if math.abs(posob.x - pos.x) <= 0.5
						and (posob.y - pos.y <= 1.85
						and posob.y - pos.y >= 0.3) then
					inv:add_item("main", ItemStack(
							object:get_luaentity().itemstring))
					object:get_luaentity().itemstring = ""
					object:remove()
				end
			end
		end
	end
end

local function pull_items(pos, b)
	local ninvname
	--the hopper input
	if hopper_input[b] then
		ninvname = hopper_input[b]
		--hopper inventory
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		local invsize = inv:get_size("main")

		--chest/hopper/furnace inventory
		local meta2 = minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z});
		local inv2 = meta2:get_inventory()
		local invsize2 = inv2:get_size(ninvname)
		if inv2:is_empty(ninvname) == false then
			for i = 1,invsize2 do
				local stack = inv2:get_stack(ninvname, i)
				local item = stack:get_name()
				if item ~= "" then
					if inv:room_for_item("main", item) == false then
						return
					end
					stack:take_item(1)
					inv2:set_stack(ninvname, i, stack)
					inv:add_item("main", item)
					break
				end
			end
		end
	end
end

local function push_items(pos, opos, a)
	local ninvname
	if hopper_output[a] then
		if pos.y - opos.y == 0 then
			ninvname = hopper_output[a][2]
		else
			ninvname = hopper_output[a][1]
		end
		--hopper inventory
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if inv:is_empty("main") == true then
			return
		end
		local invsize = inv:get_size("main")

		--chest/hopper/furnace inventory
		local meta2 = minetest.get_meta(opos);
		local inv2 = meta2:get_inventory()
		local invsize2 = inv2:get_size(ninvname)
		for i = 1,invsize do
			local stack = inv:get_stack("main", i)
			local item = stack:get_name()
			if item ~= "" then
				if a == "sas_core:furnace" or a == "sas_core:furnace_active" then
					if not minetest.get_node_timer(opos):is_started() then
						minetest.get_node_timer(opos):start(1.0)
					end
				end
				if inv2:room_for_item(ninvname, item) == false then
					return
				end
				stack:take_item(1)
				inv:set_stack("main", i, stack)
				inv2:add_item(ninvname, item)
				break
			end
		end
	end
end

minetest.register_node("sas_core:hopper", {
	description = "Hopper",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	drop = "sas_core:hopper_item",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {"hopper_top.png", "hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png"},
	selection_box = {type="regular"},
	node_box = {
			type = "fixed",
			fixed = {
				--funnel walls
				{-0.5, 0.0, 0.4, 0.5, 0.5, 0.5},
				{0.4, 0.0, -0.5, 0.5, 0.5, 0.5},
				{-0.5, 0.0, -0.5, -0.4, 0.5, 0.5},
				{-0.5, 0.0, -0.5, 0.5, 0.5, -0.4},
				--funnel base
				{-0.5, 0.0, -0.5, 0.5, 0.1, 0.5},
				--spout
				{-0.3, -0.3, -0.3, 0.3, 0.0, 0.3},
				{-0.15, -0.3, -0.15, 0.15, -0.5, 0.15},
			},
		},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", hopper_formspec)
		meta:set_string("infotext", "Hopper")
		local inv = meta:get_inventory()
		inv:set_size("main", 5)
		minetest.get_node_timer(pos):start(0.5)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(
				{x = pos.x, y = pos.y + 1, z = pos.z}).name
		if hopper_input[node] then
			pull_items(pos, node)
		else
			suck_items(pos)
		end
		node = minetest.get_node(
				{x = pos.x, y = pos.y - 1, z = pos.z}).name
		push_items(pos, {x = pos.x, y = pos.y - 1, z = pos.z}, node)
		return true
	end,
})

minetest.register_node("sas_core:hopper_side", {
	description = "Hopper",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	drop = "sas_core:hopper_item",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"hopper_top.png", "hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png"},
	selection_box = {type="regular"},
	node_box = {
			type = "fixed",
			fixed = {
			--funnel walls
			{-0.5, 0.0, 0.4, 0.5, 0.5, 0.5},
			{0.4, 0.0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, 0.0, -0.5, -0.4, 0.5, 0.5},
			{-0.5, 0.0, -0.5, 0.5, 0.5, -0.4},
			--funnel base
			{-0.5, 0.0, -0.5, 0.5, 0.1, 0.5},
			--spout
			{-0.3, -0.3, -0.3, 0.3, 0.0, 0.3},
			{-0.7, -0.3, -0.15, 0.15, 0.0, 0.15},
			},
		},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", hopper_formspec)
		meta:set_string("infotext", "Hopper")
		local inv = meta:get_inventory()
		inv:set_size("main", 5)
		minetest.get_node_timer(pos):start(0.5)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(
				{x = pos.x, y = pos.y + 1, z = pos.z}).name
		if hopper_input[node] then
			pull_items(pos, node)
		else
			suck_items(pos)
		end
		node = minetest.get_node(pos)
		local face = node.param2
		local front = {}
		if face == 0 then
			front = {x = pos.x - 1, y = pos.y, z = pos.z}
		elseif face == 1 then
			front = {x = pos.x, y = pos.y, z = pos.z + 1}
		elseif face == 2 then
			front = {x = pos.x + 1, y = pos.y , z =pos.z}
		elseif face == 3 then
			front = {x = pos.x, y = pos.y, z = pos.z-1}
		end
		node = minetest.get_node(front).name
		push_items(pos, front, node)
		return true
	end,
})

local sorter_formspec =
	"size[8,7]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;filter;0,0.3;8,1;]"..
	"list[current_name;main;4.5,1.55;3,1;]"..
	"list[current_name;out;0.5,1.55;3,1;]"..
	"list[current_player;main;0,2.85;8,1;]"..
	"list[current_player;main;0,4.08;8,3;8]"..
	"listring[current_name;main]" ..
	"listring[current_player;main]" ..
	"listring[current_name;out]" ..
	"listring[current_player;main]"
	default.get_hotbar_bg(0,4.85)

minetest.register_node("sas_core:sorter", {
	description = "Sorter",
	groups = {cracky = 1, level = 2},
	inventory_image = "sorter_item.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"hopper_top.png", "hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png",
			"hopper_outside.png^sorter_direction.png^[transformFX",
			"hopper_outside.png^sorter_direction.png"},
	selection_box = {type="regular"},
	node_box = {
			type = "fixed",
			fixed = {
			{-0.3, 0.0, -0.4, 0.3, 0.5, 0.4},
			{-0.3, -0.3, -0.3, 0.3, 0.0, 0.3},
			{-0.15, -0.3, -0.15, 0.15, -0.5, 0.15},
			{0.5, -0.3, 0.15, -0.15, 0.0, -0.15},
			{-0.5, -0.3, -0.15, 0.15, 0.0, 0.15},
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", sorter_formspec)
		meta:set_string("infotext", "Sorter")
		local inv = meta:get_inventory()
		inv:set_size("out", 3)
		inv:set_size("main", 3)
		inv:set_size("filter", 8)
		minetest.get_node_timer(pos):start(0.5)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and inv:is_empty("out") and inv:is_empty("filter")
	end,
	on_timer = function(pos, elapsed)
		local param2 = minetest.get_node(pos).param2
		local ninvname = ""
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local invsize = inv:get_size("main")
		local npos = vector.add(pos, sorter_output_pos[param2])

		if minetest.get_node(npos).name == "sas_core:sorter" then
			ninvname = "out"
		elseif minetest.get_node(npos).name == "sas_core:hopper_side" then
			ninvname = "main"
		elseif minetest.get_node(
				{x = pos.x, y = pos.y + 1, z = pos.z}).name == "sas_core:hopper" then
			npos = {x = pos.x, y = pos.y + 1, z = pos.z}
			ninvname = "main"
		else
			return true
		end

		local meta2 = minetest.get_meta(npos);
		local inv2 = meta2:get_inventory()
		local invsize2 = inv2:get_size(ninvname)
		if inv2:is_empty(ninvname) == false then
			for i = 1,invsize2 do
				local stack = inv2:get_stack(ninvname, i)
				local item = stack:get_name()
				if item ~= "" then
					if inv:contains_item("filter", item) or inv:is_empty("filter") then
						if inv:room_for_item("main", item) == false then
							if inv:room_for_item("out", item) == false then
								return true
							end
							stack:take_item(1)
							inv2:set_stack(ninvname, i, stack)
							inv:add_item("out", item)
							return true
						end
						stack:take_item(1)
						inv2:set_stack(ninvname, i, stack)
						inv:add_item("main", item)
					else
						if inv:room_for_item("out", item) == false then
							return true
						end
						stack:take_item(1)
						inv2:set_stack(ninvname, i, stack)
						inv:add_item("out", item)
					end
					break
				end
			end
		end
		return true
	end,
})

minetest.register_craftitem("sas_core:hopper_item", {
	description = "Hopper",
	inventory_image = "hopper_item.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos  = pointed_thing.under
		local pos2 = pointed_thing.above
		local x = pos.x - pos2.x
		local y = pos.y - pos2.y
		local z = pos.z - pos2.z
		local placed = false
		if x == -1 then
			minetest.set_node(pos2, {name = "sas_core:hopper_side", param2 = 0})
			placed = true
		elseif x == 1 then
			minetest.set_node(pos2, {name = "sas_core:hopper_side", param2 = 2})
			placed = true
		elseif z == -1 then
			minetest.set_node(pos2, {name = "sas_core:hopper_side", param2 = 3})
			placed = true
		elseif z == 1 then
			minetest.set_node(pos2, {name = "sas_core:hopper_side", param2 = 1})
			placed = true
		else
			minetest.set_node(pos2, {name = "sas_core:hopper"})
			placed = true
		end
		if placed == true then
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
})

minetest.register_craft({
	output = "sas_core:hopper_item",
	recipe = {
		{"sas_core:steel_plate","default:chest","sas_core:steel_plate"},
		{"sas_core:steel_plate","sas_core:steel_spring_heavy","sas_core:steel_plate"},
		{"sas_core:iron_hardware","sas_core:iron_bars","sas_core:iron_hardware"},
	}
})

minetest.register_craft({
	output = "sas_core:sorter",
	recipe = {
		{"sas_core:steel_plate","sas_core:iron_hinge","sas_core:steel_plate"},
		{"sas_core:iron_hardware","default:chest","sas_core:iron_hardware"},
		{"sas_core:steel_plate","sas_core:steel_spring_heavy","sas_core:steel_plate"},
	}
})

--
-- LBM
--

minetest.register_lbm({
	label = "Start Hopper Node Timer",
	name = "sas_core:start_timer",
	nodenames = {"sas_core:sorter", "sas_core:hopper", "sas_core:hopper_side"},
	run_at_every_load = true,
	action = function(pos, node)
		minetest.get_node_timer(pos):start(0.5)
	end,
})



--[[

# Hoppers
This is the Hoppers mod for Minetest. It's just a clone of Minecraft hoppers, functions nearly identical to them minus mesecons making them stop and the way they're placed.

## Forum Topic
- https://forum.minetest.net/viewtopic.php?f=11&t=12379

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.



]]
