--[[

	Gravel Sieve Mod
	================

	v1.04 by JoSt
	Derived from the work of celeron55, Perttu Ahola  (furnace)

	Copyright (C) 2017 Joachim Stolberg
	Copyright (C) 2011-2016 celeron55, Perttu Ahola <celeron55@gmail.com>
	Copyright (C) 2011-2016 Various Minetest developers and contributors

	LGPLv2.1+
	See LICENSE.txt for more information

	History:
	2017-06-14  v0.01  First version
	2017-06-15  v0.02  Manually use of the sieve added
	2017-06-17  v0.03  * Settings bug fixed
					   * Drop bug fixed
					   * Compressed Gravel block added (Inspired by Modern Hippie)
					   * Recipes for Compressed Gravel added
	2017-06-17  v0.04  * Support for manual and automatic gravel sieve
					   * Rarity now configurable
					   * Output is 50% gravel and 50% sieved gravel
	2017-06-20  v0.05  * Hammer sound bugfix
	2017-06-24 	v1.00  * Released version w/o any changes
	2017-07-08  V1.01  * extended for moreores
	2017-07-09  V1.02  * Cobblestone bugfix (NathanSalapat)
	                   * ore_probability is now global accessable (bell07)
	2017-08-29  V1.03  * Fix syntax listring (Jat15) 
	2017-09-08  V1.04  * Adaption to Tubelib
]]--

--default = {}

--dofile(minetest.get_modpath("gravelsieve") .. "/hammer.lua")
--default_ore_rarity = tonumber(minetest.setting_get("default_ore_rarity")) or 1
--local ore_rarity =  1
default.ore_rarity =  1


-- Ore probability table  (1/n)
--local ore_probability = {

default.ore_probability = {
	["default:coal_lump"] = 115,
	["default:copper_nugget"] = 30,
	["default:iron_lump"] = 55,
	["default:charcoal_chips"] = 75,
	["default:clay_lump"] = 95,
	--["default:copper_lump"] = 60,
	--["default:tin_lump"] = 80,
	--["default:gold_lump"] = 175,
	--["default:mese_crystal"] = 275,
	--["default:diamond"] = 340,
	--["moreores:silver_lump"] = 100,
	--["moreores:mithril_lump"] = 250,
}

-- remove not registered ores from list

for ore, probability in pairs(default.ore_probability) do
	if not minetest.registered_items[ore] then
		default.ore_probability[ore] = nil
	end
end

local sieve_formspec =
	"size[8,8]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[context;src;1,1;1,1;]"..
	"image[3,1;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[context;dst;4,0;4,3;]"..
	"list[current_player;main;0,4;8,4;]"..
	"listring[context;dst]"..
	"listring[current_player;main]"..
	"listring[context;src]"..
	"listring[current_player;main]"



local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

-- handle the sieve animation
local function swap_node(pos, meta, start)
	local node = minetest.get_node(pos)
	local idx = meta:get_int("idx")
	if start then
		if idx == 3 then
			idx = 0
		end
	else
		idx = (idx + 1) % 4
	end
	meta:set_int("idx", idx)
	node.name = meta:get_string("node_name")..idx
	minetest.swap_node(pos, node)
	return idx == 3
end
--[[
-- place ores to dst according to the calculated probability
local function random_ore(inv, src)
	local num
	for ore, probability in pairs(default.ore_probability) do
		-- calculate the probability based on user configuration
		probability = probability * default.ore_rarity
		if math.random(probability) == 1 then
			local item = ItemStack(ore)
			if inv:room_for_item("dst", item) then
				inv:add_item("dst", item)
				return true     -- ore placed
			end
		end
	end
	return false    -- gravel has to be moved
end
]]
-- place ores to dst according to the calculated probability
local function random_ore(inv, src)
	local num
	for ore, probability in pairs(default.ore_probability) do
		-- calculate the probability based on user configuration
		probability = probability * default.ore_rarity
		if math.random(probability) == 1 then
			local item = ItemStack(ore)
			if inv:room_for_item("dst", item) then
				inv:add_item("dst", item)
				return true     -- ore placed
			end
		end
	end
	return false    -- gravel has to be moved
end


local function add_gravel_to_dst(meta, inv)
	-- maintain a counter for gravel kind selection
	local gravel_cnt = meta:get_int("gravel_cnt") + 1
	meta:set_int("gravel_cnt", gravel_cnt)

	if (gravel_cnt % 2) == 0 then  -- gravel or sieved gravel?
		inv:add_item("dst", ItemStack("default:gravel"))        -- add to dest
	else
		inv:add_item("dst", ItemStack("default:sieved_gravel")) -- add to dest
	end
end


-- move gravel and ores to dst
local function move_src2dst(meta, pos, inv, src, dst)
	if inv:room_for_item("dst", dst) and inv:contains_item("src", src) then
		local res = swap_node(pos, meta, false)
		if res then                                     -- time to move one item?
			if src:get_name() == "default:gravel" then  -- will we find ore?
				if not random_ore(inv, src) then        -- no ore found?
					add_gravel_to_dst(meta, inv)
				end
			else
				inv:add_item("dst", ItemStack("default:sieved_gravel")) -- add to dest
			end
			inv:remove_item("src", src)
		end
		return true  -- process finished
	end
	return false -- process still running
end

-- timer callback, alternatively called by on_punch
local function sieve_node_timer(pos, elapsed)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local gravel = ItemStack("default:gravel")
	local gravel_sieved = ItemStack("default:sieved_gravel")

	if move_src2dst(meta, pos, inv, gravel) then
		return true
	elseif move_src2dst(meta, pos, inv, gravel_sieved) then
		return true
	else
		minetest.get_node_timer(pos):stop()
		return false
	end
end


for automatic = 0,1 do
for idx = 0,4 do
	local nodebox_data = {
		{ -8/16, -8/16, -8/16,   8/16, 4/16, -6/16 },
		{ -8/16, -8/16,  6/16,   8/16, 4/16,  8/16 },
		{ -8/16, -8/16, -8/16,  -6/16, 4/16,  8/16 },
		{  6/16, -8/16, -8/16,   8/16, 4/16,  8/16 },
		{ -6/16, -2/16, -6/16,  6/16, 8/16, 6/16 },
	}
	nodebox_data[5][5] =    (8 - 2*idx) / 16

	local node_name
	local description
	local tiles_data
	if automatic == 0 then
		node_name = "default:sieve"
		description = "Gravel Sieve"
		tiles_data = {
			-- up, down, right, left, back, front
			"gravelsieve_gravel.png",
			"gravelsieve_gravel.png",
			"gravelsieve_sieve.png",
			"gravelsieve_sieve.png",
			"gravelsieve_sieve.png",
			"gravelsieve_sieve.png",
		}
	else
		node_name = "default:auto_sieve"
		description = "Automatic Gravel Sieve"
		tiles_data = {
			-- up, down, right, left, back, front
			"gravelsieve_gravel.png",
			"gravelsieve_gravel.png",
			"gravelsieve_auto_sieve.png",
			"gravelsieve_auto_sieve.png",
			"gravelsieve_auto_sieve.png",
			"gravelsieve_auto_sieve.png",
		}
	end

	if idx == 3 then
		tiles_data[1] = "gravelsieve_top.png"
		not_in_creative_inventory = 0
	else
		not_in_creative_inventory = 1
	end


	minetest.register_node(node_name..idx, {
		description = description,
		tiles = tiles_data,
		drawtype = "nodebox",
        drop = node_name,
		node_box = {
			type = "fixed",
			fixed = nodebox_data,
		},
		selection_box = {
			type = "fixed",
			fixed = { -8/16, -8/16, -8/16,   8/16, 4/16, 8/16 },
		},

		on_timer = sieve_node_timer,

		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_int("idx", idx)        -- for the 4 sieve phases
			meta:set_int("gravel_cnt", 0)   -- counter to switch between gravel and sieved gravel
			meta:set_string("node_name", node_name)
			meta:set_string("formspec", sieve_formspec)
			local inv = meta:get_inventory()
			inv:set_size('src', 1)
			inv:set_size('dst', 12)
		end,

		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", "Gravel Sieve")
		end,
			
		on_metadata_inventory_move = function(pos)
			if automatic == 0 then
				local meta = minetest.get_meta(pos)
				swap_node(pos, meta, true)
			else
				minetest.get_node_timer(pos):start(1.0)
			end
		end,

		on_metadata_inventory_take = function(pos)
			if automatic == 0 then
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()
				if inv:is_empty("src") then
					-- sieve should be empty
					meta:set_int("idx", 2)
					swap_node(pos, meta, false)
					meta:set_int("gravel_cnt", 0)
				end
			else
				minetest.get_node_timer(pos):start(1.0)
			end
		end,

		on_metadata_inventory_put = function(pos)
			if automatic == 0 then
				local meta = minetest.get_meta(pos)
				swap_node(pos, meta, true)
			else
				minetest.get_node_timer(pos):start(1.0)
			end
		end,

		on_punch = function(pos, node, puncher, pointed_thing)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if inv:is_empty("dst") and inv:is_empty("src") then
				minetest.node_punch(pos, node, puncher, pointed_thing)
			else
				sieve_node_timer(pos, 0)
			end
		end,

		on_dig = function(pos, node, puncher, pointed_thing)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if inv:is_empty("dst") and inv:is_empty("src") then
				minetest.node_dig(pos, node, puncher, pointed_thing)
			end
		end,

		allow_metadata_inventory_put = allow_metadata_inventory_put,
		allow_metadata_inventory_move = allow_metadata_inventory_move,
		allow_metadata_inventory_take = allow_metadata_inventory_take,

		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {choppy=2, cracky=1, falling_node = 1, not_in_creative_inventory=not_in_creative_inventory},
		drop = node_name.."3",
	})
end
end

--[[
------------------------------------------------------------------------
-- Optional adaption to tubelib
------------------------------------------------------------------------
if tubelib then
	tubelib.register_node("default:auto_sieve3", 
		{
			"default:auto_sieve0",
			"default:auto_sieve1",
			"default:auto_sieve2",
		},
		{
		on_pull_item = function(pos)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			return tubelib.get_item(inv, "dst")
		end,
		on_push_item = function(pos, item)
			minetest.get_node_timer(pos):start(1.0)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			return tubelib.put_item(inv, "src", item)
		end,
		on_recv_message = function(pos, topic, payload)
			if topic == "start" then
				start_the_machine(pos)
			elseif topic == "stop" then
				stop_the_machine(pos)
			end
		end,
	})	
end
]]
minetest.register_node("default:sieved_gravel", {
	description = "Sieved Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly=2, falling_node=1, not_in_creative_inventory=1},
	sounds = default.node_sound_gravel_defaults(),
})

minetest.register_node("default:compressed_gravel", {
	description = "Compressed Gravel",
	tiles = {"gravelsieve_compressed_gravel.png"},
	groups = {crumbly = 2, cracky = 2, falling_node=1},
	sounds = default.node_sound_gravel_defaults(),
})


--[[

	Gravel Sieve Mod
	================

	v0.01 by JoSt
	Derived from the work of RealBadAngel, Maciej Kasatkin (screwdriver)

	Copyright (C) 2017 Joachim Stolberg
	Copyright (C) 2013-2016 RealBadAngel, Maciej Kasatkin
	Copyright (C) 2013-2016 Various Minetest developers and contributors

	LGPLv2.1+
	See LICENSE.txt for more information

]]--


default.disallow = function(pos, node, user, mode, new_param2)
	return false
end

default.handler = function(itemstack, user, pointed_thing)
	if pointed_thing.type ~= "node" then
		return
	end

	local pos = pointed_thing.under

	if minetest.is_protected(pos, user:get_player_name()) then
		minetest.record_protection_violation(pos, user:get_player_name())
		return
	end

	local node = minetest.get_node(pos)
	if node.name == "default:cobble" or node.name == "default:mossycobble" 
			or node.name == "default:desert_cobble" then
		node.name = "default:gravel"
		minetest.swap_node(pos, node)
		minetest.sound_play({
			name="default_dig_crumbly"},{
			gain=1,
			pos=pos,
			max_hear_distance=6,
			loop=false})
	end

	return itemstack
end
minetest.register_alias("gravelsieve:hammer", "default:tool_gravel_sieve_hammer")

minetest.register_alias("gravelsieve:auto_sieve0", "default:auto_sieve0")
minetest.register_alias("gravelsieve:auto_sieve1", "default:auto_sieve1")
minetest.register_alias("gravelsieve:auto_sieve2", "default:auto_sieve2")
minetest.register_alias("gravelsieve:auto_sieve3", "default:auto_sieve3")

minetest.register_alias("gravelsieve:sieve0", "default:sieve0")
minetest.register_alias("gravelsieve:sieve1", "default:sieve1")
minetest.register_alias("gravelsieve:sieve2", "default:sieve2")
minetest.register_alias("gravelsieve:sieve3", "default:sieve3")


minetest.register_tool("default:tool_gravel_sieve_hammer", {
	description = "Hammer converts Cobblestone into Gravel",
	inventory_image = "gravelsieve_hammer.png",
	on_use = function(itemstack, user, pointed_thing)
		default.handler(itemstack, user, pointed_thing)
		return itemstack
	end,
})
--[[
minetest.register_craft({
	output = "default:tool_gravel_sieve_hammer",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"", "default:cord", "default:steel_ingot"},
		{"default:handle_medium", "default:glue", ""},
	}
})
]]
minetest.register_craft({
	output = "default:tool_gravel_sieve_hammer",
	recipe = {
		{"", "", ""},
		{"", "default:gravelsieve_hammer_head", ""},
		{"default:cord", "default:handle_medium", "default:glue"},
	}
})

minetest.register_craft({
	output = "default:sieve3",
	recipe = {
		{"default:iron_hardware", "",                      "default:iron_hardware"},
		{"default:glue", "default:iron_grille",   "default:glue"},
		{"group:wood", "",                      "group:wood"},
	},
})
--[[
minetest.register_craft({
	output = "default:auto_sieve3",
	recipe = {
		{"default:sieve3", "default:iron_hardware",  "default:copperblock"},
	},
})
]]
minetest.register_craft({
	output = "default:compressed_gravel",
	recipe = {
		{"default:sieved_gravel", "default:sieved_gravel"},
		{"default:sieved_gravel", "default:sieved_gravel"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "default:cobble",
	recipe = "default:compressed_gravel",
	cooktime = 10,
})



--[[
# Gravel Sieve Mod
A Mod for those who do not want to spend half their lives underground...

Inspired from a Minecr**t Video on YT.

This mod simplifies the extraction of ores by the fact that ores can be obtained simply by sieving gravel.

This mod includes three new tools:
 - a hammer to produce gravel from Cobblestone
 - two gravel sieves to find ores (a manual sieve and a automatic sieve)

The sieved gravel can be crafted to Compressed Gravel (inspired by Modern Hippie) and "cooked" in the furnace to get Cobblestone again.

Recipe for the Gravel Sieve:

    Wood,  -----------,  Wood
    Wood,  Steel Ingot,  Wood
    Wood,  -----------,  Wood


Recipe for the Automatic Gravel Sieve:

    Gravel Sieve,  Mese Crystal,  Mese Crystal


Recipe for Compressed Gravel:

    Sieved Gravel, Sieved Gravel,
    Sieved Gravel, Sieved Gravel,


Browse on: ![GitHub](https://github.com/joe7575/Minetest-Gravelsieve)

Download: ![GitHub](https://github.com/joe7575/Minetest-Gravelsieve/archive/master.zip)


## Dependencies
default, optional moreores and tubelib   

# License
Copyright (C) 2017 Joachim Stolberg  
Code: Licensed under the GNU LGPL version 2.1 or later. See LICENSE.txt and http://www.gnu.org/licenses/lgpl-2.1.txt  
Textures: CC0
]]
