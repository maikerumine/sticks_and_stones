
-- baitball
--[[
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
