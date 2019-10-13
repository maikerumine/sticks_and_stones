
minetest.register_alias("default:fish_raw", "sas_core:fish_raw")
minetest.register_alias("default:fish_cooked", "sas_core:fish_cooked")
minetest.register_alias("default:sushi", "sas_core:sushi")
minetest.register_alias("default:clownfish_raw", "sas_core:clownfish_raw")
minetest.register_alias("default:bluewhite_raw", "sas_core:bluewhite_raw")
minetest.register_alias("default:exoticfish_raw", "sas_core:exoticfish_raw")
minetest.register_alias("default:carp_raw", "sas_core:carp_raw")
minetest.register_alias("default:perch_raw", "sas_core:perch_raw")
minetest.register_alias("default:catfish_raw", "sas_core:catfish_raw")
minetest.register_alias("default:shark_raw", "sas_core:shark_raw")
minetest.register_alias("default:shark_cooked", "sas_core:shark_cooked")
minetest.register_alias("default:pike_raw", "sas_core:pike_raw")
minetest.register_alias("default:pike_cooked", "sas_core:pike_cooked")

-------------------------------------------------------------------------------------------
-- Fishing - crabman77 version
-- Rewrited from original Fishing - Mossmanikin's version - Fishes 0.0.4
-- License (code & textures): WTFPL
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Fish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:fish_raw", {
	description = default_setting.func.S("Fish"),
	groups = {},
	inventory_image = "fishing_fish_raw.png",
	 on_use = minetest.item_eat(2),
})
	-----------------------------------------------------
	-- Roasted Fish
	-----------------------------------------------------
	minetest.register_craftitem("sas_core:fish_cooked", {
		description = default_setting.func.S("Roasted Fish"),
		groups = {},
		inventory_image = "fishing_fish_cooked.png",
		on_use = minetest.item_eat(4),
	})
	-----------------------------------------------------
	-- Sushi
	-----------------------------------------------------
	minetest.register_craftitem("sas_core:sushi", {
		description = default_setting.func.S("Sushi (Hoso Maki)"),
		groups = {},
		inventory_image = "fishing_sushi.png",
		on_use = minetest.item_eat(6),
	})

-----------------------------------------------------------------------------------------------
-- clownfish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:clownfish_raw", {
	description = default_setting.func.S("Clownfish"),
	groups = {},
	inventory_image = "fishing_clownfish_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- bluewhite
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:bluewhite_raw", {
	description = default_setting.func.S("Bluewhite"),
	groups = {},
	inventory_image = "fishing_bluewhite_raw.png",
	 on_use = minetest.item_eat(2),
})
-----------------------------------------------------------------------------------------------
-- exoticfish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:exoticfish_raw", {
	description = default_setting.func.S("Exotic"),
	groups = {},
	inventory_image = "fishing_exoticfish_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- carp
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:carp_raw", {
	description = default_setting.func.S("Carp"),
	groups = {},
	inventory_image = "fishing_carp_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- perch
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:perch_raw", {
	description = default_setting.func.S("Perch"),
	groups = {},
	inventory_image = "fishing_perch_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- catfish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:catfish_raw", {
	description = default_setting.func.S("Catfish"),
	groups = {},
	inventory_image = "fishing_catfish_raw.png",
	 on_use = minetest.item_eat(2),
})


-----------------------------------------------------------------------------------------------
-- Whatthef... it's a freakin' Shark!
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:shark_raw", {
	description = default_setting.func.S("Shark"),
	groups = {},
	inventory_image = "fishing_shark_raw.png",
	 on_use = minetest.item_eat(2),
})
	-----------------------------------------------------
	-- Roasted Shark
	-----------------------------------------------------
	minetest.register_craftitem("sas_core:shark_cooked", {
		description = default_setting.func.S("Roasted Shark"),
		groups = {},
		inventory_image = "fishing_shark_cooked.png",
		on_use = minetest.item_eat(6),
	})

-----------------------------------------------------------------------------------------------
-- Pike
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("sas_core:pike_raw", {
	description = default_setting.func.S("Northern Pike"),
	groups = {},
	inventory_image = "fishing_pike_raw.png",
	 on_use = minetest.item_eat(2),
})
	-----------------------------------------------------
	-- Roasted Pike
	-----------------------------------------------------
	minetest.register_craftitem("sas_core:pike_cooked", {
		description = default_setting.func.S("Roasted Northern Pike"),
		groups = {},
		inventory_image = "fishing_pike_cooked.png",
		on_use = minetest.item_eat(6),
	})
