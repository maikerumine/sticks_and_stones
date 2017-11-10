--CrushingFurnace mod by sfan5
--v1.1
--Added to es 20160318 maikerumine
--Added to sticks and stones subgame 20170829 maikerumine
--===========================
--===========================

local function get_furnace_active_formspec(pos, percent)
	local formspec =
		"size[8,9]"..
		"image[2,2;1,1;bloomery_on_bg.png^[lowpart:"..
		(100-percent)..":bloomery_on_fg.png]"..
		"list[current_name;fuel;2,3;1,1;]"..
		"list[current_name;src;2,1;1,1;]"..
		"list[current_name;dst;5,1;2,2;]"..
		"list[current_player;main;0,5;8,4;]"
	return formspec
end

local furnace_inactive_formspec =
	"size[8,9]"..
	"image[2,2;1,1;bloomery_on_bg.png]"..
	"list[current_name;fuel;2,3;1,1;]"..
	"list[current_name;src;2,1;1,1;]"..
	"list[current_name;dst;5,1;2,2;]"..
	"list[current_player;main;0,5;8,4;]"

local crushingfurnace_receipes = {
	--input                 output            time
	{"default:iron_bloom_material", "default:iron_bloom",      60},
	{"default:iron_bloom", "default:steel_ingot",      60},
	{"bucket:bucket_empty", "default:steel_ingot 3",      60},
	{"default:steel_ingot", "default:redhot_steel_ingot",      60},
	{"default:copper_lump", "default:orangehot_copper_ingot",      60},
	{"default:copper_ingot", "default:orangehot_copper_ingot",      60},
	{"default:sand", "default:glass_fragments",      3},
	{"default:desert_sand", "default:glass_fragments",      3},
	{"default:silver_sand", "default:glass_fragments",      3},
	{"default:sand", "default:glass_fragments",      3},
	{"default:glass_fragments", "default:glass",      3},
	{"bucket:bucket_metal_nuggets", "bucket:bucket_metal_molten",      125},
	{"bucket:bucket_metal_copper_nuggets", "bucket:bucket_metal_copper_molten",      125},
	{"stairs:slab_steelblock", "stairs:slab_redhot_steelblock",      225},
	{"stairs:slab_copperblock", "stairs:slab_orangehot_steelblock",      225},
	{"default:tool_steel_mandrel", "default:redhot_tool_steel_mandrel",      125},
	--{"default:mold_hinge", "default:redhot_mold_hinge",      7},
	--{"default:mold_pick_head", "default:redhot_mold_pick_head",      100},
	--{"default:mold_axe_head", "default:redhot_mold_axe_head",      75},
	--{"default:mold_shovel_head", "default:redhot_mold_shovel_head",      70},
	--{"default:mold_sword_head", "default:redhot_mold_sword_head",      65},
	{"default:steel_bar", "default:redhot_steel_bar",      15},
	{"default:copper_bar", "default:redhot_copper_bar",      7},
	{"default:tool_steel_tongs", "default:redhot_tool_steel_tongs",      35},
	{"default:steel_battleaxe_head", "default:redhot_steel_battleaxe_head",      65},
	{"default:tool_anvil_hammer_head", "default:redhot_tool_anvil_hammer_head",      65},
	--musket
	{"default:steel_barrel_musket", "default:redhot_steel_barrel_musket",      75},
	{"default:steel_barrel_long", "default:redhot_steel_barrel_long",      75},
	{"default:steel_barrel_medium", "default:redhot_steel_barrel_medium",      55},
	{"default:steel_barrel_short", "default:redhot_steel_barrel_short",      35},
	
	{"default:tool_pick_iron", "default:redhot_pick_head",      180},
	{"default:tool_pick_steel", "default:redhot_pick_head",      180},
	{"default:tool_axe_iron", "default:redhot_axe_head",      180},
	{"default:tool_axe_steel", "default:redhot_axe_head",      180},
	{"default:tool_shovel_iron", "default:redhot_shovel_head",      180},
	{"default:tool_shovel_steel", "default:redhot_shovel_head",      180},
	{"default:tool_sword_iron", "default:redhot_sword_head",      180},
	{"default:tool_sword_steel", "default:redhot_sword_head",      180},
	
	--stone cooking
	{"default:basalt_cobble", "default:basalt",      20},
	{"default:desert_stone_cobble", "default:desert_stone",      20},
	{"default:desert_cobble", "default:desert_stone",      30},
	{"default:cobble", "default:stone",      30},
	{"default:leaves", "default:dry_leaves",      20},
	{"default:sandstone", "default:sandstone_cobble",      20},
	{"default:schist", "default:gneiss",      20},
	{"default:gneiss_cobble", "default:gneiss",      20},
	{"default:ors_cobble", "default:ors",      20},
	{"default:sandstone", "default:ors_cobble",      20},
	{"default:slate", "default:schist",      20},
	{"default:mud", "default:shale",      20},
	{"default:shale", "default:slate",      20},
	{"default:slate_cobble", "default:slate",      20},
	{"default:desert_stone", "default:ors_cobble",      20},
	{"default:stone", "default:cobble",      20},
	
	--melting
	{"doors:trapdoor_steel", "default:redhot_steel_ingot 4",      20},
	{"doors:door_steel", "default:redhot_steel_ingot 6",      20},
	{"default:iron_bars", "default:redhot_steel_ingot 3",      20},
	{"default:iron_grille", "default:redhot_steel_ingot 12",      20},
	{"default:steel_bottle", "default:redhot_steel_ingot 1",      20},
	{"doors:door_steel", "default:redhot_steel_ingot 6",      20},
	{"doors:trapdoor_steel", "default:redhot_steel_ingot 4",      20},


}



--From new_campfire

-- FUNCTIONS
local function fire_particles_on(pos) -- 3 layers of fire
    local meta = minetest.get_meta(pos)
    local id = minetest.add_particlespawner({ -- 1 layer big particles fire
        amount = 9,
        time = 1.3,
        minpos = {x = pos.x - 0.14, y = pos.y + 0.4, z = pos.z - 0.14},
        maxpos = {x = pos.x + 0.14, y = pos.y + 0.8, z = pos.z + 0.14},
        minvel = {x= 0, y= 0, z= 0},
        maxvel = {x= 0, y= 0.1, z= 0},
        minacc = {x= 0, y= 0, z= 0},
        maxacc = {x= 0, y= 0.7, z= 0},
        minexptime = 0.5,
        maxexptime = 0.7,
        minsize = 2,
        maxsize = 5,
        collisiondetection = false,
        vertical = true,
        texture = "new_campfire_anim_fire.png",
        animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = 0.8,},
--      playername = "singleplayer"
    })
    meta:set_int("layer_1", id)

    local id = minetest.add_particlespawner({ -- 2 layer smol particles fire
        amount = 1,
        time = 1.3,
        minpos = {x = pos.x - 0.1, y = pos.y, z = pos.z - 0.1},
        maxpos = {x = pos.x + 0.1, y = pos.y + 1.4, z = pos.z + 0.1},
        minvel = {x= 0, y= 0, z= 0},
        maxvel = {x= 0, y= 0.1, z= 0},
        minacc = {x= 0, y= 0, z= 0},
        maxacc = {x= 0, y= 1, z= 0},
        minexptime = 0.4,
        maxexptime = 0.6,
        minsize = 0.5,
        maxsize = 0.7,
        collisiondetection = false,
        vertical = true,
        texture = "new_campfire_anim_fire.png",
        animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = 0.7,},
     -- playername = "singleplayer"
    })
    meta:set_int("layer_2", id)

    local id = minetest.add_particlespawner({ --3 layer smoke
        amount = 1,
        time = 1.3,
        minpos = {x = pos.x - 0.1, y = pos.y - 0.2, z = pos.z - 0.1},
        maxpos = {x = pos.x + 0.2, y = pos.y + 2.4, z = pos.z + 0.2},
        minvel = {x= 0, y= 0, z= 0},
        maxvel = {x= 0, y= 0.6, z= 0},
        minacc = {x= 0, y= 0.3, z= 0},
        maxacc = {x= 0, y= 1, z= 0},
        minexptime = 0.6,
        maxexptime = 2.8,
        minsize = 2,
        maxsize = 7,
        collisiondetection = true,
        vertical = true,
        texture = "new_campfire_anim_smoke.png",
        animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = 0.9,},
        -- playername = "singleplayer"
    })
    meta:set_int("layer_3", id)
end

local function effect(pos, texture, vlc, acc, time, size)
    local id = minetest.add_particle({
        pos = pos,
        velocity = vlc,
        acceleration = acc,
        expirationtime = time,
        size = size,
        collisiondetection = true,
        vertical = true,
        texture = texture,
    })
end


local function fire_particles_off(pos)
    local meta = minetest.get_meta(pos)
    local id_1 = meta:get_int("layer_1");
    local id_2 = meta:get_int("layer_2");
    local id_3 = meta:get_int("layer_3");
    minetest.delete_particlespawner(id_1)
    minetest.delete_particlespawner(id_2)
    minetest.delete_particlespawner(id_3)
end



function crushingfurnace_get_craft_result(input)
	if input.method ~= "cooking" then return nil end
	if input.width ~= 1 then return nil end
	for _, e in ipairs(crushingfurnace_receipes) do
		if e[1] == input.items[1]:get_name() then
			local outstack = input.items[1]
			outstack:take_item()
			return {item = ItemStack(e[2]), time=e[3]}, {items = {outstack}}
		end
	end
	return {item = ItemStack(""), time=0}, {items = ItemStack("")}
end

minetest.register_node("default:bloomery", {
	description = "Bloomery ///CAUTION!///  While bloomery is in operation, do NOT place items in bloomery.  Let bloomery cool with no flame and then place items.",
	tiles = {"default_desert_sandstone_block.png^default_coal_lump.png", "default_desert_sandstone_block.png", "default_desert_sandstone_brick.png",
		"default_desert_sandstone_brick.png", "default_desert_sandstone_brick.png", "bloomery_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", furnace_inactive_formspec)
		meta:set_string("infotext", "Bloomery -Safe to add items-")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		local handle = meta:get_int("handle")
		minetest.sound_stop(handle)
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if minetest.is_protected(pos, player:get_player_name()) then  --mm added is protectrd
			return 0
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Bloomery is empty")
				end
				return stack:get_count()
			else
				return 0
			end
		elseif listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Bloomery is empty")
				end
				return count
			else
				return 0
			end
		elseif to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

minetest.register_node("default:bloomery_active", {
	tiles = {
		"bloomery_top_active.png", "default_desert_sandstone_block.png",
		"default_desert_sandstone_brick.png", "default_desert_sandstone_brick.png",
		"default_desert_sandstone_brick.png",
		{
			image = "bloomery_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "default:bloomery",
	groups = {cracky=2, not_in_creative_inventory=1,hot=1, falling_node = 1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", furnace_inactive_formspec)
		meta:set_string("infotext", "Bloomery");
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
		minetest.get_node_timer(pos):start(2)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Bloomery is empty")
				end
				return stack:get_count()
			else
				return 0
			end
		elseif listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Bloomery is empty")
				end
				return count
			else
				return 0
			end
		elseif to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
	
	on_timer = function(pos) -- Every 6 seconds play sound fire_small
		local meta = minetest.get_meta(pos)
		local handle = minetest.sound_play("fire_fire",{pos=pos, max_hear_distance = 18, loop=false, gain=0.1})
		meta:set_int("handle", handle)
		minetest.get_node_timer(pos):start(4)
	end,
})

function hacky_swap_node(pos,name)
	local node = minetest.get_node(pos)
	local meta = minetest.get_meta(pos)
	if node.name == name then
		return
	end
	local meta0 = meta:to_table()
	node.name = name
	minetest.set_node(pos,node)
	meta = minetest.get_meta(pos)
	meta:from_table(meta0)
end

minetest.register_abm({
	nodenames = {"default:bloomery","default:bloomery_active"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		
		for i, name in ipairs({
				"fuel_totaltime",
				"fuel_time",
				"src_totaltime",
				"src_time"
		}) do
			if meta:get_string(name) == "" then
				meta:set_float(name, 0.0)
			end
		end

		local inv = meta:get_inventory()

		local srclist = inv:get_list("src")
		local cooked = nil
		local aftercooked
		
		if srclist then
			cooked, aftercooked = crushingfurnace_get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		
		local was_active = false
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			was_active = true
			fire_particles_on(pos)
			meta:set_float("fuel_time", meta:get_float("fuel_time") + 1)
			meta:set_float("src_time", meta:get_float("src_time") + 1)
			if cooked and cooked.item and meta:get_float("src_time") >= cooked.time then
				-- check if there's room for output in "dst" list
				if inv:room_for_item("dst",cooked.item) then
					-- Put result in "dst" list
					inv:add_item("dst", cooked.item)
					-- take stuff from "src" list
					inv:set_stack("src", 1, aftercooked.items[1])
				else
					print("Could not insert '"..cooked.item:to_string().."'")
				end
				meta:set_string("src_time", 0)
			end
		end
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			local percent = math.floor(meta:get_float("fuel_time") /
					meta:get_float("fuel_totaltime") * 100)
			meta:set_string("infotext","Bloomery active: "..percent.."%")
			hacky_swap_node(pos,"default:bloomery_active")
			meta:set_string("formspec", get_furnace_active_formspec(pos, percent))
			return
		end

		local fuel = nil
		local afterfuel
		local cooked = nil
		local fuellist = inv:get_list("fuel")
		local srclist = inv:get_list("src")
		
		if srclist then
			cooked = crushingfurnace_get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		if fuellist then
			fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
		end

		if fuel.time <= 0 then
			meta:set_string("infotext", "Bloomery out of fuel")
			hacky_swap_node(pos, "default:bloomery")
			meta:set_string("formspec", furnace_inactive_formspec)
			return
		end

		if cooked.item:is_empty() then
			if was_active then
				meta:set_string("infotext", "Bloomery is empty")
				hacky_swap_node(pos, "default:bloomery")
				meta:set_string("formspec", furnace_inactive_formspec)
			end
			return
		end

		meta:set_string("fuel_totaltime", fuel.time)
		meta:set_string("fuel_time", 0)
		
		inv:set_stack("fuel", 1, afterfuel.items[1])
	end,
})
--[[
minetest.register_craft({
	output = 'default:bloomery',
	recipe = {
		{'default:cobble', 'default:steelblock', 'default:cobble'},
		{'', 'default:diamondblock', ''},
		{'default:stonebrick', 'default:cobble', 'default:stonebrick'},
	}
})
]]

minetest.register_craft({
	output = 'default:bloomery',
	recipe = {
		{'default:desert_sandstone_brick', 'default:desert_sandstone_brick', 'default:desert_sandstone_brick'},
		{'default:desert_sandstone_brick', 'default:clay_brick', 'default:desert_sandstone_brick'},
		{'default:desert_sandstone_brick', 'default:brick', 'default:desert_sandstone_brick'},
	}
})
