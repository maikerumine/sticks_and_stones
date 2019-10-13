
minetest.register_alias("default:charcoal_chips", "sas_core:charcoal_chips")
minetest.register_alias("default:charcoal", "sas_core:charcoal")

-- mods/default/craftitems.lua


minetest.register_craftitem("sas_core:charcoal_chips", {
	description = "Charcoal Chips",
	inventory_image = "more_fire_charcoal_chips.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craftitem("sas_core:charcoal", {
	description = "Charcoal Lump",
	inventory_image = "more_fire_charcoal_lump.png",
	groups = {coal = 1, flammable = 1}
})


