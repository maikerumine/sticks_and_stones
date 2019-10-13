
minetest.register_alias("default:bait_bread", "sas_core:bait_bread")
minetest.register_alias("default:bait_worm", "sas_core:bait_worm")
minetest.register_alias("default:worm_raw", "sas_core:worm_raw")



--fish bait
--bait_corn
--[[
minetest.register_craftitem("sas_core:bait_corn", {
	description = default_setting.func.S("Bait Corn"),
	inventory_image = "fishing_bait_corn.png",
})

default_setting.baits["sas_core:bait_corn"] = { ["bait"] = "sas_core:bait_corn", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_corn.png", ["hungry"] = 50 }
]]
--bait_bread
minetest.register_craftitem("sas_core:bait_bread", {
	description = default_setting.func.S("Bait Bread"),
	inventory_image = "fishing_bait_bread.png",
})

default_setting.baits["sas_core:bait_bread"] = { ["bait"] = "sas_core:bait_bread", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_bread.png", ["hungry"] = 50 }

--bait_worm
default_setting.baits["sas_core:bait_worm"] = { ["bait"] = "sas_core:bait_worm", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["sas_core:worm_raw"] = { ["bait"] = "sas_core:worm_raw", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }

--bait_bugs
default_setting.baits["sas_core:milipede_raw"] = { ["bait"] = "sas_core:milipede_raw", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["sas_core:centipede_raw"] = { ["bait"] = "sas_core:centipede_raw", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["sas_core:cricket_raw"] = { ["bait"] = "sas_core:cricket_raw", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["sas_core:slug_raw"] = { ["bait"] = "sas_core:slug_raw", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["sas_core:fiddlehead"] = { ["bait"] = "sas_core:fiddlehead", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["sas_core:ferntuber"] = { ["bait"] = "sas_core:ferntuber", ["bobber"] = "sas_core:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }



--shark bait
default_setting.baits["sas_core:baitball_shark"] = { ["bait"] = "sas_core:baitball_shark", ["bobber"] = "sas_core:bobber_shark_entity",["texture"] = "fishing_fish_raw.png", ["hungry"] = 50 }
default_setting.baits["mobs:meat_raw"] = { ["bait"] = "mobs:meat_raw", ["bobber"] = "sas_core:bobber_shark_entity",["texture"] = "fishing_fish_raw.png", ["hungry"] = 50 }

--bait_fish
default_setting.baits["sas_core:fish_raw"] = { ["bait"] = "sas_core:fish_raw", ["bobber"] = "sas_core:bobber_shark_entity",["texture"] = "fishing_fish_raw.png", ["hungry"] = 50 }

default_setting.baits["sas_core:clownfish_raw"] = { ["bait"] = "sas_core:clownfish_raw", ["bobber"] = "sas_core:bobber_shark_entity",["texture"] = "fishing_clownfish_raw.png", ["hungry"] = 50 }

default_setting.baits["sas_core:bluewhite_raw"] = { ["bait"] = "sas_core:bluewhite_raw", ["bobber"] = "sas_core:bobber_shark_entity",["texture"] = "fishing_bluewhite_raw.png", ["hungry"] = 50 }

default_setting.baits["sas_core:exoticfish_raw"] = { ["bait"] = "sas_core:exoticfish_raw", ["bobber"] = "sas_core:bobber_shark_entity",["texture"] = "fishing_exoticfish_raw.png", ["hungry"] = 50 }
