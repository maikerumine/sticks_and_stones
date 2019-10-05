-- Bushes classic mod originally by unknown
-- now maintained by VanessaE
--
-- License:  WTFPL

local S = default.intllib

--default = {}



--added from farming redo

-- blueberries
minetest.register_craftitem("default:blueberry", {
	description = S("Blueberries"),
	inventory_image = "bushes_blueberry.png",
	groups = { blueberry = 1, berry = 1 },
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("default:blackberry", {
	description = S("Blackberries"),
	inventory_image = "bushes_blackberry.png",
	groups = { blackberry = 1, berry = 1 },
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("default:raspberry", {
	description = S("Raspberries"),
	inventory_image = "bushes_raspberry.png",
	groups = { raspberry = 1, berry = 1 },
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("default:strawberry", {
	description = S("Strawberries"),
	inventory_image = "bushes_strawberry.png",
	groups = { strawberry = 1, berry = 1 },
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("default:gooseberry", {
	description = S("Gooseberries"),
	inventory_image = "bushes_gooseberry.png",
	groups = { gooseberry = 1, berry = 1 },
	on_use = minetest.item_eat(1),
})


default.bushes = {
	"blackberry",
	"blueberry",
	"strawberry",
	"raspberry",
	"gooseberry",
	"mixed_berry",
}

default.bushes_descriptions = {
	"Blackberry",
	"Blueberry",
	"strawberry",
	"Raspberry",
	"Gooseberry",
	"Mixed Berry",
}

default.spawn_list = {}

--dofile(minetest.get_modpath('default') .. '/cooking.lua')
--dofile(minetest.get_modpath('default') .. '/nodes.lua')

default:spawn_on_surfaces({
	spawn_delay = 600,
	spawn_plants = default.spawn_list,
	avoid_radius = 10,
	spawn_chance = 100,
	spawn_surfaces = {
		"default:dirt_with_grass",
		"default:dirt_with_leaves_1",
		"default:grass_with_leaves_1",
		"default:grass_with_leaves_2",
		"farming:soil",
		"farming:soil_wet",
		"valleys_mapgen:dirt_with_grass",
		"valleys_mapgen:clayey_with_grass",
		"valleys_mapgen:dirt_sandy_with_grass",
		"valleys_mapgen:dirt_silty_with_grass",
	},
	avoid_nodes = {"group:bush"},
	seed_diff = 545342534, -- chosen by a fair mashing of the keyboard - guaranteed to be random :P
	plantlife_limit = -0.1,
	light_min = 10,
	temp_min = 0.15, -- approx 20C
	temp_max = -0.15, -- approx 35C
--	humidity_min = 0, -- 50% RH
--	humidity_max = -1, -- 100% RH
})

print(S("[Bushes] Loaded."))

local S = default.intllib

-- Basket

minetest.register_craft({
    output = "default:basket_empty",
    recipe = {
	{ "default:stick", "default:stick", "default:stick" },
	{ "", "default:stick", "" },
    },
})

-- Sugar
--[[
minetest.register_craftitem(":default:sugar", {
    description = S("Sugar"),
    inventory_image = "bushes_sugar.png",
    on_use = minetest.item_eat(1),
	groups = {food_sugar=1}
})

minetest.register_craft({
    output = "default:sugar 1",
    recipe = {
	{ "default:papyrus", "default:papyrus" },
    },
})
]]
for i, berry in ipairs(default.bushes) do
	local desc = default.bushes_descriptions[i]

	minetest.register_craftitem("default:"..berry.."_pie_raw", {
		description = S("Raw "..desc.." pie"),
		inventory_image = "bushes_"..berry.."_pie_raw.png",
		on_use = minetest.item_eat(4),
	})

	minetest.register_craft({
		output = "default:"..berry.."_pie_raw 1",
		recipe = {
		{ "default:sugar", "farming:flour", "default:sugar" },
		{ "group:"..berry, "group:"..berry, "group:"..berry },
		},
	})
--	end

	-- Cooked pie

	minetest.register_craftitem("default:"..berry.."_pie_cooked", {
		description = S("Cooked "..desc.." pie"),
		inventory_image = "bushes_"..berry.."_pie_cooked.png",
		on_use = minetest.item_eat(6),
	})

	minetest.register_craft({
		type = "cooking",
		output = "default:"..berry.."_pie_cooked",
		recipe = "default:"..berry.."_pie_raw",
		cooktime = 30,
	})

	-- slice of pie

	minetest.register_craftitem("default:"..berry.."_pie_slice", {
		description = S("Slice of "..desc.." pie"),
		inventory_image = "bushes_"..berry.."_pie_slice.png",
		on_use = minetest.item_eat(1),
	})

	minetest.register_craft({
		output = "default:"..berry.."_pie_slice 6",
		recipe = {
		{ "default:"..berry.."_pie_cooked" },
		},
	})

	-- Basket with pies

	minetest.register_craft({
		output = "default:basket_"..berry.." 1",
		recipe = {
		{ "default:"..berry.."_pie_cooked", "default:"..berry.."_pie_cooked", "default:"..berry.."_pie_cooked" },
		{ "", "default:basket_empty", "" },
		},
	})
end

minetest.register_craft({
	output = "default:mixed_berry_pie_raw 2",
	recipe = {
	{ "default:sugar", "farming:flour", "default:sugar" },
	{ "group:berry", "group:berry", "group:berry" },
	{ "group:berry", "group:berry", "group:berry" },
	},
})



local S = default.intllib

plantlife_bushes = {}








-- TODO: add support for nodebreakers? those dig like mese picks
plantlife_bushes.after_dig_node = function(pos, oldnode, oldmetadata, digger)
	if not (digger and pos and oldnode) then
		return
	end

	-- find out which bush type we are dealing with
	local bush_name   = ""
	local can_harvest = false

	if oldnode.name == "default:fruitless_bush" then
		-- this bush has not grown fruits yet (but will eventually)
		bush_name = oldmetadata.fields.bush_type
		-- no fruits to be found, so can_harvest stays false
	else
		local name_parts = oldnode.name:split(":")
		if #name_parts >= 2 and name_parts[2] ~= nil then

			name_parts = name_parts[2]:split("_")

			if #name_parts >= 2 and name_parts[1] ~= nil then
				bush_name = name_parts[1]
				-- this bush really carries fruits
				can_harvest = true
			end
		end
	end

	-- find out which tool the digger was wielding (if any)
	local toolstack = digger:get_wielded_item()
	local capabilities = toolstack:get_tool_capabilities()

	-- what the player will get
	local harvested

	-- failure to find out what the tool can do: destroy the bush and return nothing
	local groupcaps = capabilities.groupcaps
	if not groupcaps then
		return

	-- digging with the hand or something like that
	elseif groupcaps.snappy then

		-- plant a new bush without fruits
		minetest.set_node(pos, {type = "node", name = "default:fruitless_bush"})
		local meta = minetest.get_meta(pos)
		meta:set_string('bush_type', bush_name)

		-- construct the stack of fruits the player will get
		-- only bushes that have grown fruits can actually give fruits
		if can_harvest then
			local amount = "10"
			--harvested = "food:" .. bush_name .. " " .. amount
			harvested = "default:" .. bush_name .. " " .. amount
		end

	-- something like a shovel
	elseif groupcaps.crumbly then

		-- with a chance of 1/3, return 2 bushes
		local amount
		if math.random(1,3) == 1 then
			amount = "2"
		else
			amount = "1"
		end
		-- return the bush itself
		harvested = "default:" .. bush_name .. "_bush "..amount

	-- something like an axe
	elseif groupcaps.choppy then

		-- the amount of sticks may vary
		local amount = math.random(4, 20)
		-- return some sticks
		harvested = "default:stick " .. amount

	-- nothing known - destroy the plant
	else
		return
	end

	-- give the harvested result to the player
	if harvested then
		--minetest.chat_send_player("singleplayer","you would now get "..tostring( harvested ) );
		local itemstack = ItemStack(harvested)
		local inventory = digger:get_inventory()
		if inventory:room_for_item("main", itemstack) then
			inventory:add_item("main", itemstack)
		else
			minetest.item_drop(itemstack, digger, pos)
		end
	end
end

plantlife_bushes.after_place_node = function(pos, placer, itemstack)

	if not (itemstack and pos) then
		return
	end

	local name_parts = itemstack:get_name():split(":")
	if #name_parts < 2 or name_parts[2] == nil then
		return
	end

	name_parts = name_parts[2]:split("_")

	if #name_parts < 2 or name_parts[1] == nil then
		return
	end

	minetest.set_node(pos, {name = "default:fruitless_bush"})
	local meta = minetest.get_meta(pos)
	meta:set_string("bush_type", name_parts[1])
end

-- regrow berries (uses a base abm instead of plants_lib because of the use of metadata).

minetest.register_abm({
	nodenames = {"default:fruitless_bush"},
	neighbors = {"group:soil", "group:potting_soil"},
	interval = 604800,  --was 1000  :)
	chance = 4,
	action = function(pos, node, active_object_count, active_object_count_wider)

		local meta = minetest.get_meta(pos)
		local bush_name = meta:get_string("bush_type")
--[[]]
		--if mymonths.month_counter == 6 or mymonths.month_counter == 7 or mymonths.month_counter == 8 then

			if bush_name and bush_name ~= "" then
				local dirtpos = {x = pos.x, y = pos.y-1, z = pos.z}
				local dirt = minetest.get_node(dirtpos)
				local is_soil = minetest.get_item_group(dirt.name, "soil") or minetest.get_item_group(dirt.name, "potting_soil")

				if is_soil and (dirt.name == "farming:soil_wet" or math.random(1,3) == 1) then
					minetest.set_node( pos, {name = "default:" .. bush_name .. "_bush"})
				end
			end
		--end
		--]]
	end
})

-- Define the basket and bush nodes

for i, bush_name in ipairs(default.bushes) do

	local desc = default.bushes_descriptions[i]

	minetest.register_node("default:basket_"..bush_name, {
		description = S("Basket with "..desc.." Pies"),
		drawtype = "mesh",
		mesh = "bushes_basket_full.obj",
		tiles = {
			"bushes_basket_pie_"..bush_name..".png",
			"bushes_basket.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		on_use = minetest.item_eat(18),
		groups = { dig_immediate = 3 },
	})

	local texture_top, texture_bottom

	local groups = {snappy = 3, bush = 1, flammable = 2, attached_node=1}
	if bush_name == "mixed_berry" then
		bush_name = "fruitless";
		desc      = S("currently fruitless");
		texture_top = "bushes_fruitless_bush_top.png"
		texture_bottom = "bushes_fruitless_bush_bottom.png"
		groups.not_in_creative_inventory = 1
	else
		texture_top = "bushes_bush_top.png"
		texture_bottom = "bushes_bush_bottom.png"
	end

	minetest.register_node("default:" .. bush_name .. "_bush", {
		description = S(desc.." Bush"),
		drawtype = "mesh",
		mesh = "bushes_bush.obj",
		tiles = {"bushes_bush_"..bush_name..".png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		groups = groups,
		sounds = default.node_sound_leaves_defaults(),
		drop = "",
		after_dig_node = function( pos, oldnode, oldmetadata, digger )
			return plantlife_bushes.after_dig_node(pos, oldnode, oldmetadata, digger);
		end,
		after_place_node = function( pos, placer, itemstack )
			return plantlife_bushes.after_place_node(pos, placer, itemstack);
		end,
	})

	-- do not spawn fruitless bushes
	if bush_name ~= "fruitless" then
		table.insert(default.spawn_list, "default:"..bush_name.."_bush")
	end
end

minetest.register_node("default:basket_empty", {
    description = S("Basket"),
	drawtype = "mesh",
	mesh = "bushes_basket_empty.obj",
	tiles = { "bushes_basket.png" },
	paramtype = "light",
	paramtype2 = "facedir",
    groups = { dig_immediate = 3 },
})





--[[
strawberry: http://www.clker.com/clipart-4060.html
blueberry: http://www.clker.com/clipart-cerezafiro12.html
blackberry:  http://www.clker.com/clipart-blackberry-2.html
raspberry: http://www.clker.com/clipart-simple-raspberry.html
gooseberry:  http://www.clker.com/clipart-26281.html


]]