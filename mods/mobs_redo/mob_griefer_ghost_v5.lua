
--Andrey created mob for his world needs


mobs:register_mob("mobs:griefer_ghost", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	attack_specific =  {"player","mobs:Griefer_Garry"},
	--local specific_attack = function(list, what)
	--'attack_specific' has a table of entity names that monsters can attack {"player", "mobs_animal:chicken"}
	pathfinding = 1,
	reach = 2,
	hp_min = 15,
	hp_max = 22,
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character_mt5.b3d",
	textures = {
	{
	"mobs_herobrines_bloody_ghost.png^[makealpha:0,0,0",
	"3d_armor_trans.png",
	minetest.registered_items["default:torch"].inventory_image,
	}
	},
	visual_size = {x=1, y=1},
	--makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2.5,
	drops = {
		{name = "default:junglegrass",
		chance = 20,
		min = 1,
		max = 2,
		},
		{name = "default:grass_1",
		chance = 20,
		min = 1,
		max = 2,
		},
		{name = "default:cactus",
		chance = 30,
		min = 1,
		max = 2,
		},
		{name = "default:obsidian",
		chance = 30,
		min = 1,
		max = 2,
		},
		
		{name = "default:torch",
		chance = 1,
		min = 1,
		max = 4,},

	},

	light_resistant = true,
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 1,
	light_damage = 10,
	attack_type = "dogfight",
	lifetimer=300,
	group_attack = true,
	fear_height = 3,
	sounds = {
		random = "fire_large",
		war_cry = "mobs_eerie",
		death = "mobs_mc_zombie_death",
		damage = "mobs_mc_ender_dragon_shoot",
		attack = "mobs_mc_ender_dragon_attack",
		distance = 60,
	},

	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
		on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
		self.object:remove()

		minetest.add_particlespawner({
			amount = 20,
			time = 0.25,
			minpos = pos,
			maxpos = pos,
			minvel = {x = -2, y = -2, z = -2},
			maxvel = {x = 2, y = 2, z = 2},
			minacc = {x = 0, y = -10, z = 0},
			maxacc = {x = 0, y = -10, z = 0},
			minexptime = 0.1,
			maxexptime = 1,
			minsize = 0.5,
			maxsize = 1.0,
			texture = "fire_basic_flame.png",
		})
	end,
})

--mobs:spawn_specfic(name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height, day_toggle, on_spawn)
--mobs:register_spawn("mobs_monster:dirt_monster",{"default:dirt_with_grass", "ethereal:gray_dirt"}, 7, 0, 7000, 1, 31000, false)
--mobs:register_spawn("mobs:griefer_ghost", {"default:stone"}, 7, 0, 7000, 1, 3100)
mobs:spawn_specific("mobs:griefer_ghost", {"default:stone"}, {"air"},
	0, 7, 35, 7000, 1, -5000, -50)


--[[

minetest.register_node("mobs:cursed_stone", {
	description = "Cursed stone",
	tiles = {
		"mobs_cursed_stone_top.png",
		"mobs_cursed_stone_bottom.png",
		"mobs_cursed_stone.png",
		"mobs_cursed_stone.png",
		"mobs_cursed_stone.png",
		"mobs_cursed_stone.png"
	},
	is_ground_content = false,
	groups = {cracky=1, level=2},
	drop = 'default:goldblock',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craft({
	output = 'mobs:cursed_stone',
	recipe = {
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:goldblock', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
	}
})
--mobs:spawn_specfic(name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height, day_toggle, on_spawn)
mobs:spawn_specific("mobs:griefer_ghost", {"mobs:cursed_stone"}, {"air"},
	0, 5, 5, 30, 8, -520, 31000)
]]
	
if minetest.setting_get("log_mods") then
	minetest.log("action", "Just Test 2 mobs loaded")
end
