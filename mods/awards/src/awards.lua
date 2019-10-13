-- Copyright (c) 2013-18 rubenwardy and Wuzzy. MIT.

local S = awards.gettext

-- Saint-Maclou
if minetest.get_modpath("moreblocks") then
	awards.register_award("award_saint_maclou",{
		title = S("Saint-Maclou"),
		description = S("Place 20 coal checkers."),
		icon = "awards_novicebuilder.png",
		trigger = {
			type = "place",
			node = "moreblocks:coal_checker",
			target = 20
		}
	})

	-- Castorama
	awards.register_award("award_castorama",{
		title = S("Castorama"),
		description = S("Place 20 iron checkers."),
		icon = "awards_novicebuilder.png",
		trigger = {
			type = "place",
			node = "moreblocks:iron_checker",
			target = 20
		}
	})

	-- Sam the Trapper
	awards.register_award("award_sam_the_trapper",{
		title = S("Sam the Trapper"),
		description = S("Place 2 trap stones."),
		icon = "awards_novicebuilder.png",
		trigger = {
			type = "place",
			node = "moreblocks:trap_stone",
			target = 2
		}
	})
end

-- This award can't be part of Unified Inventory, it would make a circular dependency
if minetest.get_modpath("unified_inventory") then
	if minetest.get_all_craft_recipes("unified_inventory:bag_large") ~= nil then
		awards.register_award("awards_ui_bags", {
			title = S("Backpacker"),
			description = S("Craft 4 large bags."),
			icon = "awards_ui_bags.png",
			trigger = {
				type = "craft",
				item = "unified_inventory:bag_large",
				target = 4
			}
		})
	end
end

if minetest.get_modpath("fire") then
	awards.register_award("awards_pyro", {
		title = S("Pyromaniac"),
		description = S("Craft 8 times flint and steel."),
		icon = "fire_flint_steel.png",
		trigger = {
			type = "craft",
			item = "fire:flint_and_steel",
			target = 8
		}
	})
	if minetest.settings:get_bool("disable_fire") ~= true then
		awards.register_award("awards_firefighter", {
			title = S("Firefighter"),
			description = S("Put out 1000 fires."),
			icon = "awards_firefighter.png",
			trigger = {
				type = "dig",
				node = "fire:basic_flame",
				target = 1000
			}
		})
	end
end

if minetest.get_modpath("default") then
	-- Light it up
	awards.register_award("award_lightitup",{
		title = S("Light It Up"),
		description = S("Place 100 torches."),
		icon = "awards_novicebuilder.png^awards_level1.png",
		difficulty = 0.01,
		trigger = {
			type = "place",
			node = "default:torch",
			target = 100
		}
	})

	-- Light ALL the things!
	awards.register_award("award_well_lit",{
		title = S("Well Lit"),
		icon = "awards_novicebuilder.png^awards_level2.png",
		description = S("Place 1,000 torches."),
		difficulty = 0.01,
		trigger = {
			type = "place",
			node = "default:torch",
			target = 1000
		}
	})

	awards.register_award("award_meselamp",{
		title = S("Really Well Lit"),
		description = S("Craft 10 mese lamps."),
		icon = "default_meselamp.png",
		difficulty = 0.2,
		trigger = {
			type = "craft",
			item = "default:meselamp",
			target = 10
		}
	})

	awards.register_award("awards_stonebrick", {
		title = S("Outpost"),
		description = S("Craft 200 stone bricks."),
		icon = "default_stone_brick.png^awards_level1.png",
		difficulty = 0.08,
		trigger = {
			type = "craft",
			item = "default:stonebrick",
			target = 200
		}
	})

	awards.register_award("awards_stonebrick2", {
		title = S("Watchtower"),
		description = S("Craft 800 stone bricks."),
		icon = "default_stone_brick.png^awards_level2.png",
		difficulty = 0.08,
		trigger = {
			type = "craft",
			item = "default:stonebrick",
			target = 800
		}
	})

	awards.register_award("awards_stonebrick3", {
		title = S("Fortress"),
		description = S("Craft 3,200 stone bricks."),
		icon = "default_stone_brick.png^awards_level3.png",
		difficulty = 0.08,
		trigger = {
			type = "craft",
			item = "default:stonebrick",
			target = 3200
		}
	})

	awards.register_award("awards_desert_stonebrick", {
		title = S("Desert Dweller"),
		description = S("Craft 400 desert stone bricks."),
		icon = "default_desert_stone_brick.png",
		difficulty = 0.09,
		trigger = {
			type = "craft",
			item = "default:desert_stonebrick",
			target = 400
		}
	})

	awards.register_award("awards_desertstonebrick", {
		title = S("Pharaoh"),
		description = S("Craft 100 sandstone bricks."),
		icon = "default_sandstone_brick.png",
		difficulty = 0.09,
		trigger = {
			type = "craft",
			item = "default:sandstonebrick",
			target = 100
		}
	})

	awards.register_award("awards_bookshelf", {
		title = S("Little Library"),
		description = S("Craft 7 bookshelves."),
		icon = "default_bookshelf.png",
		difficulty = 0.2,
		trigger = {
			type = "craft",
			item = "default:bookshelf",
			target = 7
		}
	})

	awards.register_award("awards_obsidian", {
		title = S("Lava and Water"),
		description = S("Mine your first obsidian."),
		icon = "default_obsidian.png^awards_level1.png",
		background = "awards_bg_mining.png",
		difficulty = 1.5,
		trigger = {
			type = "dig",
			node = "default:obsidian",
			target = 1
		}
	})

	-- Obsessed with Obsidian
	awards.register_award("award_obsessed_with_obsidian",{
		title = S("Obsessed with Obsidian"),
		description = S("Mine 50 obsidian."),
		icon = "default_obsidian.png^awards_level2.png",
		background = "awards_bg_mining.png",
		difficulty = 1.5,
		trigger = {
			type = "dig",
			node = "default:obsidian",
			target = 50
		}
	})

	-- Proof that player has found lava
	awards.register_award("award_lavaminer",{
		title = S("Lava Miner"),
		description = S("Mine any block while being very close to lava."),
		background = "awards_bg_mining.png",
		icon = "default_lava.png",
		difficulty = 1,
	})
	awards.register_on_dig(function(player,data)
		local pos = player:get_pos()
		if pos and (minetest.find_node_near(pos, 1, "default:lava_source") or
				minetest.find_node_near(pos, 1, "default:lava_flowing")) then
			return "award_lavaminer"
		end
		return nil
	end)

	-- On the way
	awards.register_award("award_on_the_way", {
		title = S("On The Way"),
		description = S("Place 100 rails."),
		icon = "carts_rail_straight.png",
		difficulty = 0.1,
		trigger = {
			type = "place",
			node = "default:rail",
			target = 100
		}
	})

	awards.register_award("award_lumberjack_firstday", {
		title = S("First Day in the Woods"),
		description = S("Dig 6 tree blocks."),
		icon = "default_tree.png^awards_level1.png",
		difficulty = 0.03,
		trigger = {
			type = "dig",
			node = "default:tree",
			target = 6
		}
	})

	-- Lumberjack
	awards.register_award("award_lumberjack", {
		title = S("Lumberjack"),
		description = S("Dig 36 tree blocks."),
		icon = "default_tree.png^awards_level2.png",
		difficulty = 0.03,
		trigger = {
			type = "dig",
			node = "default:tree",
			target = 36
		}
	})

	-- Semi-pro Lumberjack
	awards.register_award("award_lumberjack_semipro", {
		title = S("Semi-pro Lumberjack"),
		description = S("Dig 216 tree blocks."),
		icon = "default_tree.png^awards_level3.png",
		difficulty = 0.03,
		trigger = {
			type = "dig",
			node = "default:tree",
			target = 216
		}
	})

	-- Professional Lumberjack
	awards.register_award("award_lumberjack_professional", {
		title = S("Professional Lumberjack"),
		description = S("Dig 1,296 tree blocks."),
		icon = "default_tree.png^awards_level4.png",
		difficulty = 0.03,
		trigger = {
			type = "dig",
			node = "default:tree",
			target = 1296
		}
	})

	-- Junglebaby
	awards.register_award("award_junglebaby", {
		title = S("Junglebaby"),
		description = S("Dig 100 jungle tree blocks."),
		icon = "default_jungletree.png^awards_level1.png",
		difficulty = 0.05,
		trigger = {
			type = "dig",
			node = "default:jungletree",
			target = 100
		}
	})

	-- Jungleman
	awards.register_award("award_jungleman", {
		title = S("Jungleman"),
		description = S("Dig 1,000 jungle tree blocks."),
		icon = "default_jungletree.png^awards_level2.png",
		difficulty = 0.05,
		trigger = {
			type = "dig",
			node = "default:jungletree",
			target = 1000
		}
	})

	-- Found some Mese!
	awards.register_award("award_mesefind", {
		title = S("First Mese Find"),
		description = S("Mine your first mese ore."),
		icon = "default_stone.png^default_mineral_mese.png",
		background = "awards_bg_mining.png",
		difficulty = 1,
		trigger = {
			type = "dig",
			node = "default:stone_with_mese",
			target = 1
		}
	})

	-- Mese Block
	awards.register_award("award_meseblock", {
		secret = true,
		title = S("Mese Mastery"),
		description = S("Mine a mese block."),
		icon = "default_mese_block.png",
		background = "awards_bg_mining.png",
		difficulty = 1.1,
		trigger = {
			type = "dig",
			node = "default:mese",
			target = 1
		}
	})

	-- You're a copper
	awards.register_award("award_youre_a_copper", {
		title = S("You’re a copper"),
		description = S("Dig 1,000 copper ores."),
		icon = "default_stone.png^default_mineral_copper.png",
		background = "awards_bg_mining.png",
		difficulty = 0.2,
		trigger = {
			type = "dig",
			node = "default:stone_with_copper",
			target = 1000
		}
	})

	-- Mini Miner
	awards.register_award("award_mine2", {
		title = S("Mini Miner"),
		description = S("Dig 100 stone blocks."),
		icon = "awards_miniminer.png^awards_level1.png",
		background = "awards_bg_mining.png",
		difficulty = 0.02,
		trigger = {
			type = "dig",
			node = "default:stone",
			target = 100
		}
	})

	-- Hardened Miner
	awards.register_award("award_mine3", {
		title = S("Hardened Miner"),
		description = S("Dig 1,000 stone blocks."),
		icon = "awards_miniminer.png^awards_level2.png",
		background = "awards_bg_mining.png",
		difficulty = 0.02,
		trigger = {
			type = "dig",
			node = "default:stone",
			target = 1000
		}
	})

	-- Master Miner
	awards.register_award("award_mine4", {
		title = S("Master Miner"),
		description = S("Dig 10,000 stone blocks."),
		icon = "awards_miniminer.png^awards_level3.png",
		background = "awards_bg_mining.png",
		difficulty = 0.02,
		trigger = {
			type = "dig",
			node = "default:stone",
			target = 10000
		}
	})

	-- Marchand de sable
	awards.register_award("award_marchand_de_sable", {
		title = S("Marchand De Sable"),
		description = S("Dig 1,000 sand."),
		icon = "default_sand.png",
		background = "awards_bg_mining.png",
		difficulty = 0.05,
		trigger = {
			type = "dig",
			node = "default:sand",
			target = 1000
		}
	})

	awards.register_award("awards_crafter_of_sticks", {
		title = S("Crafter of Sticks"),
		description = S("Craft 100 sticks."),
		icon = "default_stick.png",
		difficulty = 0.01,
		trigger = {
			type = "craft",
			item = "default:stick",
			target = 100
		}
	})

	awards.register_award("awards_junglegrass", {
		title = S("Jungle Discoverer"),
		description = S("Mine your first jungle grass."),
		icon = "default_junglegrass.png",
		difficulty = 0.009,
		trigger = {
			type = "dig",
			node = "default:junglegrass",
			target = 1
		}
	})

	awards.register_award("awards_grass", {
		title = S("Grasslands Discoverer"),
		description = S("Mine some grass."),
		icon = "default_grass_3.png",
		difficulty = 0.009,
		trigger = {
			type = "dig",
			node = "default:grass_1",
			target = 1
		}
	})

	awards.register_award("awards_dry_grass", {
		title = S("Savannah Discoverer"),
		description = S("Mine some dry grass."),
		icon = "default_dry_grass_3.png",
		difficulty = 0.009,
		trigger = {
			type = "dig",
			node = "default:dry_grass_3",
			target = 1
		}
	})

	awards.register_award("awards_cactus", {
		title = S("Desert Discoverer"),
		description = S("Mine your first cactus."),
		icon = "default_cactus_side.png",
		difficulty = 0.03,
		trigger = {
			type = "dig",
			node = "default:cactus",
			target = 1
		}
	})

	awards.register_award("awards_dry_shrub", {
		title = S("Far Lands"),
		description = S("Mine your first dry shrub."),
		icon = "default_dry_shrub.png",
		difficulty = 0.009,
		trigger = {
			type = "dig",
			node = "default:dry_shrub",
			target = 1
		}
	})

	awards.register_award("awards_ice", {
		title = S("Glacier Discoverer"),
		description = S("Mine your first ice."),
		icon = "default_ice.png",
		difficulty = 0.02,
		trigger = {
			type = "dig",
			node = "default:ice",
			target = 1
		}
	})

	-- Proof that player visited snowy lands
	awards.register_award("awards_snowblock", {
		title = S("Very Simple Snow Man"),
		description = S("Place two snow blocks."),
		icon = "default_snow.png",
		difficulty = 0.02,
		trigger = {
			type = "place",
			node = "default:snowblock",
			target = 2
		}
	})

	awards.register_award("awards_gold_ore", {
		title = S("First Gold Find"),
		description = S("Mine your first gold ore."),
		icon = "default_stone.png^default_mineral_gold.png^awards_level1.png",
		background = "awards_bg_mining.png",
		difficulty = 0.9,
		trigger = {
			type = "dig",
			node = "default:stone_with_gold",
			target = 1
		}
	})

	awards.register_award("awards_gold_rush", {
		title = S("Gold Rush"),
		description = S("Mine 45 gold ores."),
		icon = "default_stone.png^default_mineral_gold.png^awards_level2.png",
		background = "awards_bg_mining.png",
		difficulty = 0.9,
		trigger = {
			type = "dig",
			node = "default:stone_with_gold",
			target = 45
		}
	})

	awards.register_award("awards_diamond_ore", {
		title = S("Wow, I am Diamonds!"),
		description = S("Mine your first diamond ore."),
		icon = "default_stone.png^default_mineral_diamond.png^awards_level1.png",
		difficulty = 1,
		trigger = {
			type = "dig",
			node = "default:stone_with_diamond",
			target = 1
		}
	})

	awards.register_award("awards_diamond_rush", {
		title = S("Girl's Best Friend"),
		description = S("Mine 18 diamond ores."),
		icon = "default_stone.png^default_mineral_diamond.png^awards_level2.png",
		background = "awards_bg_mining.png",
		difficulty = 1,
		trigger = {
			type = "dig",
			node = "default:stone_with_diamond",
			target = 18
		}
	})

	awards.register_award("awards_diamondblock", {
		title = S("Hardest Block on Earth"),
		description = S("Craft a diamond block."),
		icon = "default_diamond_block.png",
		difficulty = 1.1,
		trigger = {
			type = "craft",
			item = "default:diamondblock",
			target = 1
		}
	})

	awards.register_award("awards_mossycobble", {
		title = S("In the Dungeon"),
		description = S("Mine a mossy cobblestone."),
		icon = "default_mossycobble.png",
		difficulty = 0.9,
		trigger = {
			type = "dig",
			node = "default:mossycobble",
			target = 1
		}
	})

	awards.register_award("award_furnace", {
		title = S("Smelter"),
		description = S("Craft 10 furnaces."),
		icon = "default_furnace_front.png",
		difficulty = 0.08,
		trigger = {
			type = "craft",
			item= "default:furnace",
			target = 10
		}
	})

	awards.register_award("award_chest", {
		title = S("Treasurer"),
		description = S("Craft 15 chests."),
		icon = "default_chest_front.png",
		difficulty = 0.08,
		trigger = {
			type = "craft",
			item= "default:chest",
			target = 15
		}
	})

	awards.register_award("award_chest2", {
		title = S("Bankier"),
		description = S("Craft 30 locked chests."),
		icon = "default_chest_lock.png",
		difficulty = 0.08,
		trigger = {
			type = "craft",
			item= "default:chest_locked",
			target = 30
		}
	})

	awards.register_award("award_brick", {
		title = S("Bricker"),
		description = S("Craft 200 brick blocks."),
		icon = "default_brick.png",
		difficulty = 0.03,
		trigger = {
			type = "craft",
			item= "default:brick",
			target = 200
		}
	})

	awards.register_award("award_obsidianbrick", {
		title = S("House of Obsidian"),
		description = S("Craft 100 obsidian bricks."),
		icon = "default_obsidian_brick.png",
		difficulty = 0.4,
		trigger = {
			type = "craft",
			item= "default:obsidianbrick",
			target = 100
		}
	})

	awards.register_award("award_placestone", {
		title = S("Build a Cave"),
		description = S("Place 100 stone."),
		icon = "default_stone.png",
		difficulty = 0.1,
		trigger = {
			type = "place",
			node = "default:stone",
			target = 100
		}
	})

	awards.register_award("award_woodladder", {
		title = S("Long Ladder"),
		description = S("Place 400 wooden ladders."),
		icon = "default_ladder_wood.png",
		difficulty = 0.1,
		trigger = {
			type = "place",
			node = "default:ladder_wood",
			target = 400
		}
	})

	awards.register_award("award_steelladder", {
		title = S("Industrial Age"),
		description = S("Place 40 steel ladders."),
		icon = "default_ladder_steel.png",
		difficulty = 1,
		trigger = {
			type = "place",
			node = "default:ladder_steel",
			target = 40
		}
	})

	awards.register_award("award_apples", {
		title = S("Yummy!"),
		description = S("Eat 80 apples."),
		icon = "default_apple.png",
		difficulty = 0.1,
		trigger = {
			type = "eat",
			item = "default:apple",
			target = 80
		}
	})
end

if minetest.get_modpath("vessels") then
	awards.register_award("award_vessels_shelf", {
		title = S("Glasser"),
		icon = "vessels_shelf.png",
		description = S("Craft 14 vessels shelves."),
		trigger = {
			type = "craft",
			item= "vessels:shelf",
			target = 14
		}
	})
end

if minetest.get_modpath("farming") then
	awards.register_award("awards_farmer", {
		title = S("Farming Skills Acquired"),
		description = S("Harvest a fully grown wheat plant."),
		icon = "farming_wheat_8.png^awards_level1.png",
		trigger = {
			type = "dig",
			node = "farming:wheat_8",
			target = 1
		}
	})
	awards.register_award("awards_farmer2", {
		title = S("Field Worker"),
		description = S("Harvest 25 fully grown wheat plants."),
		icon = "farming_wheat_8.png^awards_level2.png",
		trigger = {
			type = "dig",
			node = "farming:wheat_8",
			target = 25
		}
	})

	awards.register_award("awards_farmer3", {
		title = S("Aspiring Farmer"),
		description = S("Harvest 125 fully grown wheat plants."),
		icon = "farming_wheat_8.png^awards_level3.png",
		trigger = {
			type = "dig",
			node = "farming:wheat_8",
			target = 125
		}
	})

	awards.register_award("awards_farmer4", {
		title = S("Wheat Magnate"),
		description = S("Harvest 625 fully grown wheat plants."),
		icon = "farming_wheat_8.png^awards_level4.png",
		trigger = {
			type = "dig",
			node = "farming:wheat_8",
			target = 625
		}
	})

	awards.register_award("award_bread", {
		title = S("Baker"),
		description = S("Eat 10 loaves of bread."),
		icon = "farming_bread.png",
		trigger = {
			type = "eat",
			item = "farming:bread",
			target = 10
		}
	})

end

if minetest.get_modpath("wool") and minetest.get_modpath("farming") then
	awards.register_award("awards_wool", {
		title = S("Wool Over Your Eyes"),
		description = S("Craft 250 white wool."),
		icon = "wool_white.png",
		trigger = {
			type = "craft",
			item = "wool:white",
			target = 250
		}
	})
end

if minetest.get_modpath("beds") then
	awards.register_award("award_bed", {
		title = S("Hotelier"),
		description = S("Craft 15 fancy beds."),
		icon = "beds_bed_fancy.png",
		trigger = {
			type = "craft",
			item= "beds:fancy_bed_bottom",
			target = 15
		}
	})
end

if minetest.get_modpath("stairs") then
	awards.register_award("award_stairs_goldblock", {
		title = S("Filthy Rich"),
		description = S("Craft 24 gold block stairs."),
		icon = "default_gold_block.png",
		trigger = {
			type = "craft",
			item= "stairs:stair_goldblock",
			target = 24
		}
	})
end

if minetest.get_modpath("dye") then
	awards.register_award("awards_dye_red", {
		title = S("Roses Are Red"),
		description = S("Craft 400 red dyes."),
		icon = "dye_red.png",
		trigger = {
			type = "craft",
			item = "dye:red",
			target = 400
		}
	})

	awards.register_award("awards_dye_yellow", {
		title = S("Dandelions are Yellow"),
		description = S("Craft 400 yellow dyes."),
		icon = "dye_yellow.png",
		trigger = {
			type = "craft",
			item = "dye:yellow",
			target = 400
		}
	})

	awards.register_award("awards_dye_blue", {
		title = S("Geraniums are Blue"),
		description = S("Craft 400 blue dyes."),
		icon = "dye_blue.png",
		trigger = {
			type = "craft",
			item= "dye:blue",
			target = 400
		}
	})

	awards.register_award("awards_dye_white", {
		title = S("White Color Stock"),
		description = S("Craft 100 white dyes."),
		icon = "dye_white.png",
		trigger = {
			type = "craft",
			item= "dye:white",
			target = 100
		}
	})
end

if minetest.get_modpath("flowers") then
	awards.register_award("awards_brown_mushroom1", {
		title = S("Tasty Mushrooms"),
		description = S("Eat 3 brown mushrooms."),
		icon = "flowers_mushroom_brown.png^awards_level1.png",
		trigger = {
			type = "eat",
			item= "flowers:mushroom_brown",
			target = 3,
		}
	})
	awards.register_award("awards_brown_mushroom2", {
		title = S("Mushroom Lover"),
		description = S("Eat 33 brown mushrooms."),
		icon = "flowers_mushroom_brown.png^awards_level2.png",
		trigger = {
			type = "eat",
			item= "flowers:mushroom_brown",
			target = 33,
		}
	})
	awards.register_award("awards_brown_mushroom3", {
		title = S("Underground Mushroom Farmer"),
		description = S("Eat 333 brown mushrooms."),
		icon = "flowers_mushroom_brown.png^awards_level3.png",
		trigger = {
			type = "eat",
			item= "flowers:mushroom_brown",
			target = 333,
		}
	})
end

-- This ensures the following code is executed after all items have been registered
minetest.after(0, function()
	-- Check whether there is at least one node which can be built by the player
	local building_is_possible = false
	for _, def in pairs(minetest.registered_nodes) do
		if (def.description and def.pointable ~= false and not def.groups.not_in_creative_inventory) then
			building_is_possible = true
			break
		end
	end

	-- The following awards require at least one node which can be built
	if not building_is_possible then
		return
	end

	awards.register_award("awards_builder1", {
		title = S("Builder"),
		icon = "awards_house.png^awards_level1.png",
		trigger = {
			type = "place",
			target = 1000,
		},
	})
	awards.register_award("awards_builder2", {
		title = S("Constructor"),
		icon = "awards_house.png^awards_level2.png",
		trigger = {
			type = "place",
			target = 5000,
		},
	})
	awards.register_award("awards_builder3", {
		title = S("Architect"),
		icon = "awards_house.png^awards_level3.png",
		trigger = {
			type = "place",
			target = 10000,
		},
	})
	awards.register_award("awards_builder4", {
		title = S("Master Architect"),
		icon = "awards_house.png^awards_level4.png",
		trigger = {
			type = "place",
			target = 25000,
		},
	})
end)

if minetest.get_modpath("nyancat") then
	-- Found a Nyan cat!
	awards.register_award("award_nyanfind", {
		secret = true,
		title = S("A Cat in a Pop-Tart?!"),
		description = S("Mine a nyan cat."),
		icon = "nyancat_front.png",
		trigger = {
			type = "dig",
			node = "nyancat:nyancat",
			target = 1
		}
	})
end
