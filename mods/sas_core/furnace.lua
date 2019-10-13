--furnace mod by sfan5
--v1.1
--Added to es 20160318 maikerumine
--Added to sticks and stones subgame 20170829 maikerumine
--minetest.register_node(":default:furnace", {})        --when on this suppresses old furnace cannot alias
minetest.register_alias("default:furnace", "sas_core:sasfurnace")
minetest.register_alias("default:furnace_active", "sas_core:sasfurnace_active")


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
	{"sas_core:crucible_glue", "sas_core:glue",      10},
	{"sas_core:bucket_sap", "sas_core:bucket_sap_cooked",      10},
	{"default:clay_lump", "default:clay_brick",      13},
	{"default:tree", "sas_core:charcoal 2",      30},
	{"default:jungletree", "sas_core:charcoal 2",      38},
	{"default:acacia_tree", "sas_core:charcoal 2",      34},
	{"default:aspen_tree", "sas_core:charcoal 2",      22},
	{"default:pine_tree", "sas_core:charcoal 2",      26},
	{"sas_core:fern_trunk_big_top", "sas_core:charcoal 4",      16},
	{"sas_core:fern_trunk_big_top", "sas_core:charcoal 4",      16},
	{"sas_core:fern_trunk", "sas_core:charcoal 3",      7},
	{"default:stick", "sas_core:charcoal_chips 1",      5},
	{"group:stick", "sas_core:charcoal_chips 1",      5},
	{"group:kindling", "sas_core:charcoal_chips 1",      5},
	{"sas_core:treeroot", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_1", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_2", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_3", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_4", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_5", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_6", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_7", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_8", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_9", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_10", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_11", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_12", "sas_core:charcoal_chips 1",      5},
	{"sas_core:twig_13", "sas_core:charcoal_chips 1",      5},
	{"sas_core:bottom", "sas_core:charcoal_chips 2",      5},
	{"sas_core:youngtree2_bottom", "sas_core:charcoal_chips 2",      5},
	{"sas_core:bushbranches2", "sas_core:charcoal_chips 2",      5},

	--FARMING
	{"farming:flour", "farming:bread",      15},
	{"farming:pumpkin", "farming:roasted_pumpkin",      15},
	{"farming:unbaked_clay_bowl", "farming:clay_bowl",      15},
	{"farming:uncooked_vegetable_stew", "farming:vegetable_stew",      15},
	
	--SURVIVAL FOOD
	{"sas_core:raw_kabob", "sas_core:food_cooked_kabob",      7},
	{"sas_core:bucket_sap", "sas_core:sugar",      30},
	{"sas_core:mussel_raw", "sas_core:food_mussel_cooked",      3},
	{"sas_core:oyster_raw", "sas_core:food_oyster_cooked",      3},
	{"sas_core:milipede_raw", "sas_core:food_milipede_cooked",      1},
	{"sas_core:centipede_raw", "sas_core:food_centipede_cooked",      1},
	{"sas_core:worm_raw", "sas_core:food_worm_cooked",      1},
	{"sas_core:cricket_raw", "sas_core:food_cricket_cooked",      1},
	{"sas_core:slug_raw", "sas_core:food_slug_cooked",      1},
	{"sas_core:bait_worm", "sas_core:food_worm_cooked",      1},
	{"sas_core:fiddlehead", "ferns:fiddlehead_roasted",      1},
	{"sas_core:ferntuber", "ferns:ferntuber_roasted",      1},
	{"mobs:meat_raw", "mobs:meat",      22},
	{"mobs:bug", "mobs:bug_cooked",      2},
	
	--FISHING
	{"sas_core:bait_worm", "sas_core:food_worm_cooked",      2},
	{"sas_core:fish_raw", "sas_core:fish_cooked",      6},
	{"sas_core:clownfish_raw", "sas_core:fish_cooked",      6},
	{"sas_core:bluewhite_raw", "sas_core:fish_cooked",      9},
	{"sas_core:exoticfish_raw", "sas_core:fish_cooked",      6},
	{"sas_core:carp_raw", "sas_core:fish_cooked",      9},
	{"sas_core:perch_raw", "sas_core:fish_cooked",      6},
	{"sas_core:catfish_raw", "sas_core:fish_cooked",      7},
	{"sas_core:shark_raw", "sas_core:shark_cooked",      11},
	{"sas_core:pike_raw", "sas_core:pike_cooked",      7},
	{"sas_core:pike_raw", "sas_core:pike_cooked",      7},
	
	--BUSHES_CLASSIC
	{"sas_core:blackberry_pie_raw", "sas_core:blackberry_pie_cooked",      10},
	{"sas_core:blueberry_pie_raw", "sas_core:blueberry_pie_cooked",      10},
	{"sas_core:strawberry_pie_raw", "sas_core:strawberry_pie_cooked",      10},
	{"sas_core:raspberry_pie_raw", "sas_core:raspberry_pie_cooked",      10},
	{"sas_core:gooseberry_pie_raw", "sas_core:gooseberry_pie_cooked",      10},
	{"sas_core:mixed_berry_pie_raw", "sas_core:mixed_berry_pie_cooked",      10},
	
	--NSSPF
	{"sas_core:boletus_edulis", "sas_core:cooked_boletus_edulis",      10},
	{"sas_core:boletus_pinophilus", "sas_core:cooked_boletus_pinophilus",      10},
	{"sas_core:boletus_satanas", "sas_core:cooked_boletus_satanas",      10},
	{"sas_core:suillus_grevillei", "sas_core:cooked_suillus_grevillei",      10},
	{"sas_core:morchella_conica", "sas_core:cooked_morchella_conica",      10},
	{"sas_core:amanita_phalloides", "sas_core:cooked_amanita_phalloides",      10},
	{"sas_core:amanita_muscaria", "sas_core:cooked_amanita_muscaria",      10},
	{"sas_core:cantharellus_cibarius", "sas_core:cooked_cantharellus_cibarius",      10},
	{"sas_core:russula_xerampelina", "sas_core:cooked_russula_xerampelina",      10},
	{"sas_core:fistulina_hepatica", "sas_core:cooked_fistulina_hepatica",      10},
	{"sas_core:armillaria_mellea", "sas_core:cooked_armillaria_mellea",      10},
	{"sas_core:mycena_chlorophos", "sas_core:cooked_mycena_chlorophos",      10},
	{"sas_core:panellus_pusillus", "sas_core:cooked_panellus_pusillus",      10},
	{"sas_core:macrolepiota_procera", "sas_core:cooked_macrolepiota_procera",      10},
	{"sas_core:psilocybe_cubensis", "sas_core:cooked_psilocybe_cubensis",      10},
	{"sas_core:lycoperdon_pyriforme", "sas_core:cooked_lycoperdon_pyriforme",      10},
	{"sas_core:coprinus_atramentarius", "sas_core:cooked_coprinus_atramentarius",      10},
	{"sas_core:gyromitra_esculenta", "sas_core:cooked_gyromitra_esculenta",      10},
	{"sas_core:clitocybe_glacialis", "sas_core:cooked_clitocybe_glacialis",      10},
	{"sas_core:plectania_nannfeldtii", "sas_core:cooked_plectania_nannfeldtii",      10},
	{"sas_core:hygrophorus_goetzii", "sas_core:cooked_hygrophorus_goetzii",      10},
	{"sas_core:lentinus_strigosus", "sas_core:cooked_lentinus_strigosus",      10},
	{"sas_core:ganoderma_lucidum", "sas_core:cooked_ganoderma_lucidum",      10},
	{"sas_core:marasmius_haematocephalus", "sas_core:cooked_marasmius_haematocephalus",      10},
	{"sas_core:clitocybula_azurea", "sas_core:cooked_clitocybula_azurea",      10},
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





minetest.register_node("sas_core:sasfurnace", {
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

minetest.register_node("sas_core:sasfurnace_active", {
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
	drop = "sas_core:sasfurnace",
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
	nodenames = {"sas_core:sasfurnace","sas_core:sasfurnace_active"},
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
			hacky_swap_node(pos,"sas_core:sasfurnace_active")
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
			hacky_swap_node(pos, "sas_core:sasfurnace")
			meta:set_string("formspec", furnace_inactive_formspec)
			return
		end

		if cooked.item:is_empty() then
			if was_active then
				meta:set_string("infotext", "Furnace is empty")
				hacky_swap_node(pos, "sas_core:sasfurnace")
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
	output = 'sas_core:furnace',
	recipe = {
		{'sas_core:cobble', 'sas_core:steelblock', 'sas_core:cobble'},
		{'', 'sas_core:diamondblock', ''},
		{'sas_core:stonebrick', 'sas_core:cobble', 'sas_core:stonebrick'},
	}
})
]]
minetest.register_craft({
	output = 'sas_core:sasfurnace',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', 'group:stick', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})
