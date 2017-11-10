

minetest.register_node("default:reinforced_chalk", {
  description = "Reinforced Chalk",
	tiles = {"darkage_reinforced_chalk.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("default:reinforced_wood", {
  description = "Reinforced Wood",
	tiles = {"darkage_reinforced_wood.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("default:reinforced_wood_right", {
  description = "Reinforced Wood Right",
	tiles = {"darkage_reinforced_wood_right.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("default:reinforced_wood_left", {
  description = "Reinforced Wood Left",
	tiles = {"darkage_reinforced_wood_left.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})


minetest.register_node("default:reinforced_wood", {
  description = "Reinforced Wood",
	tiles = {"darkage_reinforced_wood.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_stone_defaults()
})


minetest.register_craft({
	output = 'default:reinforced_chalk',
	recipe = {
    {'default:stick','','default:stick'},
    {'','default:chalk',''},
    {'default:stick','','default:stick'},
	}
})

minetest.register_craft({
	output = 'default:reinforced_wood',
	recipe = {
    {'default:stick','','default:stick'},
    {'','default:wood',''},
    {'default:stick','','default:stick'},
	}
})

minetest.register_craft({
	output = 'default:wood',
	recipe = {
    {'default:reinforced_wood'},
	}
})

minetest.register_craft({
	output = 'default:reinforced_wood_left',
	recipe = {
    {'default:stick','',''},
    {'','default:wood',''},
    {'','','default:stick'},
	}
})

minetest.register_craft({
	output = 'default:wood',
	recipe = {
    {'default:reinforced_wood_left'},
	}
})

minetest.register_craft({
	output = 'default:reinforced_wood_right',
	recipe = {
    {'','','default:stick'},
    {'','default:wood',''},
    {'default:stick','',''},
	}
})

minetest.register_craft({
	output = 'default:wood',
	recipe = {
    {'default:reinforced_wood_right'},
	}
})
