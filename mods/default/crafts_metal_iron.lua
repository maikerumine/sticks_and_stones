minetest.register_alias("default:redhot_steel_slab", "stairs:slab_redhot_steelblock")



--M E T A L C R A F T--
minetest.register_craftitem("default:iron_lump", {
	description = "Iron Lump  --Craft with charcoal to make smeltable Iron bloom material",
	inventory_image = "default_iron_lump.png",
})

minetest.register_craftitem("default:iron_bloom_material", {
	description = "Iron bloom material  --Smelt in Bloomery to make iron bloom",
	inventory_image = "default_iron_bloom_material.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:iron_bloom", {
	description = "Iron bloom  --Smelt in Bloomery to make steel ingot",
	inventory_image = "default_iron_bloom.png",
})

minetest.register_craftitem("default:steel_nugget", {
	description = "Steel Nugget  --Use to make smaller metal crafts like musket ball or to forge into ingots",
	inventory_image = "default_steel_nugget.png",
})

minetest.register_craftitem("default:steel_ingot", {
	description = "Steel Ingot  --Smelt in Bloomery to make redhot steel ingots or break into nuggets",
	inventory_image = "default_steel_ingot.png",
})

minetest.register_craftitem("default:redhot_steel_ingot", {
	description = "Redhot Steel Ingot  --Smelt Steel ingot in Bloomery to make redhot steel ingot to use for making thin metals like armor and doors or bar stock for forging tools",
	inventory_image = "default_steel_ingot.png^[colorize:red:175",
})

--[[
minetest.register_craftitem("default:slab_redhot_steel_slab", {
	description = "Redhot Steel Slab  --Smelt steel slab in Bloomery to make redhot steel slab to use for making thick metals like swage block and anvil",
	inventory_image = "default_steel_block.png^[colorize:red:175",
})
]]
minetest.register_craftitem("default:steel_bar", {
	description = "Steel Bar Stock  --Use to make metals like chains, bars, and swords",
	inventory_image = "default_steel_bar.png^[colorize:black:175",
})

minetest.register_craftitem("default:redhot_steel_bar", {
	description = "Redhot Steel Bar Stock  --Use to make metals like hardware",
	inventory_image = "default_steel_bar.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:redhot_steel_ribbon", {
	description = "Redhot Steel Ribbon Stock  --Use to make thin metals like ribbons and gun barrels",
	inventory_image = "default_steel_ribbon.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:redhot_steel_plate", {
	description = "Redhot Steel Flat Plate Stock  --Use to make metals like armor and doors",
	inventory_image = "ores_copper_sheet.png^[colorize:red:175",
})

minetest.register_craftitem("default:steel_plate", {
	description = "Steel Flat Plate Stock  --Use to make metals like armor and doors",
	inventory_image = "ores_copper_sheet.png^[colorize:black:175",
})

minetest.register_craftitem("default:iron_hinge", {
	description = "Iron Hinge  --Craft redhot steel with swage, anvil, and hammer to make 2 hinges",
	inventory_image = "default_wrought_component_hinge.png",
})

minetest.register_craftitem("default:iron_hardware", {
	description = "Iron Hardware  --Craft with Redhot bars to make a bunch of Nuts and Bolts",
	inventory_image = "default_hardware.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_spring_heavy", {
	description = "Heavy Duty Spring  --For fabricating crossbows and other strong sprung contraptions",
	inventory_image = "default_spring_heavy.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_spring_light", {
	description = "Small Spring  --For fabricating small mechanical apparati",
	inventory_image = "default_spring_light.png^[makealpha:255,255,255",
})

--saw
minetest.register_craftitem("default:tool_steel_saw", {
	description = "Steel Saw  --For cutting trees into wooden planks",
	inventory_image = "default_tool_saw.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_saw_blade", {
	description = "Steel Saw Blade  --For making the saw for cutting trees into wooden planks",
	inventory_image = "default_steel_saw_blade.png^[makealpha:255,255,255",
})



--mandrel
minetest.register_craftitem("default:tool_steel_mandrel", {
	description = "Mandrel  --For fabricating the Musket gun barrel components",
	inventory_image = "default_mandrel.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:redhot_tool_steel_mandrel", {
	description = "Redhot Mandrel  --For fabricating the Musket gun barrel components",
	inventory_image = "default_mandrel.png^[makealpha:255,255,255^[colorize:red:175",
})

--foundary tongs
minetest.register_craftitem("default:tool_steel_tongs", {
	description = "Foundary Tongs  --For holding most of your metal work in crafting guide",
	inventory_image = "default_tongs.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:tool_steel_tong", {
	description = "Foundary Tong  --Craft two and assemble on anvil with hardware to make complete foundary tongs",
	inventory_image = "default_tong.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:tool_redhot_steel_tong", {
	description = "Redhot Foundary Tongs  --Quench and craft another for the complete tool",
	inventory_image = "default_tong.png^[makealpha:255,255,255^[colorize:red:175",
})

--reamer
minetest.register_craftitem("default:tool_steel_reamer", {
	description = "Reamer / Boring Drill  --For boring the barrel of the musket",
	inventory_image = "default_reamer.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:tool_steel_reamer_shaft", {
	description = "Ream Shaft  --For boring the barrel of the musket",
	inventory_image = "default_reamer_shaft.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:tool_redhot_steel_reamer_shaft", {
	description = "Redhot Ream Shaft  --Quench and craft another for the complete tool",
	inventory_image = "default_reamer_shaft.png^[makealpha:255,255,255^[colorize:red:175",
})


--musket barrel
minetest.register_craftitem("default:steel_barrel_musket_reamed", {
	description = "Reamed and finished Musket Barrel  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_musket_reamed.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_barrel_musket", {
	description = "Rough Forged Musket Barrel  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_musket.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_barrel_short", {
	description = "Short Gun Barrel Piece  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_short.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_barrel_medium", {
	description = "Medium Gun Barrel Piece  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_medium.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_barrel_long", {
	description = "Long Gun Barrel Piece  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_long.png^[makealpha:255,255,255",
})
--redhot
minetest.register_craftitem("default:redhot_steel_barrel_musket", {
	description = "Redhot Rough Forged Musket Barrel  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_musket.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:redhot_steel_barrel_short", {
	description = "Redhot Short Gun Barrel Piece  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_short.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:redhot_steel_barrel_medium", {
	description = "Redhot Medium Gun Barrel Piece  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_medium.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:redhot_steel_barrel_long", {
	description = "Redhot Long Gun Barrel Piece  --For fabricating the Musket gun.  You will need special tooling for this.",
	inventory_image = "default_barrel_long.png^[makealpha:255,255,255^[colorize:red:175",
})




--H A M M E R   H E A D S--
minetest.register_craftitem("default:gravelsieve_hammer_head", {
	description = "Gravelsieve Hammer Head  --This hammer is your main crafting hammer.  Make this FIRST.",
	inventory_image = "gravelsieve_hammer_head.png^[makealpha:255,255,255",
	tiles = "gravelsieve_hammer_head.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:redhot_tool_anvil_hammer_head", {
	description = "RedHot Hammer Head  --Use another hammer to beat the redhot ingots to make component",
	inventory_image = "glooptest_tool_steelhammer_head.png^[makealpha:255,255,255^[colorize:red:175",
	tiles = "glooptest_tool_steelhammer_head.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:tool_anvil_hammer_head", {
	description = "Anvil Hammer Head  --Use another hammer to beat the redhot ingots to make component",
	inventory_image = "glooptest_tool_steelhammer_head.png^[makealpha:255,255,255",
	tiles = "glooptest_tool_steelhammer_head.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:redhot_steel_battleaxe_head", {
	description = "Redhot  Battle Axe Hammer Head  --Use another hammer to beat the redhot ingots to make component",
	inventory_image = "castle_battleaxe_head.png^[makealpha:255,255,255^[colorize:red:175",
	tiles = "castle_battleaxe_head.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:steel_battleaxe_head", {
	description = "Battle Axe Hammer Head  --Use another hammer to beat the redhot ingots to make component",
	inventory_image = "castle_battleaxe_head.png^[makealpha:255,255,255",
	tiles = "castle_battleaxe_head.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:steel_climbing_pick_head", {
	description = "Climbing Pick Hammer Head  --For making a great climbing tool",
	inventory_image = "handholds_tool_head.png^[makealpha:255,255,255^[colorize:grey:175",
	tiles = "handholds_tool_head.png^[makealpha:255,255,255^[colorize:grey:175",
})


--P I C K    H E A D S--
minetest.register_craftitem("default:redhot_pick_head", {
	description = "Red Hot iron pick head  --Use on anvil to make component",
	inventory_image = "default_tool_redhot_ironpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:iron_pick_head", {
	description = "Wrought iron pick head  --Break cooled mold to make component",
	inventory_image = "default_tool_wrought_ironpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:steel_pick_head", {
	description = "steel pick head  --Craft with and charcoal ingots make component",
	inventory_image = "default_tool_steelpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:hardened_steel_pick_head", {
	description = "hardened_steel pick head  --Quench with bucket of water to make component",
	inventory_image = "default_tool_hardened_steelpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255",
})


--A X E    H E A D S--
minetest.register_craftitem("default:redhot_axe_head", {
	description = "Red Hot iron axe head  --Use on anvil to make component",
	inventory_image = "default_tool_redhot_ironaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:iron_axe_head", {
	description = "Wrought iron axe head --Break cooled mold to make component",
	inventory_image = "default_tool_wrought_ironaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:steel_axe_head", {
	description = "steel axe head --Craft with and charcoal ingots make component",
	inventory_image = "default_tool_steelaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:hardened_steel_axe_head", {
	description = "hardened_steel axe head --Quench with bucket of water to make component",
	inventory_image = "default_tool_hardened_steelaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255",
})



--S H O V E L    H E A D S--
minetest.register_craftitem("default:redhot_shovel_head", {
	description = "Red Hot iron shovel head  --Use on anvil to make component",
	inventory_image = "default_tool_redhot_ironshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:iron_shovel_head", {
	description = "Wrought iron shovel head  --Break cooled mold to make component",
	inventory_image = "default_tool_wrought_ironshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:steel_shovel_head", {
	description = "steel shovel head --Craft with and charcoal ingots make component",
	inventory_image = "default_tool_steelshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:hardened_steel_shovel_head", {
	description = "hardened_steel shovel head --Quench with bucket of water to make component",
	inventory_image = "default_tool_hardened_steelshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255",
})

--S W O R D    H E A D S--
minetest.register_craftitem("default:redhot_sword_head", {
	description = "Red Hot iron sword head --Use on anvil to make component",
	inventory_image = "default_tool_redhot_ironsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:iron_sword_head", {
	description = "Wrought iron sword head  --Break cooled mold to make component",
	inventory_image = "default_tool_wrought_ironsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:steel_sword_head", {
	description = "steel sword head  --Craft with ingots and charcoal make component",
	inventory_image = "default_tool_steelsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255",
})
minetest.register_craftitem("default:hardened_steel_sword_head", {
	description = "hardened_steel sword head  --Quench with bucket of water to make component",
	inventory_image = "default_tool_hardened_steelsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255",
})


--======================================
--======================================
--F O U N D A R Y   M O L D S--
--======================================
--======================================
minetest.register_node("default:mold_frame", {
	description = "Mold for casting metals  --Craft with sand to desired mold",
	inventory_image = "default_mold_frame.png^fachwerk_blank.png",
	tiles = {"default_mold_frame.png^fachwerk_blank.png", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


--======================================
--======================================
--S W A G E   B L O C K--
--======================================
--======================================
minetest.register_node("default:swage_block", {
	description = "Swage Block  --Craft with nuggets and forge to desired tool head",
	--inventory_image = "swage_block.png^[makealpha:255,255,255",
	tiles = {"default_obsidian.png^[colorize:grey:75",
		"(default_obsidian.png^[colorize:grey:75)^(swage_block.png^[makealpha:255,255,255)",
	"(default_obsidian.png^[colorize:grey:75)^(swage_block.png^[makealpha:255,255,255)"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.35, -0.5, -0.25, 0.35, 0.45, 0.25},
	},
	groups = {cracky = 1, falling_node = 1 },
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:mold_swage_block", {
	description = "Mold for casting metal Swage Block  --Craft with nuggets and forge to desired tool head",
	inventory_image = "(default_mold_frame.png^fachwerk_blank.png)^(swage_block.png^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(swage_block.png^[makealpha:255,255,255)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3, mold = 1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:iron_mold_swage_block", {
	description = "Wrought iron Swage Block  --Dig to get component",
	inventory_image = "(default_mold_frame.png)^(swage_block.png^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(swage_block.png^fachwerk_blank.png^[makealpha:255,255,255)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:swage_block',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:redhot_mold_swage_block", {
	description = "Redhot iron Swage Block  --Let cool and dig to get component",
	inventory_image = "(default_mold_frame.png)^(swage_block.png^[colorize:red:175^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(swage_block.png^[colorize:red:175^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:swage_block',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})









--======================================
--======================================
--H I N G E S--
--======================================
--======================================
--[[
minetest.register_node("default:mold_hinge", {
	description = "Mold for casting metal hinge  --Craft with nuggets and forge to desired tool head",
	inventory_image = "(default_mold_frame.png^fachwerk_blank.png)^(default_mold_hinge.png^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_mold_hinge.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3, mold = 1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:iron_mold_hinge", {
	description = "Wrought iron Hinge  --Smelt in Bloomery to make component",
	inventory_image = "(default_mold_frame.png)^(default_wrought_component_hinge.png^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_wrought_component_hinge.png^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:iron_hinge',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:redhot_mold_hinge", {
	description = "Redhot iron Hinge  --Let cool and dig to get component",
	inventory_image = "(default_mold_frame.png)^(default_wrought_component_hinge.png^[colorize:red:175^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_wrought_component_hinge.png^[colorize:red:175^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})
]]

--======================================
--======================================
--P I C K    H E A D S--
--======================================
--======================================
minetest.register_node("default:mold_pick_head", {
	description = "Mold for casting metal pick heads  --Break hot mold to get redhot head or let cool for iron tool head",
	inventory_image = "default_mold_pick.png^fachwerk_blank.png",
	tiles = {"(default_mold_frame.png)^(default_mold_pick.png^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3, mold = 1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:wrought_mold_pick_head", {
	description = "Wrought iron pick mold  --Ready to make iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_wrought_ironpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_wrought_ironpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:iron_pick_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:redhot_mold_pick_head", {
	description = "Redhot iron pick mold  --Break now for redhot component or let cool and dig to get iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_redhot_ironpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_redhot_ironpick.png^default_tool_alpha_pick.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:redhot_pick_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

--======================================
--======================================
--A X E    H E A D S--
--======================================
--======================================
minetest.register_node("default:mold_axe_head", {
	description = "Mold for casting metal axe heads  --Break hot mold to get redhot head or let cool for iron tool head",
	inventory_image = "default_mold_axe.png^fachwerk_blank.png",
	tiles = {"(default_mold_frame.png)^(default_mold_axe.png^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3, mold = 1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:wrought_mold_axe_head", {
	description = "Wrought iron axe mold  --Ready to make iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_wrought_ironaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_wrought_ironaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:iron_axe_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:redhot_mold_axe_head", {
	description = "Redhot iron axe mold  --Break now for redhot component or let cool and dig to get iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_redhot_ironaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_redhot_ironaxe.png^default_tool_alpha_axe.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:redhot_axe_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

--======================================
--======================================
--S H O V E L    H E A D S--
--======================================
--======================================
minetest.register_node("default:mold_shovel_head", {
	description = "Mold for casting metal shovel heads  --Break hot mold to get redhot head or let cool for iron tool head",
	inventory_image = "default_mold_shovel.png^fachwerk_blank.png",
	tiles = {"(default_mold_frame.png)^(default_mold_shovel.png^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3, mold = 1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:wrought_mold_shovel_head", {
	description = "Wrought iron shovel mold  --Ready to make iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_wrought_ironshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_wrought_ironshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:iron_shovel_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:redhot_mold_shovel_head", {
	description = "Redhot iron shovel mold  --Break now for redhot component or let cool and dig to get iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_redhot_ironshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_redhot_ironshovel.png^default_tool_alpha_shovel.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:redhot_shovel_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

--======================================
--======================================
--S W O R D    H E A D S--
--======================================
--======================================
minetest.register_node("default:mold_sword_head", {
	description = "Mold for casting metal sword heads  --Break hot mold to get redhot head or let cool for iron tool head",
	inventory_image = "default_mold_sword.png^fachwerk_blank.png",
	tiles = {"(default_mold_frame.png)^(default_mold_sword.png^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {crumbly = 1, cracky = 3, mold = 1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:wrought_mold_sword_head", {
	description = "Wrought iron sword mold --Ready to make iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_wrought_ironsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_wrought_ironsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:iron_sword_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:redhot_mold_sword_head", {
	description = "Redhot iron sword mold --Break now for redhot component or let cool and dig to get iron component",
	inventory_image = "(default_mold_frame.png)^(default_tool_redhot_ironsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255^fachwerk_blank.png)",
	tiles = {"(default_mold_frame.png)^(default_tool_redhot_ironsword.png^default_tool_alpha_sword.png^[makealpha:255,255,255^fachwerk_blank.png)", 
	"default_mold_frame.png^fachwerk_blank.png",
	"default_mold_frame.png^fachwerk_blank.png"},
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'default:redhot_sword_head',
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})



--===================================
--===================================
--M E T A L  C R A F T I N G--
--===================================
--===================================
minetest.register_craft({
	output = 'default:iron_bloom_material',
	recipe = {
		{'default:iron_lump', 'default:charcoal'},
	}
})

minetest.register_craft({
	output = 'default:steel_ingot',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"}},
	recipe = {
		{'default:iron_bloom', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:steel_ingot',
	replacements = {{"default:stonebrick", "default:stonebrick 2"}},
	recipe = {
		{'', 'default:stonebrick', ''},
		{'', 'default:iron_bloom', ''},
		{'default:stonebrick', 'default:iron_bloom', 'default:stonebrick'},
	}
})

minetest.register_craft({
	output = 'default:steelblock',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'default:redhot_steelblock',
	recipe = {
		{'default:redhot_steel_ingot', 'default:redhot_steel_ingot', 'default:redhot_steel_ingot'},
		{'default:redhot_steel_ingot', 'default:redhot_steel_ingot', 'default:redhot_steel_ingot'},
		{'default:redhot_steel_ingot', 'default:redhot_steel_ingot', 'default:redhot_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'default:redhot_steelslab',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"}},
	recipe = {
		{'', '', ''},
		{'default:redhot_steel_ingot', 'default:redhot_steel_ingot', 'default:tool_anvil'},
		{'default:redhot_steel_ingot', 'default:redhot_steel_ingot', 'default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:steel_nugget 3',
	recipe = {
		{'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'default:steel_nugget 3',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"}},
	recipe = {
		{'default:iron_bloom', 'default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:steel_ingot',
	recipe = {
		{'default:steel_nugget 3'},
	}
})

minetest.register_craft({
	output = 'default:steel_ingot 9',
	recipe = {
		{'default:steelblock'},
	}
})

--G R A V E L S I E V E   H A M M E R   H E A D--
minetest.register_craft({
	output = 'default:gravelsieve_hammer_head',
	replacements = {{"default:stonebrick", "default:cobble"},{"default:tool_anvil", "default:tool_anvil"}},
	recipe = {
		{'','',''},
		{'default:iron_lump','default:iron_bloom','default:charcoal'},
		{'default:stonebrick','default:iron_bloom','default:stonebrick'},
	}
})
minetest.register_craft({
	output = 'default:gravelsieve_hammer_head',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','',''},
		{'default:tool_steel_tongs','default:iron_bloom',''},
		{'default:tool_anvil','default:iron_bloom','default:tool_gravel_sieve_hammer'},
	}
})




--M A N D R E L--
minetest.register_craft({
	output = 'default:redhot_tool_steel_mandrel',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'default:tool_steel_tongs','',''},
		{'default:redhot_steel_bar','default:redhot_steel_bar','default:redhot_steel_bar'},
		{'default:swage_block','default:tool_anvil','default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:tool_steel_mandrel',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty 2"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'bucket:bucket_water','','bucket:bucket_water'},
		{'default:tool_steel_tongs','default:redhot_tool_steel_mandrel',''},
		{'','',''},
	}
})



--S W A G E   B  L O C K--
minetest.register_craft({
	output = 'default:swage_block',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty 2"}},
	recipe = {
		{'','bucket:bucket_water','bucket:bucket_water'},
		{'stairs:slab_redhot_steelblock','stairs:slab_redhot_steelblock','stairs:slab_redhot_steelblock'},
		{'stairs:slab_redhot_steelblock','default:stonebrick','default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:mold_redhot_swage_block',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_metal_molten", "bucket:bucket_empty 4"}},
	recipe = {
		{'default:clay_lump','default:clay_lump','default:clay_lump'},
		{'bucket:bucket_metal_molten','bucket:bucket_metal_molten','bucket:bucket_metal_molten'},
		{'bucket:bucket_metal_molten','default:mold_frame','default:clay'},
	}
})

--S T E E L   B A R--
minetest.register_craft({
	output = 'default:steel_bar',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'default:redhot_steel_ingot','',''},
		{'default:redhot_steel_ingot','',''},
		{'default:redhot_steel_ingot','default:swage_block','default:tool_gravel_sieve_hammer'},
	}
})

--S T E E L   P L A T E--
minetest.register_craft({
	output = 'default:redhot_steel_plate',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','',''},
		{'','','default:tool_steel_tongs'},
		{'default:redhot_steel_ingot','default:tool_anvil','default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:steel_plate',
	replacements = {{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','',''},
		{'','','default:tool_steel_tongs'},
		{'default:redhot_steel_plate','',''},
	}
})

--S T E E L   R I B B O N--
minetest.register_craft({
	output = "default:redhot_steel_ribbon",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:tool_steel_tongs", "default:tool_steel_tongs"},{"default:tool_steel_mandrel", "default:tool_steel_mandrel"}},
	recipe = {
		{'', 'default:redhot_steel_bar', ''},
		{'','default:tool_steel_mandrel', 'default:tool_steel_tongs'},
		{'', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})

--S T E E L   H A R D W A R E--
minetest.register_craft({
	output = 'default:iron_hardware 9',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:swage_block", "default:swage_block"}},
	recipe = {
		{'','',''},
		{'','',''},
		{'default:redhot_steel_bar','default:swage_block','default:tool_gravel_sieve_hammer'},
	}
})

--H I N G E--
minetest.register_craft({
	output = "default:iron_hinge 2",
	replacements = {{"default:tool_anvil", "default:tool_anvil"},{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', '', ''},
		{'default:redhot_steel_bar', 'default:redhot_steel_ingot', 'default:tool_steel_tongs'},
		{'default:swage_block', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})

--M U S K E T   B A R R E L--
minetest.register_craft({
	output = "default:steel_barrel_musket_reamed",
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty 3"},{"default:tool_steel_tongs", "default:tool_steel_tongs"},{"default:tool_steel_reamer", "default:tool_steel_reamer"}},
	recipe = {
		{'', 'bucket:bucket_water', ''},
		{'', 'default:steel_barrel_musket', 'default:tool_steel_reamer'},
		{'', '', ''},
	},
})
minetest.register_craft({
	output = "default:steel_barrel_musket",
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty 3"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'bucket:bucket_water', 'bucket:bucket_water', 'bucket:bucket_water'},
		{'', 'default:redhot_steel_barrel_musket', 'default:tool_steel_tongs'},
		{'', '', ''},
	},
})

minetest.register_craft({
	output = "default:redhot_steel_barrel_musket",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', '', ''},
		{'default:redhot_steel_barrel_long', 'default:redhot_steel_barrel_short', 'default:tool_steel_tongs'},
		{'default:swage_block', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})

minetest.register_craft({
	output = "default:steel_barrel_long",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', '', ''},
		{'default:redhot_steel_barrel_medium', 'default:redhot_steel_barrel_short', 'default:tool_steel_tongs'},
		{'default:swage_block', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})

minetest.register_craft({
	output = "default:steel_barrel_medium",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', '', ''},
		{'default:redhot_steel_barrel_short', 'default:redhot_steel_barrel_short', 'default:tool_steel_tongs'},
		{'default:swage_block', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})

minetest.register_craft({
	output = "default:steel_barrel_short",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', '', 'default:tool_steel_tongs'},
		{'default:redhot_steel_ribbon','default:tool_steel_mandrel', 'default:redhot_steel_ribbon'},
		{'default:swage_block', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})




--S T E E L   S P R I N G S--

--heavy spring

minetest.register_craft({
	output = 'default:steel_spring_heavy 1',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','','default:tool_steel_tongs'},
		{'default:redhot_steel_bar','bucket:bucket_water','default:redhot_steel_bar'},
		{'default:tool_anvil','default:redhot_steel_bar','default:tool_gravel_sieve_hammer'},
	}
})


--light spring

minetest.register_craft({
	output = 'default:steel_spring_light 3',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','','default:tool_steel_tongs'},
		{'','bucket:bucket_water',''},
		{'default:redhot_steel_bar','default:tool_anvil','default:tool_gravel_sieve_hammer'},
	}
})



--===========================
--===========================
--T O O L   C R A F T I N G--
--===========================
--===========================

--S A W--
minetest.register_craft({
	output = "default:tool_steel_saw",
	recipe = {
		{'', '', ''},
		{'default:handle_medium', 'default:steel_saw_blade', 'default:handle_medium'},
		{'default:glue', '', 'default:glue'},
	},
})

minetest.register_craft({
	output = "default:steel_saw_blade",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'default:redhot_steel_plate', 'default:redhot_steel_plate', 'default:redhot_steel_plate'},
		{'', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})



--C L I M B I N G  P I C K--
minetest.register_craft({
	output = "default:tool_climbing_pick",
	recipe = {
		{'', 'default:steel_climbing_pick_head', ''},
		{'', 'default:glue', 'default:cord'},
		{'default:handle_medium', 'default:cord', ''},
	},
})

minetest.register_craft({
	output = "default:steel_climbing_pick_head",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:swage_block", "default:swage_block"},{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', ''},
		{'default:redhot_steel_bar', 'default:redhot_steel_ingot', 'default:tool_steel_tongs'},
		{'default:swage_block', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})

--A N V I L   H A M M E R--
--  anvil_hammer_head 
-- 
minetest.register_craft({
	output = "default:redhot_tool_anvil_hammer_head",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
                {'default:redhot_steel_ingot','','default:redhot_steel_ingot'},
                {'default:redhot_steel_ingot','default:redhot_steel_bar', 'default:redhot_steel_ingot'},
                {'default:tool_steel_tongs','default:tool_anvil','default:tool_gravel_sieve_hammer'} }
})

minetest.register_craft({
	output = "default:tool_hammer",
	recipe = {
                {'','default:tool_anvil_hammer_head',''},
                {'','default:steel_bar', 'default:iron_hardware'},
                {'default:cord',                   'default:handle_short',      'default:iron_hardware'                   } }
})

minetest.register_craft({
	output = "default:tool_anvil_hammer_head",
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', ''},
		{'', 'default:redhot_tool_anvil_hammer_head', 'default:tool_steel_tongs'},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = "default:handle_short",
	replacements = {{"default:tool_hammer", "default:iron_hardware 2"}},
	recipe = {
                {'','',''},
                {'','', ''},
                {'default:tool_hammer','',''} }
})

--F O U N D A R Y   T O N G S--
minetest.register_craft({
	output = "default:tool_steel_tongs",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"}},
	recipe = {
                {'','',''},
                {'default:tool_steel_tong','default:redhot_steel_ingot', 'default:tool_steel_tong'},
                {'','default:tool_anvil','default:tool_gravel_sieve_hammer'} }
})

minetest.register_craft({
	output = "default:tool_steel_tong",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"}},
	recipe = {
                {'','bucket:bucket_water',''},
                {'','default:tool_redhot_steel_tong', ''},
                {'','default:tool_anvil','default:tool_gravel_sieve_hammer'} }
})

minetest.register_craft({
	output = "default:tool_redhot_steel_tong",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:swage_block", "default:swage_block"},},
	recipe = {
                {'','',''},
                {'','default:redhot_steel_bar', ''},
                {'default:swage_block','default:tool_anvil','default:tool_gravel_sieve_hammer'} }
})


--R E A M E R--
minetest.register_craft({
	output = "default:tool_steel_reamer",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"}},
	recipe = {
                {'','default:wood',''},
                {'','default:tool_steel_reamer_shaft', 'default:tool_steel_tongs'},
                {'','default:tool_anvil','default:tool_gravel_sieve_hammer'} }
})

minetest.register_craft({
	output = "default:tool_steel_reamer_shaft",
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
                {'','bucket:bucket_water',''},
                {'','default:tool_redhot_steel_reamer_shaft', 'default:tool_steel_tongs'},
                {'','',''} }
})

minetest.register_craft({
	output = "default:tool_redhot_steel_reamer_shaft",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
                {'','',''},
                {'','default:redhot_steel_bar', 'default:tool_steel_tongs'},
                {'','default:swage_block','default:tool_gravel_sieve_hammer'} }
})


--P I C K S--
minetest.register_craft({
	output = 'default:tool_pick_stone',
	recipe = {
		{'group:pebble', 'group:pebble', 'group:pebble'},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_pick_iron',
	recipe = {
		{'', 'default:iron_pick_head', ''},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_pick_steel',
	recipe = {
		{'', 'default:steel_pick_head', ''},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:steel_pick_head',
	recipe = {
		{'default:charcoal', '','default:metal_molten_source'},
		{'default:charcoal', '','default:metal_molten_source'},
		{'default:charcoal', 'default:mold_frame','default:metal_molten_source'},
	}
})
minetest.register_craft({
	output = 'default:steel_pick_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty 3"}},
	recipe = {
		{'default:charcoal', '','bucket:bucket_metal_molten'},
		{'default:charcoal', '','bucket:bucket_metal_molten'},
		{'default:charcoal', 'default:mold_frame','bucket:bucket_metal_molten'},
	}
})

minetest.register_craft({
	output = 'default:tool_pick_hardened_steel',
	recipe = {
		{'', 'default:hardened_steel_pick_head', ''},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})




--S H O V E L S--
minetest.register_craft({
	output = 'default:tool_shovel_stone',
	recipe = {
		{'', 'group:pebble',''},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_shovel_iron',
	recipe = {
		{'', 'default:iron_shovel_head',''},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_shovel_steel',
	recipe = {
		{'', 'default:steel_shovel_head',''},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:steel_shovel_head',
	recipe = {
		{'', 'default:charcoal',''},
		{'', 'default:metal_molten_source',''},
		{'', 'default:mold_frame',''},
	}
})
minetest.register_craft({
	output = 'default:steel_shovel_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty"}},
	recipe = {
		{'', 'default:charcoal',''},
		{'', 'bucket:bucket_metal_molten',''},
		{'', 'default:mold_frame',''},
	}
})

minetest.register_craft({
	output = 'default:tool_shovel_hardened_steel',
	recipe = {
		{'', 'default:hardened_steel_shovel_head',''},
		{'default:glue', '','default:glue'},
		{'default:cord', 'default:handle_long','default:cord'},
	}
})



--A X E S--
minetest.register_craft({
	output = 'default:tool_axe_stone',
	recipe = {
		{'group:pebble', 'group:pebble','default:glue'},
		{'group:pebble', '','default:glue'},
		{'default:cord', 'default:handle_medium','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_axe_iron',
	recipe = {
		{'', 'default:iron_axe_head','default:glue'},
		{'', '','default:glue'},
		{'default:cord', 'default:handle_medium','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_axe_steel',
	recipe = {
		{'', 'default:steel_axe_head','default:glue'},
		{'', '','default:glue'},
		{'default:cord', 'default:handle_medium','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:steel_axe_head',
	recipe = {
		{'default:metal_molten_source', 'default:metal_molten_source','default:charcoal'},
		{'default:metal_molten_source', 'default:charcoal','default:charcoal'},
		{'', '','default:mold_frame'},
	}
})
minetest.register_craft({
	output = 'default:steel_axe_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty 3"}},
	recipe = {
		{'bucket:bucket_metal_molten', 'bucket:bucket_metal_molten','default:charcoal'},
		{'bucket:bucket_metal_molten', 'default:charcoal','default:charcoal'},
		{'', '','default:mold_frame'},
	}
})

minetest.register_craft({
	output = 'default:tool_axe_hardened_steel',
	recipe = {
		{'', 'default:hardened_steel_axe_head','default:glue'},
		{'', '','default:glue'},
		{'default:cord', 'default:handle_medium','default:cord'},
	}
})



--S W O R D--
minetest.register_craft({
	output = 'default:tool_sword_stone',
	recipe = {
		{'', 'group:pebble', ''},
		{'default:glue', 'group:pebble', 'default:glue'},
		{'default:cord', 'default:handle_short','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_sword_iron',
	recipe = {
		{'', 'default:iron_sword_head', ''},
		{'default:glue', '', 'default:glue'},
		{'default:cord', 'default:handle_short','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:tool_sword_steel',
	recipe = {
		{'', 'default:steel_sword_head', ''},
		{'default:glue', '', 'default:glue'},
		{'default:cord', 'default:handle_short','default:cord'},
	}
})

minetest.register_craft({
	output = 'default:steel_sword_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty 3"}},
	recipe = {
		{'bucket:bucket_metal_molten', '','default:mold_frame'},
		{'bucket:bucket_metal_molten', 'default:charcoal',''},
		{'bucket:bucket_metal_molten', 'default:charcoal',''},
	}
})
minetest.register_craft({
	output = 'default:steel_sword_head',
	recipe = {
		{'default:metal_molten_source', '','default:mold_frame'},
		{'default:metal_molten_source', 'default:charcoal',''},
		{'default:metal_molten_source', 'default:charcoal',''},
	}
})

minetest.register_craft({
	output = 'default:tool_sword_hardened_steel',
	recipe = {
		{'', 'default:hardened_steel_sword_head', ''},
		{'default:glue', '', 'default:glue'},
		{'default:cord', 'default:handle_short','default:cord'},
	}
})


--RETURN HANDLES
--pick
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_pick_stone'}
	}
})
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_pick_iron'}
	}
})
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_pick_steel'}
	}
})
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_pick_hardened_steel'}
	}
})
--shovel
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_shovel_stone'}
	}
})
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_shovel_iron'}
	}
})
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_shovel_steel'}
	}
})
minetest.register_craft({
	output = "default:handle_long",
	recipe = {
		{'default:tool_shovel_hardened_steel'}
	}
})
--axe
minetest.register_craft({
	output = "default:handle_medium",
	recipe = {
		{'default:tool_axe_stone'}
	}
})
minetest.register_craft({
	output = "default:handle_medium",
	recipe = {
		{'default:tool_axe_iron'}
	}
})
minetest.register_craft({
	output = "default:handle_medium",
	recipe = {
		{'default:tool_axe_steel'}
	}
})
minetest.register_craft({
	output = "default:handle_medium",
	recipe = {
		{'default:tool_axe_hardened_steel'}
	}
})
--sword
minetest.register_craft({
	output = "default:handle_short",
	recipe = {
		{'default:tool_sword_stone'}
	}
})
minetest.register_craft({
	output = "default:handle_short",
	recipe = {
		{'default:tool_sword_iron'}
	}
})
minetest.register_craft({
	output = "default:handle_short",
	recipe = {
		{'default:tool_sword_steel'}
	}
})
minetest.register_craft({
	output = "default:handle_short",
	recipe = {
		{'default:tool_sword_hardened_steel'}
	}
})

--===========================
--===========================
--F O U N D A R Y  C R A F T I N G--
--===========================
--===========================



minetest.register_craft({
	output = 'default:mold_frame',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:sand', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

--[[
minetest.register_craft({
	output = 'default:mold_hinge',
	replacements = {{"bucket:bucket_metal_nuggets", "bucket:bucket_empty 3"}},
	recipe = {
		{'bucket:bucket_metal_nuggets', '', 'bucket:bucket_metal_nuggets'},
		{'group:sand', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:mold_pick_head',
	replacements = {{"bucket:bucket_metal_nuggets", "bucket:bucket_empty 3"}},
	recipe = {
		{'bucket:bucket_metal_nuggets', 'bucket:bucket_metal_nuggets', 'bucket:bucket_metal_nuggets'},
		{'group:sand', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:mold_axe_head',
	replacements = {{"bucket:bucket_metal_nuggets", "bucket:bucket_empty 3"}},
	recipe = {
		{'bucket:bucket_metal_nuggets', 'bucket:bucket_metal_nuggets', 'group:sand'},
		{'bucket:bucket_metal_nuggets', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:mold_shovel_head',
	replacements = {{"bucket:bucket_metal_nuggets", "bucket:bucket_empty 1"}},
	recipe = {
		{'group:sand', 'bucket:bucket_metal_nuggets', 'group:sand'},
		{'group:sand', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:mold_sword_head',
	replacements = {{"bucket:bucket_metal_nuggets", "bucket:bucket_empty 3"}},
	recipe = {
		{'group:sand', 'group:sand', 'bucket:bucket_metal_nuggets'},
		{'group:sand', 'bucket:bucket_metal_nuggets', 'group:sand'},
		{'bucket:bucket_metal_nuggets', 'default:mold_frame', 'group:sand'},
	}
})
]]
--POURING MOLTEN ONLY
--mold
minetest.register_craft({
	output = 'default:mold_pick_head',
	recipe = {
		{'default:clay_lump', 'default:clay_lump', 'default:clay_lump'},
		{'group:sand', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:mold_axe_head',
	recipe = {
		{'default:clay_lump', 'default:clay_lump', 'group:sand'},
		{'default:clay_lump', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:mold_shovel_head',
	recipe = {
		{'group:sand', 'default:clay_lump', 'group:sand'},
		{'group:sand', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:mold_sword_head',
	recipe = {
		{'group:sand', 'group:sand', 'default:clay_lump'},
		{'group:sand', 'default:clay_lump', 'group:sand'},
		{'default:clay_lump', 'default:mold_frame', 'group:sand'},
	}
})

--pouring
minetest.register_craft({
	output = 'default:redhot_mold_pick_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty 3"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'bucket:bucket_metal_molten', 'bucket:bucket_metal_molten', 'bucket:bucket_metal_molten'},
		{'group:sand', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'default:tool_steel_tongs'},
	}
})

minetest.register_craft({
	output = 'default:redhot_mold_axe_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty 3"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'bucket:bucket_metal_molten', 'bucket:bucket_metal_molten', 'group:sand'},
		{'bucket:bucket_metal_molten', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'default:tool_steel_tongs'},
	}
})

minetest.register_craft({
	output = 'default:redhot_mold_shovel_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty 1"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'group:sand', 'bucket:bucket_metal_molten', 'group:sand'},
		{'group:sand', 'default:mold_frame', 'group:sand'},
		{'group:sand', 'group:sand', 'default:tool_steel_tongs'},
	}
})

minetest.register_craft({
	output = 'default:redhot_mold_sword_head',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty 3"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'group:sand', 'group:sand', 'bucket:bucket_metal_molten'},
		{'group:sand', 'bucket:bucket_metal_molten', 'group:sand'},
		{'bucket:bucket_metal_molten', 'default:mold_frame', 'default:tool_steel_tongs'},
	}
})

minetest.register_craft({
	output = 'default:redhot_steel_ingot 4',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty"},{"default:mold_frame", "default:mold_frame"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_metal_molten', 'default:tool_steel_tongs'},
		{'', 'default:mold_frame', ''},
	}
})




--Q U E N C H--
minetest.register_craft({
	output = 'default:hardened_steel_pick_head',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:redhot_pick_head', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'default:hardened_steel_axe_head',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:redhot_axe_head', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'default:hardened_steel_shovel_head',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:redhot_shovel_head', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'default:hardened_steel_sword_head',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:redhot_sword_head', ''},
		{'', '', ''},
	}
})


--T O O L S--
minetest.register_craft({
	output = 'default:hardened_steel_pick_head',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:tool_pick_redhot_iron', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'default:hardened_steel_axe_head',
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:tool_axe_redhot_iron', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'default:hardened_steel_shovel_head',
		replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:tool_shovel_redhot_iron', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'default:hardened_steel_sword_head',
		replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'', 'bucket:bucket_water', 'default:tool_steel_tongs'},
		{'', 'default:tool_sword_redhot_iron', ''},
		{'', '', ''},
	}
})



--H E A T T R E A T--
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_pick_iron',
	output = 'default:redhot_pick_head',
	cooktime = 180,
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_pick_steel',
	output = 'default:redhot_pick_head',
	cooktime = 180,
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_axe_iron',
	output = 'default:redhot_axe_head',
	cooktime = 180,
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_axe_steel',
	output = 'default:redhot_axe_head',
	cooktime = 180,
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_shovel_iron',
	output = 'default:redhot_shovel_head',
	cooktime = 180,
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_shovel_steel',
	output = 'default:redhot_shovel_head',
	cooktime = 180,
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_sword_iron',
	output = 'default:redhot_sword_head',
	cooktime = 180,
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'default:tool_sword_steel',
	output = 'default:redhot_sword_head',
	cooktime = 180,
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'stairs:slab_steelblock',
	output = 'stairs:slab_redhot_steelblock',
	cooktime = 405,
})

--==================================================
--==================================================
--==================================================
--==================================================
--==================================================