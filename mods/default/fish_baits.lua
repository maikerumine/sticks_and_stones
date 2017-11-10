
--fish bait
--bait_corn
--[[
minetest.register_craftitem("default:bait_corn", {
	description = default_setting.func.S("Bait Corn"),
	inventory_image = "fishing_bait_corn.png",
})

default_setting.baits["default:bait_corn"] = { ["bait"] = "default:bait_corn", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_corn.png", ["hungry"] = 50 }
]]
--bait_bread
minetest.register_craftitem("default:bait_bread", {
	description = default_setting.func.S("Bait Bread"),
	inventory_image = "fishing_bait_bread.png",
})

default_setting.baits["default:bait_bread"] = { ["bait"] = "default:bait_bread", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_bread.png", ["hungry"] = 50 }

--bait_worm
default_setting.baits["default:bait_worm"] = { ["bait"] = "default:bait_worm", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["survival:worm_raw"] = { ["bait"] = "survival:worm_raw", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }

--bait_bugs
default_setting.baits["survival:milipede_raw"] = { ["bait"] = "survival:milipede_raw", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["survival:centipede_raw"] = { ["bait"] = "survival:centipede_raw", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["survival:cricket_raw"] = { ["bait"] = "survival:cricket_raw", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["survival:slug_raw"] = { ["bait"] = "survival:slug_raw", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["survival:fiddlehead"] = { ["bait"] = "survival:fiddlehead", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }
default_setting.baits["survival:ferntuber"] = { ["bait"] = "survival:ferntuber", ["bobber"] = "default:bobber_fish_entity",["texture"] = "fishing_bait_worm.png", ["hungry"] = 50 }



--shark bait
default_setting.baits["default:baitball_shark"] = { ["bait"] = "default:baitball_shark", ["bobber"] = "default:bobber_shark_entity",["texture"] = "fishing_fish_raw.png", ["hungry"] = 50 }
default_setting.baits["mobs:meat_raw"] = { ["bait"] = "mobs:meat_raw", ["bobber"] = "default:bobber_shark_entity",["texture"] = "fishing_fish_raw.png", ["hungry"] = 50 }

--bait_fish
default_setting.baits["default:fish_raw"] = { ["bait"] = "default:fish_raw", ["bobber"] = "default:bobber_shark_entity",["texture"] = "fishing_fish_raw.png", ["hungry"] = 50 }

default_setting.baits["default:clownfish_raw"] = { ["bait"] = "default:clownfish_raw", ["bobber"] = "default:bobber_shark_entity",["texture"] = "fishing_clownfish_raw.png", ["hungry"] = 50 }

default_setting.baits["default:bluewhite_raw"] = { ["bait"] = "default:bluewhite_raw", ["bobber"] = "default:bobber_shark_entity",["texture"] = "fishing_bluewhite_raw.png", ["hungry"] = 50 }

default_setting.baits["default:exoticfish_raw"] = { ["bait"] = "default:exoticfish_raw", ["bobber"] = "default:bobber_shark_entity",["texture"] = "fishing_exoticfish_raw.png", ["hungry"] = 50 }
