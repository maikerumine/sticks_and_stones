-- mods/default/craftitems.lua

minetest.register_craftitem("default:coal_lump", {
	description = "Coal Lump",
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craftitem("default:charcoal_chips", {
	description = "Charcoal Chips",
	inventory_image = "more_fire_charcoal_chips.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craftitem("default:charcoal", {
	description = "Charcoal Lump",
	inventory_image = "more_fire_charcoal_lump.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craftitem("default:clay_brick", {
	description = "Clay Brick",
	inventory_image = "default_clay_brick.png",
})

minetest.register_craftitem("default:clay_lump", {
	description = "Clay Lump  --Bake in furnace to get brick",
	inventory_image = "default_clay_lump.png",
})

minetest.register_craftitem("default:flint", {
	description = "Flint",
	inventory_image = "default_flint.png"
})
