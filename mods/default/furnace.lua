--furnace mod by sfan5
--v1.1
--Added to es 20160318 maikerumine
--Added to sticks and stones subgame 20170829 maikerumine

local function get_furnace_active_formspec(pos, percent)
	local formspec =
		"size[8,9]"..
		"image[2,2;1,1;default_furnace_fire_bg.png^[lowpart:"..
		(100-percent)..":default_furnace_fire_fg.png]"..
		"list[current_name;fuel;2,3;1,1;]"..
		"list[current_name;src;2,1;1,1;]"..
		"list[current_name;dst;5,1;2,2;]"..
		"list[current_player;main;0,5;8,4;]"
	return formspec
end

local furnace_inactive_formspec =
	"size[8,9]"..
	"image[2,2;1,1;default_furnace_fire_bg.png]"..
	"list[current_name;fuel;2,3;1,1;]"..
	"list[current_name;src;2,1;1,1;]"..
	"list[current_name;dst;5,1;2,2;]"..
	"list[current_player;main;0,5;8,4;]"	
	
local furnace_receipes = {
	--input                 output            time
	{"default:crucible_glue", "default:glue",      10},
	{"default:clay_lump", "default:clay_brick",      13},
	{"default:tree", "default:charcoal 2",      30},
	{"default:jungletree", "default:charcoal 2",      38},
	{"default:acacia_tree", "default:charcoal 2",      34},
	{"default:aspen_tree", "default:charcoal 2",      22},
	{"default:pine_tree", "default:charcoal 2",      26},
	{"default:fern_trunk_big_top", "default:charcoal 4",      16},
	{"default:fern_trunk_big_top", "default:charcoal 4",      16},
	{"default:fern_trunk", "default:charcoal 3",      7},
	{"default:stick", "default:charcoal_chips 1",      5},
	{"group:stick", "default:charcoal_chips 1",      5},
	{"group:kindling", "default:charcoal_chips 1",      5},
	{"default:treeroot", "default:charcoal_chips 1",      5},
	{"default:twig_1", "default:charcoal_chips 1",      5},
	{"default:twig_2", "default:charcoal_chips 1",      5},
	{"default:twig_3", "default:charcoal_chips 1",      5},
	{"default:twig_4", "default:charcoal_chips 1",      5},
	{"default:twig_5", "default:charcoal_chips 1",      5},
	{"default:twig_6", "default:charcoal_chips 1",      5},
	{"default:twig_7", "default:charcoal_chips 1",      5},
	{"default:twig_8", "default:charcoal_chips 1",      5},
	{"default:twig_9", "default:charcoal_chips 1",      5},
	{"default:twig_10", "default:charcoal_chips 1",      5},
	{"default:twig_11", "default:charcoal_chips 1",      5},
	{"default:twig_12", "default:charcoal_chips 1",      5},
	{"default:twig_13", "default:charcoal_chips 1",      5},
	{"default:bottom", "default:charcoal_chips 2",      5},
	{"default:youngtree2_bottom", "default:charcoal_chips 2",      5},
	{"default:bushbranches2", "default:charcoal_chips 2",      5},

	--FARMING
	{"farming:flour", "farming:bread",      15},
	{"farming:unbaked_clay_bowl", "farming:clay_bowl",      15},
	{"farming:uncooked_vegetable_stew", "farming:vegetable_stew",      15},
	
	--SURVIVAL FOOD
	{"default:raw_kabob", "default:food_cooked_kabob",      7},
	{"default:bucket_sap", "default:sugar",      30},
	{"default:mussel_raw", "default:food_mussel_cooked",      3},
	{"default:oyster_raw", "default:food_oyster_cooked",      3},
	{"default:milipede_raw", "default:food_milipede_cooked",      1},
	{"default:centipede_raw", "default:food_centipede_cooked",      1},
	{"default:worm_raw", "default:food_worm_cooked",      1},
	{"default:cricket_raw", "default:food_cricket_cooked",      1},
	{"default:slug_raw", "default:food_slug_cooked",      1},
	{"default:bait_worm", "default:food_worm_cooked",      1},
	{"default:fiddlehead", "ferns:fiddlehead_roasted",      1},
	{"default:ferntuber", "ferns:ferntuber_roasted",      1},
	{"mobs:meat_raw", "mobs:meat",      22},
	{"mobs:bug", "mobs:bug_cooked",      2},
	
	--FISHING
	{"default:bait_worm", "default:food_worm_cooked",      2},
	{"default:fish_raw", "default:fish_cooked",      6},
	{"default:clownfish_raw", "default:fish_cooked",      6},
	{"default:bluewhite_raw", "default:fish_cooked",      9},
	{"default:exoticfish_raw", "default:fish_cooked",      6},
	{"default:carp_raw", "default:fish_cooked",      9},
	{"default:perch_raw", "default:fish_cooked",      6},
	{"default:catfish_raw", "default:fish_cooked",      7},
	{"default:shark_raw", "default:shark_cooked",      11},
	{"default:pike_raw", "default:pike_cooked",      7},
	{"default:pike_raw", "default:pike_cooked",      7},
	
	--BUSHES_CLASSIC
	{"default:blackberry_pie_raw", "default:blackberry_pie_cooked",      10},
	{"default:blueberry_pie_raw", "default:blueberry_pie_cooked",      10},
	{"default:strawberry_pie_raw", "default:strawberry_pie_cooked",      10},
	{"default:raspberry_pie_raw", "default:raspberry_pie_cooked",      10},
	{"default:gooseberry_pie_raw", "default:gooseberry_pie_cooked",      10},
	{"default:mixed_berry_pie_raw", "default:mixed_berry_pie_cooked",      10},
	
	--NSSPF
	{"default:boletus_edulis", "default:cooked_boletus_edulis",      10},
	{"default:boletus_pinophilus", "default:cooked_boletus_pinophilus",      10},
	{"default:boletus_satanas", "default:cooked_boletus_satanas",      10},
	{"default:suillus_grevillei", "default:cooked_suillus_grevillei",      10},
	{"default:morchella_conica", "default:cooked_morchella_conica",      10},
	{"default:amanita_phalloides", "default:cooked_amanita_phalloides",      10},
	{"default:amanita_muscaria", "default:cooked_amanita_muscaria",      10},
	{"default:cantharellus_cibarius", "default:cooked_cantharellus_cibarius",      10},
	{"default:russula_xerampelina", "default:cooked_russula_xerampelina",      10},
	{"default:fistulina_hepatica", "default:cooked_fistulina_hepatica",      10},
	{"default:armillaria_mellea", "default:cooked_armillaria_mellea",      10},
	{"default:mycena_chlorophos", "default:cooked_mycena_chlorophos",      10},
	{"default:panellus_pusillus", "default:cooked_panellus_pusillus",      10},
	{"default:macrolepiota_procera", "default:cooked_macrolepiota_procera",      10},
	{"default:psilocybe_cubensis", "default:cooked_psilocybe_cubensis",      10},
	{"default:lycoperdon_pyriforme", "default:cooked_lycoperdon_pyriforme",      10},
	{"default:coprinus_atramentarius", "default:cooked_coprinus_atramentarius",      10},
	{"default:gyromitra_esculenta", "default:cooked_gyromitra_esculenta",      10},
	{"default:clitocybe_glacialis", "default:cooked_clitocybe_glacialis",      10},
	{"default:plectania_nannfeldtii", "default:cooked_plectania_nannfeldtii",      10},
	{"default:hygrophorus_goetzii", "default:cooked_hygrophorus_goetzii",      10},
	{"default:lentinus_strigosus", "default:cooked_lentinus_strigosus",      10},
	{"default:ganoderma_lucidum", "default:cooked_ganoderma_lucidum",      10},
	{"default:marasmius_haematocephalus", "default:cooked_marasmius_haematocephalus",      10},
	{"default:clitocybula_azurea", "default:cooked_clitocybula_azurea",      10},
}


function furnace_get_craft_result(input)
	if input.method ~= "cooking" then return nil end
	if input.width ~= 1 then return nil end
	for _, e in ipairs(furnace_receipes) do
		if e[1] == input.items[1]:get_name() then
			local outstack = input.items[1]
			outstack:take_item()
			return {item = ItemStack(e[2]), time=e[3]}, {items = {outstack}}
		end
	end
	return {item = ItemStack(""), time=0}, {items = ItemStack("")}
end





minetest.register_node("default:furnace", {
	description = "Furnace  ///CAUTION!///  While furnace is in operation, do NOT place items in furnace.  Let furnace cool with no flame and then place items.",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "default_furnace_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
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
		if minetest.is_protected(pos, player:get_player_name()) then  --mm added is protectrd
			return 0
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
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
					meta:set_string("infotext","Furnace is empty")
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

minetest.register_node("default:furnace_active", {
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png",
		{
			image = "default_furnace_front_active.png",
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
	drop = "default:furnace",
	groups = {cracky=2, not_in_creative_inventory=1,hot=1, falling_node = 1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace");
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
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
					meta:set_string("infotext","Furnace is empty")
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
					meta:set_string("infotext","Furnace is empty")
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
	nodenames = {"default:furnace","default:furnace_active"},
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
			cooked, aftercooked = furnace_get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		
		local was_active = false
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			was_active = true
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
			meta:set_string("infotext","Furnace active: "..percent.."%")
			hacky_swap_node(pos,"default:furnace_active")
			meta:set_string("formspec", get_furnace_active_formspec(pos, percent))
			return
		end

		local fuel = nil
		local afterfuel
		local cooked = nil
		local fuellist = inv:get_list("fuel")
		local srclist = inv:get_list("src")
		
		if srclist then
			cooked = furnace_get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		if fuellist then
			fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
		end

		if fuel.time <= 0 then
			meta:set_string("infotext", "Furnace out of fuel")
			hacky_swap_node(pos, "default:furnace")
			meta:set_string("formspec", furnace_inactive_formspec)
			return
		end

		if cooked.item:is_empty() then
			if was_active then
				meta:set_string("infotext", "Furnace is empty")
				hacky_swap_node(pos, "default:furnace")
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
	output = 'default:furnace',
	recipe = {
		{'default:cobble', 'default:steelblock', 'default:cobble'},
		{'', 'default:diamondblock', ''},
		{'default:stonebrick', 'default:cobble', 'default:stonebrick'},
	}
})
]]
minetest.register_craft({
	output = 'default:furnace',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', '', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})