--[[

Copyright (C) 2015 - Auke Kok <sofar@foo-projects.org>

"crops" is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1
of the license, or (at your option) any later version.

--]]

-- Intllib
local S = farming.intllib

minetest.register_tool("farming:watering_can", {
	description = S("Watering Can"),
	inventory_image = "crops_watering_can.png^[colorize:orange:175",
	liquids_pointable = true,
	range = 2.5,
	stack_max = 1,
	wear = 65535,
	tool_capabilities = {},
	on_use = function(itemstack, user, pointed_thing)
		local pos = pointed_thing.under
		local ppos = pos
		if not pos then
			return itemstack
		end
		-- filling it up?
		local wear = itemstack:get_wear()
		if minetest.get_item_group(minetest.get_node(pos).name, "water") >= 3 then
			if wear ~= 1 then
				minetest.sound_play("crops_watercan_entering", {pos=pos, gain=0.8})
				minetest.after(math.random()/2, function(p)
					if math.random(2) == 1 then
						minetest.sound_play("crops_watercan_splash_quiet", {pos=p, gain=0.1})
					end
					if math.random(3) == 1 then
						minetest.after(math.random()/2, function(pp)
							minetest.sound_play("crops_watercan_splash_small", {pos=pp, gain=0.7})
						end, p)
					end
					if math.random(3) == 1 then
						minetest.after(math.random()/2, function(pp)
							minetest.sound_play("crops_watercan_splash_big", {pos=pp, gain=0.7})
						end, p)
					end
				end, pos)
				itemstack:set_wear(1)
			end
			return itemstack
		end
		-- using it on a top-half part of a plant?
		local meta = minetest.get_meta(pos)
		if meta:get_int("crops_top_half") == 1 then
			meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		end
		-- using it on a plant?
		local water = meta:get_int("crops_water")
		if water < 1 then
			return itemstack
		end
		-- empty?
		if wear == 65534 then
			return itemstack
		end
		farming.particles(ppos, 2)
		minetest.sound_play("crops_watercan_watering", {pos=pos, gain=0.8})
		water = math.min(water + farming.settings.watercan, farming.settings.watercan_max)
		meta:set_int("crops_water", water)

		if not minetest.setting_getbool("creative_mode") then
			itemstack:set_wear(math.min(65534, wear + (65535 / farming.settings.watercan_uses)))
		end
		return itemstack
	end,
})

minetest.register_tool("farming:hydrometer", {
	description = S("Hydrometer"),
	inventory_image = "crops_hydrometer.png",
	liquids_pointable = false,
	range = 2.5,
	stack_max = 1,
	tool_capabilities = {
	},
	on_use = function(itemstack, user, pointed_thing)
		local pos = pointed_thing.under
		if not pos then
			return itemstack
		end
		-- doublesize plant?
		local meta = minetest.get_meta(pos)
		if meta:get_int("crops_top_half") == 1 then
			meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		end

		-- using it on a plant?
		local water = meta:get_int("crops_water")
		if water == nil then
			itemstack:set_wear(65534)
			return itemstack
		end
		itemstack:set_wear(65535 - ((65534 / 100) * water))
		return itemstack
	end,
})

minetest.register_craft({
	output = "farming:watering_can",
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"},{"sas_core:tool_steel_mandrel", "sas_core:tool_steel_mandrel"}},
	recipe = {
		{ "sas_core:copper_bar", "sas_core:tool_steel_tongs", "sas_core:tool_gravel_sieve_hammer" },
		{ "sas_core:copper_plate", "sas_core:tool_anvil", "sas_core:copper_plate" },
		{ "sas_core:tool_steel_mandrel", "sas_core:copper_plate", "sas_core:orangehot_copper_ribbon" },
	},
})

minetest.register_craft({
	output = "farming:hydrometer",
	recipe = {
		{ "default:copper_ingot", "sas_core:glue", "" },
		{ "", "sas_core:copper_bar", "sas_core:glue" },
		{ "", "", "vessels:glass_bottle" },
	},
})
