
minetest.register_alias("default:baitball_shark", "sas_core:baitball_shark")


-- baitball
--[[
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
