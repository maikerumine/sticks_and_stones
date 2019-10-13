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
	output = "sas_core:pole_wood",
	recipe = {
		{"",            "",            "sas_core:default"    },
		{"sas_core:cord",            "sas_core:default", "sas_core:cord" },
		{"sas_core:handle_short", "sas_core:glue",            "sas_core:cord" },
	}
})

if minetest.get_modpath("esmobs") ~= nil then
minetest.register_craft({
	output = "sas_core:pole_wood",
	recipe = {
		{"",            "",            "sas_core:default"     },
		{"sas_core:cord",            "sas_core:default", "esmobs:cobweb" },
		{"sas_core:handle_short", "sas_core:glue",            "esmobs:cobweb" },
	}
})
end

if minetest.get_modpath("vines") ~= nil then
	minetest.register_craft({
		output = "sas_core:pole_wood",
		recipe = {
			{"",            "",            "sas_core:default" },
			{"sas_core:cord",            "sas_core:default", "vines:rope"  },
			{"sas_core:handle_short", "sas_core:glue",            "vines:rope"  },
		}
	})
end

-- Mithril Fishing Pole
if minetest.get_modpath("es") ~= nil and minetest.get_modpath("esmobs") ~= nil then
minetest.register_craft({
	output = "sas_core:pole_perfect",
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
	output = "sas_core:pole_perfect",
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
	output = "sas_core:bait_corn 9",
	recipe = {
		{"", "farming:corn", ""},
	}
})
]]
--bait bread
minetest.register_craft({
	output = "sas_core:bait_bread 9",
	recipe = {
		{"", "farming:bread", ""},
	}
})

-----------------------------------------------------------------------------------------------
-- Roasted Fish
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "cooking",
	output = "sas_core:worm_cooked",
	recipe = "sas_core:bait_worm",
	cooktime = 2,
})



minetest.register_craft({
	type = "cooking",
	output = "sas_core:fish_cooked",
	recipe = "sas_core:fish_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:fish_cooked",
	recipe = "sas_core:clownfish_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:fish_cooked",
	recipe = "sas_core:bluewhite_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:fish_cooked",
	recipe = "sas_core:exoticfish_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:fish_cooked",
	recipe = "sas_core:carp_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:fish_cooked",
	recipe = "sas_core:perch_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "sas_core:fish_cooked",
	recipe = "sas_core:catfish_raw",
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
		output = "sas_core:sushi",
		recipe = {"sas_core:fish_cooked", "farming:seed_wheat", "flowers:seaweed" },
	})
end

if minetest.get_modpath("seaplants") ~= nil then
	minetest.register_craft({
		type = "shapeless",
		output = "sas_core:sushi",
		recipe = {"sas_core:fish_cooked", "farming:seed_wheat", "seaplants:kelpgreen" },

	})
end

-----------------------------------------------------------------------------------------------
-- Roasted Shark
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "cooking",
	output = "sas_core:shark_cooked",
	recipe = "sas_core:shark_raw",
	cooktime = 2,
})

-----------------------------------------------------------------------------------------------
-- Roasted Pike
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "cooking",
	output = "sas_core:pike_cooked",
	recipe = "sas_core:pike_raw",
	cooktime = 2,
})

--[[
-- baitball
minetest.register_craftitem("sas_core:baitball", {
	description = default_setting.func.S("Bait Ball"),
	inventory_image = "fishing_baitball.png",
	stack_max = 99,
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball 20",
	recipe = {"farming:flour", "farming:corn", "bucket:bucket_water"},
	replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
})
]]

-- baitball_shark
minetest.register_craftitem("sas_core:baitball_shark", {
	description = default_setting.func.S("Shark Bait Ball"),
	inventory_image = "fishing_baitball_shark.png",
	stack_max = 99,
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:fish_raw", "sas_core:fish_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:clownfish_raw", "sas_core:clownfish_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:clownfish_raw", "sas_core:fish_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:bluewhite_raw", "sas_core:bluewhite_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:bluewhite_raw", "sas_core:fish_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:clownfish_raw", "sas_core:bluewhite_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:clownfish_raw", "sas_core:shark_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:clownfish_raw", "sas_core:pike_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:bluewhite_raw", "sas_core:shark_raw"}
})
minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:bluewhite_raw", "sas_core:pike_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:shark_raw", "sas_core:shark_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:pike_raw", "sas_core:pike_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:fish_raw", "sas_core:shark_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:fish_raw", "sas_core:pike_raw"}
})

minetest.register_craft({
	type = "shapeless",
	output = "sas_core:baitball_shark 20",
	recipe = {"sas_core:shark_raw", "sas_core:pike_raw"}
})

