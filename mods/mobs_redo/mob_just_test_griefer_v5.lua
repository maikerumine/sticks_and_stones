	
-------------------------
--BAD NPC
-------------------------

mobs:register_mob("mobs:Griefer_Garry", {
	type = "monster",
	docile_by_day = true,
	passive = false,
	attack_type = "dogfight",
	specific_attack =  {"player","mobs:griefer_ghost"},
	--local specific_attack = function(list, what)
	--'attack_specific' has a table of entity names that monsters can attack {"player", "mobs_animal:chicken"}
	pathfinding = 1,
	reach = 2,
	hp_min = 18,
	hp_max = 40,
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character_mt5.b3d",
	--If more char

	textures = {
		{"character_1.png",  "3d_armor_trans.png", minetest.registered_items["default:iron_bloom_material"].inventory_image,},
		{"character_2.png",  "3d_armor_trans.png", minetest.registered_items["default:steel_bar"].inventory_image,},
		{"character_3.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_steel_saw"].inventory_image,},
		{"character_4.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_steel_tongs"].inventory_image,},
		{"character_5.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_steel_reamer"].inventory_image,},
		{"character_6.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_climbing_pick"].inventory_image,},
		{"character_7.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_sword_hardened_steel"].inventory_image,},
		{"character_8.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_hammer"].inventory_image,},
		{"character_9.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_pick_hardened_steel"].inventory_image,},
		{"character_10.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_shovel_steel"].inventory_image,},
		{"character_11.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_axe_iron"].inventory_image,},
		{"character_12.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_axe_steel"].inventory_image,},
		{"character_13.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_axe_hardened_steel"].inventory_image,},
		{"character_14.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_sword_stone"].inventory_image,},
		{"character_15.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_sword_iron"].inventory_image,},
		{"character_16.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_sword_steel"].inventory_image,},
		{"character_17.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_sword_hardened_steel"].inventory_image,},
		{"character_18.png",  "3d_armor_trans.png", minetest.registered_items["default:redhot_steel_ingot"].inventory_image,},
		{"character_19.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_sword_hardened_steel"].inventory_image,},
		{"character_20.png",  "3d_armor_trans.png", minetest.registered_items["default:fish_raw"].inventory_image,},
		{"character_21.png",  "3d_armor_trans.png", minetest.registered_items["default:fish_cooked"].inventory_image,},
		{"character_22.png",  "3d_armor_trans.png", minetest.registered_items["default:clownfish_raw"].inventory_image,},
		{"character_23.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_bow_3"].inventory_image,},
		{"character_24.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_bow_dropped"].inventory_image,},
		{"character_25.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_battleaxe"].inventory_image,},
		{"character_26.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_crossbow"].inventory_image,},
		{"character_27.png",  "3d_armor_trans.png", minetest.registered_items["farming:hoe_steel"].inventory_image,},
		{"character_28.png",  "3d_armor_trans.png", minetest.registered_items["farming:hoe_steel"].inventory_image,},
		{"character_29.png",  "3d_armor_trans.png", minetest.registered_items["default:tool_battleaxe"].inventory_image,},
		{"character_30.png",  "3d_armor_trans.png", minetest.registered_items["default:handle_long"].inventory_image,},
		{"character_31.png",  "3d_armor_trans.png", minetest.registered_items["default:handle_medium"].inventory_image,},
		{"character_32.png",  "3d_armor_trans.png", minetest.registered_items["farming:hoe_stone"].inventory_image,},
		{"character_33.png",  "3d_armor_trans.png", minetest.registered_items["farming:hoe_stone"].inventory_image,},
		{"character_34.png",  "3d_armor_trans.png", minetest.registered_items["default:steel_nugget"].inventory_image,},
		{"character_35.png",  "3d_armor_trans.png", minetest.registered_items["default:exoticfish_raw"].inventory_image,},
		{"character_36.png",  "3d_armor_trans.png", minetest.registered_items["default:perch_raw"].inventory_image,},
		{"character_37.png",  "3d_armor_trans.png", minetest.registered_items["default:steel_spring_heavy"].inventory_image,},
		{"character_38.png",  "3d_armor_trans.png", minetest.registered_items["default:iron_hardware"].inventory_image,},

	},
	
	--[[
	textures = {
	{
	"garry.png",
	"3d_armor_trans.png",
	minetest.registered_items["default:tool_sword_hardened_steel"].inventory_image,
	--minetest.registered_items["shields:shield_enhanced_wood"].inventory_image,
	}
	},
	]]
	
	
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 2.5,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:apple",
		chance = 3,
		min = 1,
		max = 1,},
		
		--{name = "default:tool_pick_redhot_iron",
		--chance = 27,
		--min = 1,
		--max = 1,},
		--[[
		{name = "flowers:flower_dandelion_yellow",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_geranium",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_viola",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_dandelion_white",
		chance = 27,
		min = 0,
		max = 1,},
		]]
	},

	light_resistant = true,
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 1,
	--light_damage = 100,
	attack_type = "dogfight",
	lifetimer=300,
	group_attack = true,
	fear_height = 3,
	sounds = {
		--random = "mobs_mc_zombie_growl",
		random = "mobs_dirtmonster",
		war_cry = "mobs_swing",
		death = "mobs_mc_zombie_death",
		damage = "heads_ow",
		distance = 16,
	},

	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	
	on_die = function(self, pos)
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z}, {name = "fire:basic_flame"})
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "fire:basic_flame"})
		minetest.set_node({x = pos.x - 1, y = pos.y - 1, z = pos.z}, {name = "fire:basic_flame"})
		minetest.set_node({x = pos.x + 1, y = pos.y - 1, z = pos.z}, {name = "fire:basic_flame"})
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z - 1}, {name = "fire:basic_flame"})
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z + 1}, {name = "fire:basic_flame"})


		self.object:remove()
		minetest.sound_play({ pos = pos, name = "mobs_spell", gain = 10, max_hear_distance = 500 })
		minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
		local garryghost = minetest.add_entity(self.object:getpos(), "mobs:Griefer_Garry_Ghost")
		local garryghost = minetest.add_entity(self.object:getpos(), "mobs:GrIefer_Garry_Ghost")
		local garryghost = minetest.add_entity(self.object:getpos(), "mobs:Griffer_Garry_Ghost")
		local garryghost = minetest.add_entity(self.object:getpos(), "mobs:Griefer_Gary_Ghost")
		local ent = garryghost:get_luaentity()
		
		minetest.add_particlespawner({
			amount = 120,
			time = 2.25,
			minpos = pos,
			maxpos = pos,
			minvel = {x = -2, y = -0.25, z = -2},
			maxvel = {x = 2, y = 2, z = 2},
			minacc = {x = 0, y = 1, z = 0},
			maxacc = {x = 2, y = 10, z = 2},
			minexptime = 0.1,
			maxexptime = 3,
			minsize = 0.5,
			maxsize = 1.0,
			texture = "mobs_blood.png",
		})
		
		
	end,
--[[
	on_die =function(self, pos)
		minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
		garryghost = minetest.add_entity(self.object:getpos(), "mobs:Griefer_Garry_Ghost")
		garryghost = minetest.add_entity(self.object:getpos(), "mobs:GrIefer_Garry_Ghost")
		garryghost = minetest.add_entity(self.object:getpos(), "mobs:Griffer_Garry_Ghost")
		garryghost = minetest.add_entity(self.object:getpos(), "mobs:Griefer_Gary_Ghost")
		ent = garryghost:get_luaentity()
	end
]]	
	
})

mobs:register_egg("mobs:Griefer_Garry", "Griefer_Garry", "garry.png", 0)

--mobs:spawn_specfic(name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height, day_toggle, on_spawn)
mobs:spawn_specific("mobs:Griefer_Garry",{ "group:crumbly"}, {"air"},
	0, 6, 35, 3000, 1, -50, 31000)
	
	
mobs:register_mob("mobs:Griefer_Garry_Ghost", {
	type = "monster",
	--docile_by_day = true,
	passive = false,
	attack_type = "dogfight",
	specific_attack =  {"player","mobs:griefer_ghost"},
	--local specific_attack = function(list, what)
	--'attack_specific' has a table of entity names that monsters can attack {"player", "mobs_animal:chicken"}
	pathfinding = 2,
	reach = 2,
	hp_min = 25,
	hp_max = 40,
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character_mt5.b3d",
	textures = {
	{
	"character_32_ghost.png^[makealpha:255,255,255",
	"3d_armor_trans.png",
	minetest.registered_items["default:tool_pick_redhot_iron"].inventory_image,
	--minetest.registered_items["shields:shield_enhanced_wood"].inventory_image,
	}
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 2.5,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:head_1",
		chance = 77,
		min = 0,
		max = 1,},
		
		{name = "default:tool_pick_redhot_iron",
		chance = 27,
		min = 0,
		max = 1,},
		--[[
		{name = "flowers:flower_dandelion_yellow",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_geranium",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_viola",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_dandelion_white",
		chance = 27,
		min = 0,
		max = 1,},
		]]
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
		random = "mobs_mc_zombie_growl",
		war_cry = "mobs_eerie",
		death = "mobs_mc_zombie_death",
		damage = "mobs_mc_zombie_hurt",
		distance = 16,
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
mobs:spawn_specific("mobs:Griefer_Garry_Ghost",{ "group:crumbly"}, {"air"},
	0, 6, 35, 13000, 1, -500, -12)	

mobs:register_mob("mobs:GrIefer_Garry_Ghost", {
	type = "monster",
	--docile_by_day = true,
	passive = false,
	attack_type = "dogfight",
	specific_attack =  {"player","mobs:griefer_ghost"},
	--local specific_attack = function(list, what)
	--'attack_specific' has a table of entity names that monsters can attack {"player", "mobs_animal:chicken"}
	pathfinding = 2,
	reach = 2,
	hp_min = 25,
	hp_max = 40,
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character_mt5.b3d",
	textures = {
	{
	"character_32_ghost.png^[makealpha:255,255,255",
	"3d_armor_trans.png",
	minetest.registered_items["default:tool_axe_redhot_iron"].inventory_image,
	}
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 2.5,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:head_1",
		chance = 27,
		min = 0,
		max = 1,},
		
		{name = "default:tool_axe_redhot_iron",
		chance = 27,
		min = 0,
		max = 1,},
		--[[
		{name = "flowers:flower_dandelion_yellow",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_geranium",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_viola",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_dandelion_white",
		chance = 27,
		min = 0,
		max = 1,},
		]]
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
		random = "mobs_mc_zombie_growl",
		war_cry = "mobs_eerie",
		death = "mobs_mc_zombie_death",
		damage = "mobs_mc_zombie_hurt",
		distance = 16,
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
mobs:spawn_specific("mobs:GrIefer_Garry_Ghost",{ "group:crumbly"}, {"air"},
	0, 6, 35, 13000, 1, -500, -12)	


mobs:register_mob("mobs:Griffer_Garry_Ghost", {
	type = "monster",
	--docile_by_day = true,
	passive = false,
	attack_type = "dogfight",
	specific_attack =  {"player","mobs:griefer_ghost"},
	--local specific_attack = function(list, what)
	--'attack_specific' has a table of entity names that monsters can attack {"player", "mobs_animal:chicken"}
	pathfinding = 2,
	reach = 2,
	hp_min = 25,
	hp_max = 40,
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character_mt5.b3d",
	textures = {
	{
	"character_32_ghost.png^[makealpha:255,255,255",
	"3d_armor_trans.png",
	minetest.registered_items["default:tool_shovel_redhot_iron"].inventory_image,
	}
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 2.5,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:head_1",
		chance = 77,
		min = 0,
		max = 1,},
		
		{name = "default:tool_shovel_redhot_iron",
		chance = 27,
		min = 0,
		max = 1,},
		--[[
		{name = "flowers:flower_dandelion_yellow",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_geranium",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_viola",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_dandelion_white",
		chance = 27,
		min = 0,
		max = 1,},
		]]
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
		random = "mobs_mc_zombie_growl",
		war_cry = "mobs_eerie",
		death = "mobs_mc_zombie_death",
		damage = "mobs_mc_zombie_hurt",
		distance = 16,
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
mobs:spawn_specific("mobs:Griffer_Garry_Ghost",{ "group:crumbly"}, {"air"},
	0, 6, 35, 13000, 1, -500, -12)	


mobs:register_mob("mobs:Griefer_Gary_Ghost", {
	type = "monster",
	--docile_by_day = true,
	passive = false,
	attack_type = "dogfight",
	specific_attack =  {"player","mobs:griefer_ghost"},
	--local specific_attack = function(list, what)
	--'attack_specific' has a table of entity names that monsters can attack {"player", "mobs_animal:chicken"}
	pathfinding = 2,
	reach = 2,
	hp_min = 25,
	hp_max = 40,
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character_mt5.b3d",
	textures = {
	{
	"character_32_ghost.png^[makealpha:255,255,255",
	"3d_armor_trans.png",
	minetest.registered_items["default:tool_sword_redhot_iron"].inventory_image,
	}
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 2.5,
	run_velocity = 3.4,
	damage = 2,
	drops = {
		{name = "default:head_1",
		chance = 77,
		min = 0,
		max = 1,},
		
		{name = "default:tool_sword_redhot_iron",
		chance = 27,
		min = 0,
		max = 1,},
		--[[
		{name = "flowers:flower_dandelion_yellow",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_geranium",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_viola",
		chance = 27,
		min = 0,
		max = 1,},
		{name = "flowers:flower_dandelion_white",
		chance = 27,
		min = 0,
		max = 1,},
		]]
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
		random = "mobs_mc_zombie_growl",
		war_cry = "mobs_eerie",
		death = "mobs_mc_zombie_death",
		damage = "mobs_mc_zombie_hurt",
		distance = 16,
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
mobs:spawn_specific("mobs:Griefer_Gary_Ghost",{ "group:crumbly"}, {"air"},
	0, 6, 35, 13000, 1, -500, -12)	

--mobs:alias_mob("mobs:griefer_ghost", "mobs:Griefer_Gary_Ghost") -- compatibility
	
if minetest.setting_get("log_mods") then
	minetest.log("action", "Just Test 2 mobs loaded")
end
