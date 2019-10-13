--===========================
--===========================
--S M E L T I N G ==> M O V E D TO B L O O M E R Y--
--===========================
--===========================
--[[
minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:iron_bloom',
	output = 'sas_core:steel_ingot',
	cooktime = 60,
})
]]
minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:iron_bloom_material',
	output = 'sas_core:iron_bloom',
	cooktime = 60,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'default:steel_ingot',
	output = 'sas_core:redhot_steel_ingot',
	cooktime = 60,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'group:sand',
	output = 'default:glass',
	cooktime = 6,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'bucket:bucket_metal_nuggets',
	output = 'bucket:bucket_metal_molten',
	cooktime = 455,
})



minetest.register_craft({
	type = 'cooking',
	recipe = 'default:copper_lump',
	output = 'sas_core:orangehot_copper_ingot',
	cooktime = 60,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'default:copper_ingot',
	output = 'sas_core:orangehot_copper_ingot',
	cooktime = 60,
})


--[[
minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:mold_hinge',
	output = 'sas_core:redhot_mold_hinge',
	cooktime = 15,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:mold_pick_head',
	output = 'sas_core:redhot_mold_pick_head',
	cooktime = 195,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:mold_axe_head',
	output = 'sas_core:redhot_mold_axe_head',
	cooktime = 155,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:mold_shovel_head',
	output = 'sas_core:redhot_mold_shovel_head',
	cooktime = 145,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:mold_sword_head',
	output = 'sas_core:redhot_mold_sword_head',
	cooktime = 135,
})
]]
minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:steel_bar',
	output = 'sas_core:redhot_steel_bar',
	cooktime = 15,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:copper_bar',
	output = 'sas_core:orangehot_copper_bar',
	cooktime = 7,
})


minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:steel_battleaxe_head',
	output = 'sas_core:redhot_steel_battleaxe_head',
	cooktime = 65,
})

--musket
minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:steel_barrel_musket',
	output = 'sas_core:redhot_steel_barrel_musket',
	cooktime = 65,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:steel_barrel_long',
	output = 'sas_core:redhot_steel_barrel_long',
	cooktime = 55,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:steel_barrel_medium',
	output = 'sas_core:redhot_steel_barrel_medium',
	cooktime = 45,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'sas_core:steel_barrel_short',
	output = 'sas_core:redhot_steel_barrel_short',
	cooktime = 35,
})







--===========================
--===========================
--TIMER ABM'S
--===========================
--===========================
--M O L T E N--
minetest.register_abm({
	nodenames = {"sas_core:metal_molten_source","stairs:slab_redhot_steelblock"},
	interval = 12.0,
	chance = 1,
	drop = "default:steel_ingot 4",
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Molten Steel just cooled, craft some ingots now.")
			hacky_swap_node(pos,"stairs:slab_redhot_steelblock")
			return
	end,
})


--S W A G E   B L O C K----
minetest.register_abm({
	nodenames = {"sas_core:redhot_mold_swage_block","sas_core:iron_mold_swage_block"},
	interval = 60.0,
	chance = 1,
	on_rightclick = function(pos, node, clicker)
			minetest.sound_play("heads_ow", {
			pos = ppos,
			max_hear_distance = 10,
			gain = 10.0,
			})
			clicker:set_hp( 1)
			local holding = clicker:get_wielded_item()
			if holding:to_string() ~= "" then
				-- take stack
				local sta = holding:take_item(holding:get_count())
				clicker:set_wielded_item(holding)
				-- incase of lag, reset stack
				minetest.after(0.1, function()
					clicker:set_wielded_item(holding)
					-- drop stack
					local obj = minetest.add_item(clicker:getpos(), sta)
					obj:setvelocity({x = 0, y = 5, z = 0})
				end)
			end
		--end
	end,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Mold is cool: 350 Degrees")
			hacky_swap_node(pos,"sas_core:iron_mold_swage_block")
			return
	end,
})




--H I N G E--
--[[
minetest.register_abm({
	nodenames = {"sas_core:redhot_mold_hinge","sas_core:iron_mold_hinge"},
	interval = 12.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Mold is cool: 350 Degrees")
			hacky_swap_node(pos,"sas_core:iron_mold_hinge")
			return
	end,
})
]]
--C O O L   D O W N--
minetest.register_craft({
	output = 'default:steel_ingot',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"}},
	recipe = {
		{'sas_core:redhot_steel_ingot', 'bucket:bucket_water','sas_core:tool_steel_tongs'},
	}
})

minetest.register_craft({
	output = 'default:copper_ingot',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"}},
	recipe = {
		{'sas_core:orangehot_copper_ingot', 'bucket:bucket_water','sas_core:tool_steel_tongs'},
	}
})



--P I C K   H E A D--
minetest.register_abm({
	nodenames = {"sas_core:redhot_mold_pick_head","sas_core:wrought_mold_pick_head"},
	interval = 12.0,
	chance = 1,
	on_rightclick = function(pos, node, clicker)
			minetest.sound_play("heads_ow", {
			pos = ppos,
			max_hear_distance = 10,
			gain = 10.0,
			})
			clicker:set_hp( 1)
			local holding = clicker:get_wielded_item()
			if holding:to_string() ~= "" then
				-- take stack
				local sta = holding:take_item(holding:get_count())
				clicker:set_wielded_item(holding)
				-- incase of lag, reset stack
				minetest.after(0.1, function()
					clicker:set_wielded_item(holding)
					-- drop stack
					local obj = minetest.add_item(clicker:getpos(), sta)
					obj:setvelocity({x = 0, y = 5, z = 0})
				end)
			end
		--end
	end,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Mold is cool: 350 Degrees")
			hacky_swap_node(pos,"sas_core:wrought_mold_pick_head")
			return
	end,
})
--[[
minetest.register_craft({
	output = 'sas_core:redhot_pick_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_pick_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_pick_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_pick_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:redhot_pick_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:redhot_mold_pick_head', 'sas_core:tool_climbing_pick'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_pick_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:wrought_mold_pick_head', 'sas_core:tool_climbing_pick'},
	}
})
]]
minetest.register_craft({
	output = 'sas_core:redhot_pick_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_pick_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:iron_pick_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_pick_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})






--A X E   H E A D--
minetest.register_abm({
	nodenames = {"sas_core:redhot_mold_axe_head","sas_core:wrought_mold_axe_head"},
	interval = 12.0,
	chance = 1,
	on_rightclick = function(pos, node, clicker)
			minetest.sound_play("heads_ow", {
			pos = ppos,
			max_hear_distance = 10,
			gain = 10.0,
			})
			clicker:set_hp( 1)
			local holding = clicker:get_wielded_item()
			if holding:to_string() ~= "" then
				-- take stack
				local sta = holding:take_item(holding:get_count())
				clicker:set_wielded_item(holding)
				-- incase of lag, reset stack
				minetest.after(0.1, function()
					clicker:set_wielded_item(holding)
					-- drop stack
					local obj = minetest.add_item(clicker:getpos(), sta)
					obj:setvelocity({x = 0, y = 5, z = 0})
				end)
			end
		--end
	end,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Mold is cool: 350 Degrees")
			hacky_swap_node(pos,"sas_core:wrought_mold_axe_head")
			return
	end,
})
--[[
minetest.register_craft({
	output = 'sas_core:redhot_axe_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_axe_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_axe_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_axe_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:redhot_axe_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:redhot_mold_axe_head', 'sas_core:tool_climbing_pick'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_axe_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:wrought_mold_axe_head', 'sas_core:tool_climbing_pick'},
	}
})
]]
minetest.register_craft({
	output = 'sas_core:redhot_axe_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_axe_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:iron_axe_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_axe_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})


--S H O V E L   H E A D--
minetest.register_abm({
	nodenames = {"sas_core:redhot_mold_shovel_head","sas_core:wrought_mold_shovel_head"},
	interval = 12.0,
	chance = 1,
	on_rightclick = function(pos, node, clicker)
			minetest.sound_play("heads_ow", {
			pos = ppos,
			max_hear_distance = 10,
			gain = 10.0,
			})
			clicker:set_hp( 1)
			local holding = clicker:get_wielded_item()
			if holding:to_string() ~= "" then
				-- take stack
				local sta = holding:take_item(holding:get_count())
				clicker:set_wielded_item(holding)
				-- incase of lag, reset stack
				minetest.after(0.1, function()
					clicker:set_wielded_item(holding)
					-- drop stack
					local obj = minetest.add_item(clicker:getpos(), sta)
					obj:setvelocity({x = 0, y = 5, z = 0})
				end)
			end
		--end
	end,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Mold is cool: 350 Degrees")
			hacky_swap_node(pos,"sas_core:wrought_mold_shovel_head")
			return
	end,
})
--[[
minetest.register_craft({
	output = 'sas_core:redhot_shovel_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_shovel_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_shovel_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_shovel_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:redhot_shovel_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:redhot_mold_shovel_head', 'sas_core:tool_climbing_pick'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_shovel_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:wrought_mold_shovel_head', 'sas_core:tool_climbing_pick'},
	}
})
]]
minetest.register_craft({
	output = 'sas_core:redhot_shovel_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_shovel_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:iron_shovel_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_shovel_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})


--S W O R D   H E A D--
minetest.register_abm({
	nodenames = {"sas_core:redhot_mold_sword_head","sas_core:wrought_mold_sword_head"},
	interval = 12.0,
	chance = 1,
	on_rightclick = function(pos, node, clicker)
			minetest.sound_play("heads_ow", {
			pos = ppos,
			max_hear_distance = 10,
			gain = 10.0,
			})
			clicker:set_hp( 1)
			local holding = clicker:get_wielded_item()
			if holding:to_string() ~= "" then
				-- take stack
				local sta = holding:take_item(holding:get_count())
				clicker:set_wielded_item(holding)
				-- incase of lag, reset stack
				minetest.after(0.1, function()
					clicker:set_wielded_item(holding)
					-- drop stack
					local obj = minetest.add_item(clicker:getpos(), sta)
					obj:setvelocity({x = 0, y = 5, z = 0})
				end)
			end
		--end
	end,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Mold is cool: 350 Degrees")
			hacky_swap_node(pos,"sas_core:wrought_mold_sword_head")
			return
	end,
})
--[[
minetest.register_craft({
	output = 'sas_core:redhot_sword_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_sword_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_sword_head 3',
	replacements = {{"sas_core:tool_hammer", "sas_core:tool_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_sword_head', 'sas_core:tool_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:redhot_sword_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:redhot_mold_sword_head', 'sas_core:tool_climbing_pick'},
	}
})
minetest.register_craft({
	output = 'sas_core:wrought_sword_head 3',
	replacements = {{"sas_core:tool_climbing_pick", "sas_core:tool_climbing_pick"}},
	recipe = {

		{'sas_core:wrought_mold_sword_head', 'sas_core:tool_climbing_pick'},
	}
})
]]
minetest.register_craft({
	output = 'sas_core:redhot_sword_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:redhot_mold_sword_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})
minetest.register_craft({
	output = 'sas_core:iron_sword_head 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {

		{'sas_core:wrought_mold_sword_head', 'sas_core:tool_gravel_sieve_hammer'},
	}
})

