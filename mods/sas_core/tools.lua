
minetest.register_alias("default:handle_short", "sas_core:handle_short")
minetest.register_alias("default:handle_medium", "sas_core:handle_medium")
minetest.register_alias("default:handle_long", "sas_core:handle_long")
minetest.register_alias("default:handle_stock", "sas_core:handle_stock")
minetest.register_alias("default:tool_hand_axe", "sas_core:tool_hand_axe")
minetest.register_alias("default:tool_hammer", "sas_core:tool_hammer")
minetest.register_alias("default:tool_climbing_pick", "sas_core:tool_climbing_pick")

minetest.register_alias("default:tool_pick_stone", "sas_core:tool_pick_stone")
minetest.register_alias("default:tool_pick_steel", "sas_core:tool_pick_steel")
minetest.register_alias("default:tool_pick_iron", "sas_core:tool_pick_iron")
minetest.register_alias("default:tool_pick_redhot_iron", "sas_core:tool_pick_redhot_iron")
minetest.register_alias("default:tool_pick_hardened_steel", "sas_core:tool_pick_hardened_steel")

minetest.register_alias("default:tool_shovel_stone", "sas_core:tool_shovel_stone")
minetest.register_alias("default:tool_shovel_steel", "sas_core:tool_shovel_steel")
minetest.register_alias("default:tool_shovel_iron", "sas_core:tool_shovel_iron")
minetest.register_alias("default:tool_shovel_redhot_iron", "sas_core:tool_shovel_redhot_iron")
minetest.register_alias("default:tool_shovel_hardened_steel", "sas_core:tool_shovel_hardened_steel")

minetest.register_alias("default:tool_axe_stone", "sas_core:tool_axe_stone")
minetest.register_alias("default:tool_axe_steel", "sas_core:tool_axe_steel")
minetest.register_alias("default:tool_axe_iron", "sas_core:tool_axe_iron")
minetest.register_alias("default:tool_axe_redhot_iron", "sas_core:tool_axe_redhot_iron")
minetest.register_alias("default:tool_axe_hardened_steel", "sas_core:tool_axe_hardened_steel")

minetest.register_alias("default:tool_sword_stone", "sas_core:tool_sword_stone")
minetest.register_alias("default:tool_sword_steel", "sas_core:tool_sword_steel")
minetest.register_alias("default:tool_sword_iron", "sas_core:tool_sword_iron")
minetest.register_alias("default:tool_sword_redhot_iron", "sas_core:tool_sword_redhot_iron")
minetest.register_alias("default:tool_sword_hardened_steel", "sas_core:tool_sword_hardened_steel")

minetest.register_alias("default:tool_tree_pruning_shears", "sas_core:tool_tree_pruning_shears")

-- mods/default/tools.lua


--[[
--try to remove default tools
minetest.register_alias("default:pick_wood", "sas_core:tool_pick_stone")
minetest.register_alias("default:shovel_wood", "sas_core:tool_shovel_stone")
minetest.register_alias("default:axe_wood", "sas_core:tool_axe_stone")
minetest.register_alias("default:sword_wood", "sas_core:tool_sword_stone")
--
minetest.register_alias("default:pick_stone", "sas_core:tool_pick_stone")
minetest.register_alias("default:shovel_stone", "sas_core:tool_shovel_stone")
minetest.register_alias("default:axe_stone", "sas_core:tool_axe_stone")
minetest.register_alias("default:sword_stone", "sas_core:tool_sword_stone")
--
minetest.register_alias("default:pick_bronze", "sas_core:tool_pick_iron")
minetest.register_alias("default:shovel_bronze", "sas_core:tool_shovel_iron")
minetest.register_alias("default:axe_bronze", "sas_core:tool_axe_iron")
minetest.register_alias("default:sword_bronze", "sas_core:tool_sword_iron")
--
minetest.register_alias("default:pick_steel", "sas_core:tool_pick_steel")
minetest.register_alias("default:shovel_steel", "sas_core:tool_shovel_steel")
minetest.register_alias("default:axe_steel", "sas_core:tool_axe_steel")
minetest.register_alias("default:sword_steel", "sas_core:tool_sword_steel")
--
minetest.register_alias("default:pick_mese", "sas_core:tool_pick_redhot_iron")
minetest.register_alias("default:shovel_mese", "sas_core:tool_sredhot_iron")
minetest.register_alias("default:axe_mese", "sas_core:tool_redhot_iron")
minetest.register_alias("default:sword_mese", "sas_core:tool_sredhot_iron")
--
minetest.register_alias("default:pick_diamond", "sas_core:tool_pick_hardened_steel")
minetest.register_alias("default:shovel_diamond", "sas_core:tool_shovel_hardened_steel")
minetest.register_alias("default:axe_diamond", "sas_core:tool_axe_hardened_steel")
minetest.register_alias("default:sword_diamond", "sas_core:tool_sword_hardened_steel")
]]




--  https://forum.minetest.net/viewtopic.php?f=47&t=14568
--To remove recipie

minetest.register_tool(":default:pick_wood", {})
minetest.register_tool(":default:shovel_woodd", {})
minetest.register_tool(":default:axe_wood", {})
minetest.register_tool(":default:sword_wood", {})

minetest.register_tool(":default:pick_stone", {})
minetest.register_tool(":default:shovel_stone", {})
minetest.register_tool(":default:axe_stone", {})
minetest.register_tool(":default:sword_stone", {})

minetest.register_tool(":default:pick_bronze", {})
minetest.register_tool(":default:shovel_bronze", {})
minetest.register_tool(":default:axe_bronze", {})
minetest.register_tool(":default:sword_bronze", {})

minetest.register_tool(":default:pick_steel", {})
minetest.register_tool(":default:shovel_steel", {})
minetest.register_tool(":default:axe_steel", {})
minetest.register_tool(":default:sword_steel", {})

minetest.register_tool(":default:pick_mese", {})
minetest.register_tool(":default:shovel_mese", {})
minetest.register_tool(":default:axe_mese", {})
minetest.register_tool(":default:sword_mese", {})

minetest.register_tool(":default:pick_diamond", {})
minetest.register_tool(":default:shovel_diamond", {})
minetest.register_tool(":default:axe_diamond", {})
minetest.register_tool(":default:sword_diamond", {})

--  https://forum.minetest.net/viewtopic.php?f=47&t=18605
--minetest.clear_craft({output = "mod_name:node_name"})
--minetest.register_craft({
--   output = "mod_name:node_name",
--   recipe = {
 --     {new recipe},
 --  }
--})

--[[
minetest.clear_craft({output = "default:pick_diamond"})    --does not remove

minetest.register_craft({                                   --does not override
   output = "default:pick_diamond",
   recipe = {
      {'', '', ''},
      {'', '', ''},
      {'', '', ''},
   
   }
})

--another
minetest.override_item("mod_name:node_name", {
   recipe = {
      {"default:gold", "default:silver",},
   }
})


minetest.override_item("default:pick_diamond", {           --does not override
   recipe = {
      {},
   }
})

--onward
minetest.clear_craft(recipe)
minetest.register_craft({craft_recipe})

minetest.clear_craft( 
{
   output = "default:pick_diamond",
   recipe = {
      {'default:diamond', 'default:diamond', 'default:diamond'},
      {'', 'group:stick', ''},
      {'', 'group:stick', ''},
   
   }
})

minetest.clear_craft( 
{
   output = "default:pick_diamond",

})


--nope


--greendiamond method:
minetest.register_craft({
   output = "mod_name:node_name 0",
   recipe = {
      {original recipe},
   }
})

minetest.register_craft({
   output = "mod_name:node_name",
   recipe = {
      {new recipe},
   }
})


minetest.register_craft({
   output = "default:pick_diamond 0",
   recipe = {
      {'default:diamond', 'default:diamond', 'default:diamond'},
      {'', 'group:stick', ''},
      {'', 'group:stick', ''},
   
   }
})

minetest.register_craft({
   output = "default:pick_diamond",
   recipe = {
      {'', '', ''},
      {'', '', ''},
      {'', '', ''},
   }
})
]]



-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=3.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=16.70, [3]=3.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})
--[[
-- mods/default/tools.lua

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})
]]
--handles
minetest.register_craftitem("sas_core:handle_short", {
	description = "Handle for Sword",
	inventory_image = "default_handle_short.png",
	groups = { flammable = 2},
})
minetest.register_craftitem("sas_core:handle_medium", {
	description = "Handle for Axe",
	inventory_image = "default_handle_medium.png",
	groups = {flammable = 2},
})
minetest.register_craftitem("sas_core:handle_long", {
	description = "Handle for Shovel and Pickaxe",
	inventory_image = "default_handle_long.png",
	groups = {flammable = 2},
})
minetest.register_craftitem("sas_core:handle_stock", {
	description = "Handle for Crossbow and Musket",
	inventory_image = "default_handle_stock.png^[makealpha:255,255,255",
	groups = { flammable = 2},
})

--stone hand tools
minetest.register_tool("sas_core:tool_hand_axe", {
	description = "Small Rocks Hand Axe",
	inventory_image = "reedmace4.png^vmg_small_rocks.png",
	tool_capabilities = {
		full_punch_interval = 5.8,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=26.00, [2]=24.00, [3]=22.60}, uses=4, maxlevel=1},
			cracky={times={[2]=64.00, [3]=42.60}, uses=2, maxlevel=1},
		},
		damage_groups = {fleshy=1},
	},
	sound = {breaks = "default_tool_breaks"},
})


--A N V I L   H A M M E R--
minetest.register_tool("sas_core:tool_hammer", {
        description = "Steel hammer for repairing tools on the anvil",
        image           = "glooptest_tool_steelhammer.png",
        inventory_image = "glooptest_tool_steelhammer.png",
        tool_capabilities = {
            full_punch_interval = 0.8,
            max_drop_level=1,
            groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
            cracky={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
            },
            damage_groups = {fleshy=6},
        }
})


--H A N D H O L D S   H A M M E R--
minetest.register_tool("sas_core:tool_climbing_pick", {
	description = "Climbing Pick",
	inventory_image = "handholds_tool.png^[colorize:red:75",
	sound = {breaks = "default_tool_breaks"},
	on_use = function(itemstack, player, pointed_thing)
		if not pointed_thing or 
				pointed_thing.type ~= "node" or 
				minetest.is_protected(pointed_thing.under, player:get_player_name()) or
				minetest.is_protected(pointed_thing.above, player:get_player_name()) or
				pointed_thing.under.y + 1 == pointed_thing.above.y or
				pointed_thing.under.y - 1 == pointed_thing.above.y then
			return
		end

		local node_def = 
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name]
		if not node_def or not node_def.buildable_to then
			return
		end

		local node_name = minetest.get_node(pointed_thing.under).name
		local rotation = minetest.dir_to_facedir(
			vector.subtract(pointed_thing.under, pointed_thing.above))

		if node_name == "default:stone" then
			minetest.set_node(pointed_thing.under,
				{name = "sas_core:hstone", param2 = rotation})
		elseif node_name == "default:desert_stone" then
			minetest.set_node(pointed_thing.under,
				{name = "sas_core:hdesert_stone", param2 = rotation})
		elseif node_name == "default:sandstone" then
			minetest.set_node(pointed_thing.under,
				{name = "sas_core:hsandstone", param2 = rotation})
		elseif node_name == "default:ice" then
			minetest.set_node(pointed_thing.under,
				{name = "sas_core:hice", param2 = rotation})
		else
			return
		end

		minetest.set_node(pointed_thing.above, {name = "sas_core:climbable_air"})
		minetest.sound_play(
			"default_dig_cracky",
			{pos = pointed_thing.above, gain = 0.5, max_hear_distance = 8}
		)

		if not minetest.setting_getbool("creative_mode") then
			local wdef = itemstack:get_definition()
			itemstack:add_wear(256)
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks,
					{pos = pointed_thing.above, gain = 0.5})
			end
			return itemstack
		end
	end
})


--P I C K S--
minetest.register_tool("sas_core:tool_pick_stone", {
	description = "Stone Pickaxe",
	inventory_image = "default_tool_stonepick.png",
	tool_capabilities = {
		full_punch_interval = 3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=10.0, [3]=5.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_pick_steel", {
	description = "Steel Pickaxe",
	inventory_image = "default_tool_steelpick.png",
	tool_capabilities = {
		full_punch_interval = 2.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=6.00, [2]=4.60, [3]=2.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})


minetest.register_tool("sas_core:tool_pick_iron", {
	description = "Wrought Iron Pickaxe",
	inventory_image = "default_tool_wrought_ironpick.png",
	tool_capabilities = {
		full_punch_interval = 2.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=6.00, [2]=4.60, [3]=2.80}, uses=9, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_pick_redhot_iron", {
	description = "Redhot Steel Pickaxe",
	inventory_image = "default_tool_redhot_ironpick.png",
	tool_capabilities = {
		full_punch_interval = 2.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=2, maxlevel=1},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_pick_hardened_steel", {
	description = "Hardened Steel Pickaxe",
	inventory_image = "default_tool_hardened_steelpick.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

--S H O V E L S--
minetest.register_tool("sas_core:tool_shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "default_tool_stoneshovel.png",
	wield_image = "default_tool_stoneshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[2]=10.0, [3]=5.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_shovel_steel", {
	description = "Steel Shovel",
	inventory_image = "default_tool_steelshovel.png",
	wield_image = "default_tool_steelshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=6.00, [2]=4.60, [3]=2.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_shovel_iron", {
	description = "Wrought Iron Shovel",
	inventory_image = "default_tool_wrought_ironshovel.png",
	wield_image = "default_tool_wrought_ironshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=6.00, [2]=4.60, [3]=2.80}, uses=9, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_shovel_redhot_iron", {
	description = "Redhot Steel Shovel",
	inventory_image = "default_tool_redhot_ironshovel.png",
	wield_image = "default_tool_redhot_ironshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=2, maxlevel=1},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_shovel_hardened_steel", {
	description = "Hardened Steel Shovel",
	inventory_image = "default_tool_hardened_steelshovel.png",
	wield_image = "default_tool_hardened_steelshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

--A X E S--
minetest.register_tool("sas_core:tool_axe_stone", {
	description = "Stone Axe",
	inventory_image = "default_tool_stoneaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=15.00, [2]=10.00, [3]=5.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_axe_steel", {
	description = "Steel Axe",
	inventory_image = "default_tool_steelaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=5.50, [2]=4.40, [3]=1.00}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_axe_iron", {
	description = "Wrought Iron Axe",
	inventory_image = "default_tool_wrought_ironaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=5.50, [2]=4.40, [3]=1.00}, uses=9, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_axe_redhot_iron", {
	description = "Redhot Steel Axe",
	inventory_image = "default_tool_redhot_ironaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=2, maxlevel=1},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_axe_hardened_steel", {
	description = "Hardened Steel Axe",
	inventory_image = "default_tool_hardened_steelaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

--S W O R D S--
minetest.register_tool("sas_core:tool_sword_stone", {
	description = "Stone Sword",
	inventory_image = "default_tool_stonesword.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=2.4, [3]=1.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_sword_steel", {
	description = "Steel Sword",
	inventory_image = "default_tool_steelsword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_sword_iron", {
	description = "Wrought Iron Sword",
	inventory_image = "default_tool_wrought_ironsword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=12, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_sword_redhot_iron", {
	description = "Redhot Steel Sword",
	inventory_image = "default_tool_redhot_ironsword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=2, maxlevel=1},
		},
		damage_groups = {fleshy=12},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sas_core:tool_sword_hardened_steel", {
	description = "Hardened Steel Sword",
	inventory_image = "default_tool_hardened_steelsword.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

--
-- Crafting (tool repair)
--
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

-- Lava Pick (digs and smelts at same time)
local old_handle_node_drops = minetest.handle_node_drops
function minetest.handle_node_drops(pos, drops, digger)
	-- are we holding redhot Pick?
	if digger:get_wielded_item():get_name() ~= ("sas_core:tool_pick_redhot_iron") then
		return old_handle_node_drops(pos, drops, digger)
	end
	if digger:get_wielded_item():get_name() ~= ("sas_core:tool_axe_redhot_iron") then
		return old_handle_node_drops(pos, drops, digger)
	end
	if digger:get_wielded_item():get_name() ~= ("sas_core:tool_shovel_redhot_iron") then
		return old_handle_node_drops(pos, drops, digger)
	end
	if digger:get_wielded_item():get_name() ~= ("sas_core:tool_sword_redhot_iron") then
		return old_handle_node_drops(pos, drops, digger)
	end
	-- reset new smelted drops
	local hot_drops = {}
	-- loop through current node drops
	for _, drop in pairs(drops) do
		-- get cooked output of current drops
		local stack = ItemStack(drop)
		local output = minetest.get_craft_result({
			method = "cooking",
			width = 1,
			items = {drop}
		})
		-- if we have cooked result then add to new list
		if output
		and output.item
		and not output.item:is_empty() then
			table.insert(hot_drops,
				ItemStack({
					name = output.item:get_name(),
					count = output.item:to_table().count,
				})
			)
		else -- if not then return normal drops
			table.insert(hot_drops, stack)
		end
	end
	return old_handle_node_drops(pos, hot_drops, digger)
end



-----------------------------------------------------------------------------------------------
-- tool_tree_pruning_shears
-----------------------------------------------------------------------------------------------
local function pruning_shears_can_break(pos, deff, player)
	local def = ItemStack({name=deff.name}):get_definition()

	if not def.diggable or (def.can_dig and not def.can_dig(pos,player)) then
		minetest.log("info", player:get_player_name() .. " tried to prune or shear a tree "
		.. def.name .. " which is not diggable "
		.. minetest.pos_to_string(pos))
		return
	end

	if minetest.is_protected(pos, player:get_player_name()) then
		minetest.log("action", player:get_player_name()
			.. " tried to prune " .. def.name
			.. " at protected position "
			.. minetest.pos_to_string(pos))
		minetest.record_protection_violation(pos, player:get_player_name())
		return
	end

	return true
end
-- turns nodes with group flora=1 & flower=0 into cut grass
local function pruning_shears_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local above_pos = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(above_pos)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	if not pruning_shears_can_break(pt.under, under, user) then
		return
	end
	-- check if something that can be cut using fine tools
	if minetest.get_item_group(under.name, "snappy") > 0 then
		-- check if leaves
		if minetest.get_item_group(under.name, "leaves") == 1 then
 
		minetest.node_dig(pt.under, under, user) 
		minetest.add_item(pt.under, under, user, ItemStack("default:leaves"))
		end
		
		minetest.sound_play("default_dig_crumbly", {
			pos = pt.under,
			gain = 0.5,
		})
		itemstack:add_wear(65535/(uses-1))
		return itemstack

	end
end
-- the tool
minetest.register_tool("sas_core:tool_tree_pruning_shears", {
	description = "Pruning Shears -Used for quick collecting of leaves-",
	inventory_image = "default_tool_tree_pruning_shears.png^[makealpha:255,255,255",
		tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=15.00, [2]=10.00, [3]=5.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	on_use = function(itemstack, user, pointed_thing)
		return pruning_shears_on_use(itemstack, user, pointed_thing, 320)
	end,

})

