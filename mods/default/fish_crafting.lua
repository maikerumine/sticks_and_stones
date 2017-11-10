-----------------------------------------------------------------------------------------------
-- Fishing - crabman77 version
-- Rewrited from original Fishing - Mossmanikin's version - Recipes 0.0.8
-----------------------------------------------------------------------------------------------
-- License (code & textures): 	WTFPL
-- Contains code from: 		animal_clownfish, animal_fish_blue_white, fishing (original), stoneage
-- Looked at code from:
-- Dependencies: 			default, farming
-- Supports:				animal_clownfish, animal_fish_blue_white, animal_rat, mobs
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Fishing Pole
-----------------------------------------------------------------------------------------------
-- Wood Fishing Pole
minetest.register_craft({
	output = "default:pole_wood",
	recipe = {
		{"",            "",            "default:stick"    },
		{"default:cord",            "default:stick", "default:cord" },
		{"default:handle_short", "default:glue",            "default:cord" },
	}
})

if minetest.get_modpath("esmobs") ~= nil then
minetest.register_craft({
	output = "default:pole_wood",
	recipe = {
		{"",            "",            "default:stick"     },
		{"default:cord",            "default:stick", "esmobs:cobweb" },
		{"default:handle_short", "default:glue",            "esmobs:cobweb" },
	}
})
end

if minetest.get_modpath("vines") ~= nil then
	minetest.register_craft({
		output = "default:pole_wood",
		recipe = {
			{"",            "",            "default:stick" },
			{"default:cord",            "default:stick", "vines:rope"  },
			{"default:handle_short", "default:glue",            "vines:rope"  },
		}
	})
end

-- Mithril Fishing Pole
if minetest.get_modpath("es") ~= nil and minetest.get_modpath("esmobs") ~= nil then
minetest.register_craft({
	output = "default:pole_perfect",
	recipe = {
		{"",                            "",                       "es:aikerum_crystal" },
		{"", 							"es:aikerum_crystal", "esmobs:cobweb"     },
		{"es:aikerum_crystal",      "",                       "esmobs:cobweb"     },
	}
})
end

-- Aikerum Fishing Pole
if minetest.get_modpath("es") ~= nil and minetest.get_modpath("esmobs") ~= nil then
minetest.register_craft({
	output = "default:pole_perfect",
	recipe = {
		{"",                            "",                       "es:aikerum_crystal" },
		{"", 							"es:aikerum_crystal", "farming:string"     },
		{"es:aikerum_crystal",      "",                       "farming:string"     },
	}
})
end

-----------------------------------------------------------------------------------------------
-- Fishing bait
-----------------------------------------------------------------------------------------------
--bait corn
--[[
minetest.register_craft({
	output = "default:bait_corn 9",
	recipe = {
		{"", "farming:corn", ""},
	}
})
]]
--bait bread
minetest.register_craft({
	output = "default:bait_bread 9",
	recipe = {
		{"", "farming:bread", ""},
	}
})

-----------------------------------------------------------------------------------------------
-- Roasted Fish
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "cooking",
	output = "survival:worm_cooked",
	recipe = "default:bait_worm",
	cooktime = 2,
})



minetest.register_craft({
	type = "cooking",
	output = "default:fish_cooked",
	recipe = "default:fish_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "default:fish_cooked",
	recipe = "default:clownfish_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "default:fish_cooked",
	recipe = "default:bluewhite_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "default:fish_cooked",
	recipe = "default:exoticfish_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "default:fish_cooked",
	recipe = "default:carp_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "default:fish_cooked",
	recipe = "default:perch_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "default:fish_cooked",
	recipe = "default:catfish_raw",
	cooktime = 2,
})

-----------------------------------------------------------------------------------------------
-- Wheat Seed
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_wheat",
	recipe = {"farming:wheat"},
})

-----------------------------------------------------------------------------------------------
-- Sushi
-----------------------------------------------------------------------------------------------
if minetest.get_modpath("flowers_plus") ~= nil then
	minetest.register_craft({
		type = "shapeless",
		output = "default:sushi",
		recipe = {"default:fish_cooked", "farming:seed_wheat", "flowers:seaweed" },
	})
end

if minetest.get_modpath("seaplants") ~= nil then
	minetest.register_craft({
		type = "shapeless",
		output = "default:sushi",
		recipe = {"default:fish_cooked", "farming:seed_wheat", "seaplants:kelpgreen" },

	})
end

-----------------------------------------------------------------------------------------------
-- Roasted Shark
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "cooking",
	output = "default:shark_cooked",
	recipe = "default:shark_raw",
	cooktime = 2,
})

-----------------------------------------------------------------------------------------------
-- Roasted Pike
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "cooking",
	output = "default:pike_cooked",
	recipe = "default:pike_raw",
	cooktime = 2,
})

--[[
-- baitball
minetest.register_craftitem("default:baitball", {
	description = default_setting.func.S("Bait Ball"),
	inventory_image = "fishing_baitball.png",
	stack_max = 99,
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball 20",
	recipe = {"farming:flour", "farming:corn", "bucket:bucket_water"},
	replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
})
]]

-- baitball_shark
minetest.register_craftitem("default:baitball_shark", {
	description = default_setting.func.S("Shark Bait Ball"),
	inventory_image = "fishing_baitball_shark.png",
	stack_max = 99,
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:fish_raw", "default:fish_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:clownfish_raw", "default:clownfish_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:clownfish_raw", "default:fish_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:bluewhite_raw", "default:bluewhite_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:bluewhite_raw", "default:fish_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:clownfish_raw", "default:bluewhite_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:clownfish_raw", "default:shark_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:clownfish_raw", "default:pike_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:bluewhite_raw", "default:shark_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:bluewhite_raw", "default:pike_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:shark_raw", "default:shark_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:pike_raw", "default:pike_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:fish_raw", "default:shark_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:fish_raw", "default:pike_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:baitball_shark 20",
	recipe = {"default:shark_raw", "default:pike_raw"}
})

