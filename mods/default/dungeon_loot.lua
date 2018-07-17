-- "Dungeon Loot" [default]
-- Copyright (c) 2015 BlockMen <blockmen2015@gmail.com>
--
-- init.lua
--
-- This software is provided 'as-is', without any express or implied warranty. In no
-- event will the authors be held liable for any damages arising from the use of
-- this software.
--
-- Permission is granted to anyone to use this software for any purpose, including
-- commercial applications, and to alter it and redistribute it freely, subject to the
-- following restrictions:
--
-- 1. The origin of this software must not be misrepresented; you must not
-- claim that you wrote the original software. If you use this software in a
-- product, an acknowledgment in the product documentation is required.
-- 2. Altered source versions must be plainly marked as such, and must not
-- be misrepresented as being the original software.
-- 3. This notice may not be removed or altered from any source distribution.
--
-- "Dungeon Loot" [default]
-- Original by BlockMen, this entire file by Amoeba
--
-- config.lua
--
-- Note: All positive heights (above water level) are treated as depth 0.
-- Also, no comma after the item of a list.

-- Minimum number of rooms a dungeon should have for a chest to be generated
default.min_num_of_rooms = 4
-- Items on basic lists have three depth ranges for their listed amount 
-- maximums; they get max/2 before first increase point (minimum of 1 if 
-- amount is >0), the given max between the 1st and 2nd increase point, 
-- and max*2 after the 2nd.
default.depth_first_basic_increase = 200
default.depth_second_basic_increase = 2000

-- The master list of loot types
-- Note that tools and weapons should always have max_amount = 1.
-- Chance is a probability between 0 (practically never) and 1 (always),
-- so change a chance to 0 if you don't want a type (eg. weapons) included 
-- in your game (or -0.001 if you want to be REALLY sure). 
default.loot_types = { 
	{name="treasure", max_amount = 10, chance = 0.7, type = "depth_cutoff"},
	{name="tools", max_amount = 1, chance = 0.5, type = "depth_cutoff"},
	{name="weapons", max_amount = 1, chance = 0.1, type = "depth_cutoff"},
	{name="consumables", max_amount = 80, chance = 0.9, type = "basic_list"},
	{name="seedlings", max_amount = 5, chance = 0.3, type = "basic_list"}
}

-- Loot type lists; these names MUST be exactly of the format:
-- "default.name_list" where "name" is in the above list

-- Depth cutoff lists
-- These must be in order of increasing depth (but can include the same item
-- more than once).  Method: a random number between 1 and chest depth is 
-- chosen, and the item in that range is added to the loot.  Then, there's 
-- a chance additional items of the same type are added to stack; if the 
-- random number is much greater than the item's min_depth, the amount 
-- can grow pretty big.
default.treasure_list = {
	{name="default:steel_ingot", min_depth = 0},
	{name="tnt:tnt", min_depth = 20},
	{name="default:tool_sword_stone", min_depth = 45},
	{name="default:chain", min_depth = 50},
	{name="default:iron_bars", min_depth = 150},
	{name="farming:green_bean_seed", min_depth = 250},
	{name="farming:corn_base_seed", min_depth = 350},
	{name="farming:tomato_seed", min_depth = 450},
	{name="farming:potato_eyes", min_depth = 550},
	{name="farming:melon_seed", min_depth = 650},

	{name="default:iron_bloom", min_depth = 777},
	{name="default:steelblock", min_depth = 800},
	{name="default:steelblock", min_depth = 1800},
	{name="default:steelblock", min_depth = 2000}
}

default.tools_list = {
	{name="default:tool_pick_steel", min_depth = 0},
	{name="default:handle_medium", min_depth = 38},
	{name="default:tool_pick_iron", min_depth = 40},
	{name="default:tool_axe_hardened_steel", min_depth = 95},
	{name="default:tool_pick_hardened_steel", min_depth = 100}
}

default.weapons_list = {
	{name="default:tool_sword_steel", min_depth = 0},
	{name="default:sieve0", min_depth = 50},
	{name="default:chain", min_depth = 150},
	{name="default:tool_sword_hardened_steel", min_depth = 250}
}


-- Basic lists
-- These can be of two types, either with combined chance and amount, 
-- or with the two variables separated.  "chance" means each item has a 
-- N/M chance of being chosen, where N is it's own chance and M is the 
-- total sum of chances on the list.  "amount" is the maximum amount of
-- items given at the middle depth range.
default.consumables_list = {
	{name="default:apple", chance_and_amount = 20},
	{name="default:torch", chance_and_amount = 30},
	{name="default:stick", chance_and_amount = 10}
}

default.seedlings_list = {
	{name="default:sapling", chance = 5, amount = 2},
	{name="default:pine_sapling", chance = 10, amount = 2},
	{name="default:junglesapling", chance = 15, amount = 2},
	{name="default:acacia_sapling", chance = 15, amount = 2}
}

-- Add items from other mods here inside the appropriate 
-- "if ... then ... end" test
-- For basic lists, just using insert without a value works fine.
-- For depth cutoff lists, you can use insert with a table index, eg.
--   table.insert(default.treasure_list, 5, {name="your_mod:platinum_ingot", min_depth = 120}
-- The above would add a new item to the treasure list as the 5th item,
-- moving diamond and all below it one down in the list.  Just make sure 
-- that the increasing min_depth order is kept.  
-- Tips: With multiple insertions in a depth cutoff list, start from the 
-- last item and work towards the beginning, then you don't have to calculate
-- your number of additions.  Also, trying to make sure too many different 
-- mods work together in a single list will probably give you a headache;
-- just create a new list (or two) for mods with lots of additions. 

if minetest.get_modpath("farming") then
 	table.insert(default.consumables_list, {name="farming:bread", chance_and_amount = 10})
 	table.insert(default.seedlings_list, {name="farming:seed_wheat", chance = 1, amount = 10})
 	--table.insert(default.seedlings_list, {name="farming:seed_cotton", chance = 20, amount = 5})
end





-- Following Code (everything before fill_chest) by Amoeba <amoeba@iki.fi>
--default = {}
default.version = 1.2

-- Load other file(s)
local modpath = minetest.get_modpath(minetest.get_current_modname())
--dofile(modpath.."/config.lua") 		-- All the constants for simple tuning


local function get_max_loot(loot_list, depth)
	local loot_type = loot_list[1].name
	local loot_min_depth = loot_list[1].min_depth
	for i,v in ipairs(loot_list) do
		if v.min_depth < depth then
			loot_type = v.name
			loot_min_depth = v.min_depth
		else
			break
		end
	end
	return loot_type, loot_min_depth
end

local function get_basic_loot(loot_list, depth)
	local loot_type = ""
	local loot_amount = 0
	local total_chance = 0
	for i,v in ipairs(loot_list) do
		if v.chance_and_amount then
			total_chance = total_chance + v.chance_and_amount
		elseif v.chance then
			total_chance = total_chance + v.chance
		else
			error("No chance_and_amount or chance found in basic_list table.")
			return nil, 0
		end
	end
	local leftover = math.random(1,total_chance)
	local type_amount = 0
	for i,v in ipairs(loot_list) do
		if v.chance_and_amount then
			leftover = leftover - v.chance_and_amount
		elseif v.chance then
			leftover = leftover - v.chance
		end
		if leftover < 1 then
			loot_type = v.name
			if v.chance_and_amount then
				type_amount = v.chance_and_amount
			else
				type_amount = v.amount
			end
			break
		end
	end
	if loot_type == "" then 	-- Paranoia
		error("Unable to choose a loot_type from basic_list table.")
		return nil, 0
	end
	loot_amount = math.random(1,math.ceil(type_amount/2))
	if depth > default.depth_first_basic_increase then
		loot_amount = math.random(1,type_amount)
	end
	if depth > default.depth_second_basic_increase then
		loot_amount = math.random(1,type_amount*2)
	end
	return loot_type, loot_amount
end

local function get_item_and_amount(list_item, actual_depth)
	if list_item.chance < math.random() then
		return nil, 0
	end
	-- Suspicious trickery
	list_name = nil
	list_name_string = "default." .. list_item.name .. "_list"
-- 	list_name = _G[list_name_string]
	lsf = loadstring("list_name = " .. list_name_string)
	lsf()
	if list_name == nil then
		error("Unable to connect " .. list_name_string .. " to actual table")
		return nil, 0
	end
	local amount = 0
	local loot_type = ""
	local loot_depth = 0
	local max_depth = 1
	if actual_depth < 0 then
		max_depth = math.ceil(math.abs(actual_depth))
	end
	if list_item.type == "depth_cutoff" then
		local rnd_depth = math.random(1,max_depth)
 		loot_type, loot_depth = get_max_loot(list_name, rnd_depth)
		if list_item.max_amount == 1 then 	-- For tools & weapons
			amount = 1
		else
			-- Stop large amounts of the first item
			if loot_depth < 1 then
				loot_depth = 5
			end
			local leftover = rnd_depth
			while leftover > 0 do
				amount = amount + 1
				leftover = leftover - math.random(1,loot_depth)
				leftover = leftover - math.ceil(loot_depth/2)
			end
		end
	elseif list_item.type == "basic_list" then
		loot_type, amount = get_basic_loot(list_name, max_depth)
	else
		error("Got unknown loot table type " .. list_item.type)
		loot_type = nil
	end
	-- Hey, if you leave out the max_amount, you deserve what you get
	if list_item.max_amount and amount > list_item.max_amount then
		amount = list_item.max_amount
	end
	return loot_type, amount
end

local function fill_chest(pos)
	minetest.after(2, function()
		local n = minetest.get_node(pos)
		if n and n.name and n.name == "default:chest" then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
			for i,v in ipairs(default.loot_types) do
				local item, num = get_item_and_amount(v,pos.y)
				if item then
					local stack = ItemStack({name = item, count = num, wear = 0, metadata = ""})
					inv:set_stack("main",i,stack)
				end
			end
		end
	end)
end

-- Place chest in dungeons

local function place_spawner(tab)
	if tab == nil or #tab < 1 then
		return
	end
	local pos = tab[math.random(1, #tab)]
	pos.y = pos.y - 1
	local below = core.get_node_or_nil(pos)
	if below and below.name ~= "air" then
		pos.y = pos.y + 1
		core.set_node(pos, {name = "default:chest"})
		fill_chest(pos)
	end
end

core.set_gen_notify("dungeon")
core.register_on_generated(function(minp, maxp, blockseed)
	local ntf = core.get_mapgen_object("gennotify")
	if ntf and ntf.dungeon and #ntf.dungeon >= default.min_num_of_rooms then
		core.after(3, place_spawner, table.copy(ntf.dungeon))
	end
end)






--[[

Mod "Dungeon Loot" [default]
=================================
Copyright (c) 2015 BlockMen <blockmen2015@gmail.com>
and Amoeba <amoeba@iki.fi>

Version: 1.1 alpha


A simple mod that add to dungeons chests that contain some loot.
Configurable in many aspects, see "config.lua" for more details.


License:
~~~~~~~~
Code:
(c) Copyright 2015 BlockMen; modified zlib-License
see "LICENSE.txt" for details.

Media(if not stated differently):
(c) Copyright (2014-2015) BlockMen; CC-BY-SA 3.0


Github:
~~~~~~~
https://github.com/BlockMen/default


Forum:
~~~~~~
https://forum.minetest.net/viewtopic.php?id=13487


Changelog:
~~~~~~~~~~
-




Copyright (c) 2015 BlockMen <blockmen2015@gmail.com>


This software is provided 'as-is', without any express or implied warranty. In no
event will the authors be held liable for any damages arising from the use of
this software.

Permission is granted to anyone to use this software for any purpose, including
commercial applications, and to alter it and redistribute it freely, subject to the
following restrictions:


1. The origin of this software must not be misrepresented; you must not
claim that you wrote the original software. If you use this software in a
product, an acknowledgment in the product documentation is required.

2. Altered source versions must be plainly marked as such, and must not
be misrepresented as being the original software.

3. This notice may not be removed or altered from any source distribution.
]]