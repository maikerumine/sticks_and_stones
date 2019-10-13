
minetest.register_alias("default:ammo", "sas_core:ammo")
minetest.register_alias("default:rifle", "sas_core:rifle")


--[[]]
sas_core = {
	time = 0,
	objects = {},
	rounds = {},
	shots = {},
	update_time = 0,
	reload_time = 0,
}
--[[]]
SAS_CORE_ADMIN_WEAPONS = false
SAS_CORE_ENABLE_BLASTING = true
SAS_CORE_ENABLE_CROSSBOW = false
SAS_CORE_ENABLE_GUNS = true
SAS_CORE_ENABLE_FLARES = false
SAS_CORE_ENABLE_HOOK = false
SAS_CORE_ENABLE_GRENADES = false
SAS_CORE_ENABLE_ROCKETS = false
SAS_CORE_ENABLE_TURRETS = false
SAS_CORE_ENABLE_CRAFTING = true
SAS_CORE_ENABLE_PARTICLE_FX = true
SAS_CORE_ENABLE_PROTECTION = true
SAS_CORE_EXPLOSION_TEXTURE = "shooter_hit.png"
SAS_CORE_ALLOW_NODES = true
SAS_CORE_ALLOW_ENTITIES = true
SAS_CORE_ALLOW_PLAYERS = false
SAS_CORE_OBJECT_RELOAD_TIME = 1
SAS_CORE_OBJECT_UPDATE_TIME = 0.25
SAS_CORE_ROUNDS_UPDATE_TIME = 8
SAS_CORE_PLAYER_OFFSET = {x=0, y=1, z=0}
SAS_CORE_ENTITIES = {
	"mobs_monster:dirt_monster",
	"mobs_monster:stone_monster",
	"mobs_monster:sand_monster",
	"mobs_monster:tree_monster",
	"mobs_monster:lava_flan",
	"mobs_monster:mese_monster",
	"mobs_monster:dungeon_master",
	"mobs_monster:oerkki",
	"mobs_monster:spider",
	"mobs_mc:cow",
	"mobs_mc:pig",
	"mobs_mc:sheep",
	"mobs_mc:zombie",
	"mobs_mc:zombiepigman",
	"mobs_mc:skeleton",
	"mobs_mc:creeper",
	"mobs_mc:spider",
	"mobs_mc:ghast",
	"mobs_mc:enderman",
	"mobs_mc:greensmall",
	"mobs_mc:greenmedium",
	"mobs_mc:greenbig",
	"mobs_mc:lavasmall",
	"mobs_mc:lavabig",
	"mobs_animal:rat",
	"mobs_monster:oerkki",
	"mobs_badplayer:dungeon_master",
	"mobs_badplayer:badplayer1",
	"mobs_badplayer:badplayer2",
	"mobs_badplayer:badplayer3",
	"mobs_badplayer:badplayer4",
	"mobs_badplayer:badplayer5",
	"mobs_badplayer:badplayer6",
	"mobs_badplayer:badplayer7",
	"mobs_badplayer:badplayer8",
	"mobs_badplayer:badplayer9",
	"mobs_badplayer:badplayer10",
	"mobs_badplayer:badplayer11",
	"mobs_badplayer:badplayer12",
	"mobs_badplayer:badplayer13",
	"mobs_badplayer:badplayer14",
	"mobs_badplayer:badplayer15",
	"mobs_badplayer:badplayer16",
	"mobs_badplayer:badplayer17",
	"mobs_badplayer:badplayer18",
	"mobs_badplayer:badplayer19",
	"mobs_badplayer:badplayer20",
	"mobs_badplayer:badplayer21",
	"mobs_badplayer:badplayer22",
	"mobs_badplayer:badplayer23",
	"mobs_badplayer:badplayer24",
	"mobs_badplayer:badplayer25",
	"mobs_badplayer:badplayer26",
	"mobs_badplayer:badplayer27",
	"mobs_badplayer:badplayer28",
	"mobs_badplayer:badplayer29",
	"mobs_badplayer:badplayer30",
	"mobs_badplayer:badplayer31",
	"mobs_badplayer:badplayer32",
	"mobs_badplayer:badplayer33",
	"mobs_badplayer:badplayer34",
	"mobs_badplayer:badplayer35",
	"mobs_badplayer:badplayer36",
	"mobs_monster:tree_monster",
	"mobs_mc:spider",
	"mobs_esmobs:applmons",
	"mobs_esmobs:aggressormob",
	"mobs:sand_monster",
	"mobs:stone_monster",
	"mobs_esmobs:stone_monster2",
	"mobs_monster:oerkki",
	"mobs_animal:sheep",
	"lagsmobs:griefer_ghost",
	"mobs_esmobs:bonemons",
	"lagsmobs:stone_monster",
	"lagsmobs:stonemons",
	"mobs_monster:dirtmons",
	"mobs_monster:dirt",
	"mobs_esmobs:dirt2",
	"mobs_esmobs:blue",
	"mobs_esmobs:spider",
	"mobs_esmobs:snowmon",
	"mobs_esmobs:snowmons",
	"mobs_esmobs:icemons",
	"mobs_esmobs:icemon",
	"mobs_esmobs:watermon",
	"mobs_esmobs:watermons",
	"creatures:zombie",
	"creatures:ghost",
	"mobs_monster:dungeon_master",
	"mobs_mc:wolf",
	"futuremobs:goodbot_fighter",
	"futuremobs:goodbot_gunner",
	"futuremobs:badbot_fighter",
	"futuremobs:badbot_gunner",
	"futuremobs:claw_alien",
	"futuremobs:alien",
	"futuremobs:destroyed_bot",
	"mobs_esmobs:herobrines_bloody_ghost",
	"mobs_esmobs:bomber",
	"mobs_esmobs:bone_monster",
	"mobs_badplayer:Mr_Black",
	"mobs_esmobs:chickoboo",
	"mobs_esmobs:paniki",
	"mobs_animal:sheep_white",
	"mobs_animal:chicken",
	"mobs_animal:cow",
	"mobs_animal:pumba",
	"mobs_esmobs:Infinium_Monster",
	"mobs_esmobs:phoenix",
	"mobs_badplayer:Jasmine",
	"mobs_badplayer:Infinium_Monster",
	"mobs:chicken",
"mobs:cow",
"mobs:dirt_monster",
"mobs:dungeon_master",
"mobs:goat",
"mobs:mese_monster",
"mobs:npc",
"mobs:oerkki",
"mobs:pig",
"mobs:pumba",
"mobs:rat",
"mobs:rhino",
"mobs:sand_monster",
"mobs:sheep",
"mobs:spider",
"mobs:stone_monster",
"mobs:tree_monster",

"mobs:griefer_ghost",
"mobs:Griefer_Garry",
"mobs:Griefer_Garry_Ghost",
"mobs:GrIefer_Garry_Ghost",
"mobs:Griffer_Garry_Ghost",
"mobs:Griefer_Gary_Ghost",
"mobs:shark_lg",
"mobs:shark_md",
"mobs:shark_sm",
"mobs:crocodile",
"mobs:crocodile_float",
"mobs:crocodile_swim",
}

local singleplayer = minetest.is_singleplayer()
if singleplayer then
	SAS_CORE_ENABLE_BLASTING = true
	SAS_CORE_ALLOW_ENTITIES = true
	SAS_CORE_ALLOW_PLAYERS = false
end

local modpath = minetest.get_modpath(minetest.get_current_modname())
local worldpath = minetest.get_worldpath()
local input = io.open(modpath.."/shooter.conf", "r")
if input then
	dofile(modpath.."/shooter.conf")
	input:close()
	input = nil
end
input = io.open(worldpath.."/shooter.conf", "r")
if input then
	dofile(worldpath.."/shooter.conf")
	input:close()
	input = nil
end

local allowed_entities = {}
for _,v in ipairs(SAS_CORE_ENTITIES) do
	allowed_entities[v] = 1
end

local function get_dot_product(v1, v2)
	return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
end

local function get_particle_pos(p, v, d)
	return vector.add(p, vector.multiply(v, {x=d, y=d, z=d}))
end

function sas_core:spawn_particles(pos, texture)
	if SAS_CORE_ENABLE_PARTICLE_FX == true then
		if type(texture) ~= "string" then
			texture = DEFAULT_EXPLOSION_TEXTURE
		end
		local spread = {x=0.1, y=0.1, z=0.1}
		minetest.add_particlespawner(15, 0.3,
			vector.subtract(pos, spread), vector.add(pos, spread),
			{x=-1, y=1, z=-1}, {x=1, y=2, z=1},
			{x=-2, y=-2, z=-2}, {x=2, y=-2, z=2},
			0.1, 0.75, 1, 2, false, texture
		)
	end
end

function sas_core:play_node_sound(node, pos)
	local item = minetest.registered_items[node.name]
	if item then
		if item.sounds then
			local spec = item.sounds.dug
			if spec then
				spec.pos = pos
				minetest.sound_play(spec.name, spec)
			end
		end
	end
end

function sas_core:punch_node(pos, def)
	local node = minetest.get_node(pos)
	if not node then
		return
	end
	local item = minetest.registered_items[node.name]
	if not item then
		return
	end
	if SAS_CORE_ENABLE_PROTECTION then
		if minetest.is_protected(pos, def.name) then
			return
		end
	end
	if item.groups then
		for k, v in pairs(def.groups) do
			local level = item.groups[k] or 0
			if level >= v then
				minetest.remove_node(pos)
				sas_core:play_node_sound(node, pos)
				if item.tiles then
					if item.tiles[1] then
						sas_core:spawn_particles(pos, item.tiles[1])
					end
				end
				break
			end
		end
	end
end

function sas_core:is_valid_object(object)
	if object then
		if object:is_player() == true then
			return SAS_CORE_ALLOW_PLAYERS
		end
		if SAS_CORE_ALLOW_ENTITIES == true then
			local luaentity = object:get_luaentity()
			if luaentity then
				if luaentity.name then
					if allowed_entities[luaentity.name] then
						return true
					end
				end
			end
		end
	end
end

function sas_core:get_intersect_pos(ray, plane, collisionbox)
	local v = vector.subtract(ray.pos, plane.pos)
	local r1 = get_dot_product(v, plane.normal)
	local r2 = get_dot_product(ray.dir, plane.normal)
	if r2 ~= 0 then
		local t = -(r1 / r2)
		local td = vector.multiply(ray.dir, {x=t, y=t, z=t})
		local pt = vector.add(ray.pos, td)
		local pd = vector.subtract(pt, plane.pos)
		if math.abs(pd.x) < collisionbox[4] and
				math.abs(pd.y) < collisionbox[5] and
				math.abs(pd.z) < collisionbox[6] then
			return pt
		end
	end
end

function sas_core:process_round(round)
	local target = {object=nil, distance=10000}
	local p1 = round.pos
	local v1 = round.ray
	for _,ref in ipairs(sas_core.objects) do
		local p2 = vector.add(ref.pos, ref.offset)
		if p1 and p2 and ref.name ~= round.name then
			local d = vector.distance(p1, p2)
			if d < round.def.step and d < target.distance then
				local ray = {pos=p1, dir=v1}
				local plane = {pos=p2, normal={x=-1, y=0, z=-1}}
				local pos = sas_core:get_intersect_pos(ray, plane, ref.collisionbox)
				if pos then
					target.object = ref.object
					target.pos = pos
					target.distance = d
				end
			end
		end
	end
	if target.object and target.pos then
		local success, pos = minetest.line_of_sight(p1, target.pos, 1)
		if success then
			local user = minetest.get_player_by_name(round.name)
			if user then
				target.object:punch(user, nil, round.def.tool_caps, v1)
				sas_core:spawn_particles(target.pos, DEFAULT_EXPLOSION_TEXTURE)
			end
			return 1
		elseif pos and DEFAULT_ALLOW_NODES == true then
			sas_core:punch_node(pos, round.def)
			return 1
		end
	elseif SAS_CORE_ALLOW_NODES == true then
		local d = round.def.step
		local p2 = vector.add(p1, vector.multiply(v1, {x=d, y=d, z=d}))
		local success, pos = minetest.line_of_sight(p1, p2, 1)
		if pos then
			sas_core:punch_node(pos, round.def)
			return 1
		end
	end
end

sas_core.registered_weapons = sas_core.registered_weapons or {}
function sas_core:register_weapon(name, def)
	sas_core.registered_weapons[name] = def
	local shots = def.shots or 1
	local wear = math.ceil(65534 / def.rounds)
	local max_wear = (def.rounds - 1) * wear
	minetest.register_tool(name, {
		description = def.description,
		inventory_image = def.inventory_image,
		on_use = function(itemstack, user, pointed_thing)
			if itemstack:get_wear() < max_wear then
				def.spec.name = user:get_player_name()
				if shots > 1 then
					local step = def.spec.tool_caps.full_punch_interval
					for i = 0, step * shots, step do
						minetest.after(i, function()
							sas_core:fire_weapon(user, pointed_thing, def.spec)
						end)
					end
				else
					sas_core:fire_weapon(user, pointed_thing, def.spec)
				end
				itemstack:add_wear(wear)
			else
				local inv = user:get_inventory()
				if inv then
					local stack = "sas_core:ammo 1"
					if inv:contains_item("main", stack) then
						minetest.sound_play("shooter_reload", {object=user})
						inv:remove_item("main", stack)
						itemstack:replace(name.." 1 1")
					else
						minetest.sound_play("shooter_click", {object=user})
					end
				end
			end
			return itemstack
		end,
	})
end

function sas_core:fire_weapon(user, pointed_thing, def)
	if sas_core.shots[def.name] then
		if sas_core.time < sas_core.shots[def.name] then
			return
		end
	end
	sas_core.shots[def.name] = sas_core.time + def.tool_caps.full_punch_interval
	minetest.sound_play(def.sound, {object=user})
	local v1 = user:get_look_dir()
	local p1 = user:getpos()
	if not v1 or not p1 then
		return
	end
	minetest.add_particle({x=p1.x, y=p1.y + 1.6, z=p1.z},
		vector.multiply(v1, {x=30, y=30, z=30}),
		{x=0, y=0, z=0}, 0.5, 0.25,
		false, def.particle
	)
	if pointed_thing.type == "node" and SAS_CORE_ALLOW_NODES == true then
		local pos = minetest.get_pointed_thing_position(pointed_thing, false)
		sas_core:punch_node(pos, def)
	elseif pointed_thing.type == "object" then
		local object = pointed_thing.ref
		if sas_core:is_valid_object(object) == true then
			object:punch(user, nil, def.tool_caps, v1)
			local p2 = object:getpos()
			local pp = get_particle_pos(p1, v1, vector.distance(p1, p2))
			pp.y = pp.y + 1.75
			sas_core:spawn_particles(pp, SAS_CORE_EXPLOSION_TEXTURE)
		end
	else
		sas_core:update_objects()
		table.insert(sas_core.rounds, {
			name = def.name,
			pos = vector.add(p1, {x=0, y=1.75, z=0}),
			ray = v1,
			dist = 0,
			def = def,
		})
	end
end

function sas_core:load_objects()
	local objects = {}
	if SAS_CORE_ALLOW_PLAYERS == true then
		local players = minetest.get_connected_players()
		for _,player in ipairs(players) do
			local pos = player:getpos()
			local name = player:get_player_name()
			local hp = player:get_hp() or 0
			if pos and name and hp > 0 then
				table.insert(objects, {
					name = name,
					object = player,
					pos = pos,
					collisionbox = {-0.25,-1.0,-0.25, 0.25,0.8,0.25},
					offset = SAS_CORE_PLAYER_OFFSET,
				})
			end
		end
	end
	if SAS_CORE_ALLOW_ENTITIES == true then
		for _,ref in pairs(minetest.luaentities) do
			if ref.object and ref.name then
				if allowed_entities[ref.name] then
					local pos = ref.object:getpos()
					local hp = ref.object:get_hp() or 0
					if pos and hp > 0 then
						local def = minetest.registered_entities[ref.name]
						table.insert(objects, {
							name = ref.name,
							object = ref.object,
							pos = pos,
							collisionbox = def.collisionbox or {0,0,0, 0,0,0},
							offset = SAS_CORE_ENTITY_OFFSET,
						})
					end
				end
			end
		end
	end
	sas_core.reload_time = sas_core.time
	sas_core.update_time = sas_core.time
	sas_core.objects = {}
	for _,v in ipairs(objects) do
		table.insert(sas_core.objects, v)
	end
end

function sas_core:update_objects()
	if sas_core.time - sas_core.reload_time > SAS_CORE_OBJECT_RELOAD_TIME then
		sas_core:load_objects()
	elseif sas_core.time - sas_core.update_time > SAS_CORE_OBJECT_UPDATE_TIME then
		for i, ref in ipairs(sas_core.objects) do
			if ref.object then
				local pos = ref.object:getpos()
				if pos then
					sas_core.objects[i].pos = pos
				end
			else
				table.remove(sas_core.objects, i)
			end
		end
		sas_core.update_time = sas_core.time
	end
end

function sas_core:blast(pos, radius, fleshy, distance, user)
	if not user then
		return
	end
	local name = user:get_player_name()
	local pos = vector.round(pos)
	local p1 = vector.subtract(pos, radius)
	local p2 = vector.add(pos, radius)
	minetest.sound_play("tnt_explode", {pos=pos, gain=1})
	if SAS_CORE_ALLOW_NODES and SAS_CORE_ENABLE_BLASTING then
		if SAS_CORE_ENABLE_PROTECTION then
			if not minetest.is_protected(pos, name) then
				minetest.set_node(pos, {name="tnt:boom"})
			end
		else
			minetest.set_node(pos, {name="tnt:boom"})
		end
	end
	if SAS_CORE_ENABLE_PARTICLE_FX == true then
		minetest.add_particlespawner(50, 0.1,
			p1, p2, {x=-0, y=-0, z=-0}, {x=0, y=0, z=0},
			{x=-0.5, y=5, z=-0.5}, {x=0.5, y=5, z=0.5},
			0.1, 1, 8, 15, false, "tnt_smoke.png"
		)
	end
	local objects = minetest.get_objects_inside_radius(pos, distance)
	for _,obj in ipairs(objects) do
		if (obj:is_player() and SAS_CORE_ALLOW_PLAYERS == true) or
				(obj:get_luaentity() and SAS_CORE_ALLOW_ENTITIES == true and
				obj:get_luaentity().name ~= "__builtin:item") then
			local obj_pos = obj:getpos()
			local dist = vector.distance(obj_pos, pos)
			local damage = (fleshy * 0.5 ^ dist) * 2
			if dist ~= 0 then
				obj_pos.y = obj_pos.y + 1.7
				blast_pos = {x=pos.x, y=pos.y + 4, z=pos.z}
				if minetest.line_of_sight(obj_pos, blast_pos, 1) then
					obj:punch(obj, 1.0, {
						full_punch_interval = 1.0,
						damage_groups = {fleshy=damage},
					})
				end
			end
		end
	end
	if SAS_CORE_ALLOW_NODES and SAS_CORE_ENABLE_BLASTING then
		local pr = PseudoRandom(os.time())
		local vm = VoxelManip()
		local min, max = vm:read_from_map(p1, p2)
		local area = VoxelArea:new({MinEdge=min, MaxEdge=max})
		local data = vm:get_data()
		local c_air = minetest.get_content_id("air")
		for z = -radius, radius do
			for y = -radius, radius do
				local vp = {x=pos.x - radius, y=pos.y + y, z=pos.z + z}
				local vi = area:index(vp.x, vp.y, vp.z)
				for x = -radius, radius do
					if (x * x) + (y * y) + (z * z) <=
							(radius * radius) + pr:next(-radius, radius) then
						if SAS_CORE_ENABLE_PROTECTION then
							if not minetest.is_protected(vp, name) then
								data[vi] = c_air
							end
						else
							data[vi] = c_air
						end
					end
					vi = vi + 1
				end
			end
		end
		vm:set_data(data)
		vm:update_liquids()
		vm:write_to_map()
		vm:update_map()
	end
end

if not singleplayer and SAS_CORE_ADMIN_WEAPONS then
	local timer = 0
	local shooting = false
	minetest.register_globalstep(function(dtime)
		if not shooting then
			timer = timer+dtime
			if timer < 2 then
				return
			end
			timer = 0
		end
		shooting = false
		for _,player in pairs(minetest.get_connected_players()) do
			if player:get_player_control().LMB then
				local name = player:get_player_name()
				if minetest.check_player_privs(name, {server=true}) then
					local spec = sas_core.registered_weapons[player:get_wielded_item():get_name()]
					if spec then
						spec = spec.spec
						sas_core.shots[name] = false
						spec.name = name
						sas_core:fire_weapon(player, {}, spec)
						shooting = true
					end
				end
			end
		end
	end)
end





sas_core:register_weapon("sas_core:rifle", {
	description = "Musket  --WAIT 7 Seconds between firing or you will lose your ammo.  This is a High-Powered single-shot muzzle-loader",
	inventory_image = "shooter_rifle.png^[makealpha:255,255,255",
	rounds = 1.025,
	spec = {
		range = 200,
		step = 30,
		tool_caps = {full_punch_interval=1, damage_groups={fleshy=65}},
		groups = {snappy=3, crumbly=3, choppy=3, fleshy=2, oddly_breakable_by_hand=2},
		sound = "shooter_rifle",
		particle = "shooter_bullet.png",
	},
})

minetest.register_craftitem("sas_core:ammo", {
	description = "Ball Shot / Wad / and Powder",
	inventory_image = "shooter_ammo.png^[makealpha:255,255,255",
})

if SAS_CORE_ENABLE_CRAFTING == true then

	minetest.register_craft({
		output = "sas_core:rifle 1 65535",
		recipe = {
			{"", "sas_core:flint", ""},
			{"", "sas_core:iron_hardware", "sas_core:steel_barrel_musket_reamed"},
			{"sas_core:handle_stock", "", ""},
		},
	})

	minetest.register_craft({
		output = "sas_core:rifle 1 65535",
		recipe = {
			{"sas_core:rifle", "sas_core:ammo"},
		},
	})
	
	minetest.register_craft({
		output = "sas_core:ammo 12",
		recipe = {
			{"tnt:gunpowder", "sas_core:plant_fiber", "sas_core:steel_nugget"},
		},
	})
end

local rounds_update_time = 0

minetest.register_globalstep(function(dtime)
	sas_core.time = sas_core.time + dtime
	if sas_core.time - rounds_update_time > SAS_CORE_ROUNDS_UPDATE_TIME then
		for i, round in ipairs(sas_core.rounds) do
			if sas_core:process_round(round) or round.dist > round.def.range then
				table.remove(sas_core.rounds, i)
			else
				local v = vector.multiply(round.ray, round.def.step)
				sas_core.rounds[i].pos = vector.add(round.pos, v)
				sas_core.rounds[i].dist = round.dist + round.def.step
			end
		end
		rounds_update_time = sas_core.time
	end
	if sas_core.time > 100000 then
		sas_core.shots = {}
		rounds_update_time = 0
		sas_core.reload_time = 0
		sas_core.update_time = 0
		sas_core.time = 0
	end
end)

--[[



Minetest Mod - Simple Shooter [shooter]
=======================================

License Source Code: 2013 Stuart Jones - LGPL v2.1

Additional credit for code ideas taken from other mods.

PilzAdam [throwing] for the throwing physics
ShadowNinja [nuke] for the vm explosion routine

License Textures: Stuart Jones - WTFPL

Licence Models: Stuart Jones - CC-BY-SA 3.0

License Sounds: freesound.org

	flobert1_20070728.wav by Nonoo - Attribution 3.0 Unported (CC BY 3.0)
	
	shot.wav by Sergenious - Attribution 3.0 Unported (CC BY 3.0)

	GUNSHOT.WAV by erkanozan - CC0 1.0 Universal (CC0 1.0)

	winchester-rifle-cock-reload.wav by MentalSanityOff - CC0 1.0 Universal (CC0 1.0)

	trigger-with-hammer-fall.wav by Nanashi - CC0 1.0 Universal (CC0 1.0)

	woosh.wav by ReadeOnly - CC0 1.0 Universal (CC0 1.0)

	AGM-114 Hellfire Rocket Missile Launch.flac by qubodup - CC0 1.0 Universal (CC0 1.0)

	Sparkler.aif by Ned Bouhalassa - CC0 1.0 Universal (CC0 1.0)


Minetest Mod - Simple Shooter [shooter]
=======================================

Mod Version: 0.5.3

Minetest Version: 0.4.9, 0.4.10, 0.4.11

Depends: default, dye, tnt, wool

An experimental first person shooter mod that uses simple vector mathematics
to produce an accurate and server-firendly method of hit detection.

By default this mod is configured to work only against other players in
multiplayer mode and against Simple Mobs [mobs] in singleplayer mode.

Default configuration can be customised by adding a sas_core.conf file to
the mod's main directory, see sas_core.conf.example for more details.

This is still very much a work in progress which I eventually plan to use
as the base for a 'Spades' style FPS game using the minetest engine.

Crafting
========

<color> = grey, black, red, yellow, green, cyan, blue, magenta

A = Arrow        [shooter:arrow_white]
C = Color Dye    [dye:<color>]
W = Wooden Stick [sas_core:stick]
P = Paper        [sas_core:paper]
S = Steel Ingot  [sas_core:steel_ingot]
B = Bronze Ingot [sas_core:bronze_ingot]
M = Mese Crystal [sas_core:mese_crysytal]
D = Diamond      [sas_core:diamond]
R = Red Wool     [wool:red]
G = Gun Powder   [tnt:gunpowder]

Crossbow: [shooter:crossbow]

+---+---+---+
| W | W | W |
+---+---+---+
| W | W |   |
+---+---+---+
| W |   | B |
+---+---+---+

White Arrow: [shooter:arrow_white]

+---+---+---+
| S |   |   |
+---+---+---+
|   | W | P |
+---+---+---+
|   | P | W |
+---+---+---+

Coloured Arrow: [shooter:arrow_<color>]

+---+---+
| C | A |
+---+---+

Pistol: [shooter:pistol]

+---+---+
| S | S |
+---+---+
|   | M |
+---+---+

Rifle: [shooter:rifle]

+---+---+---+
| S |   |   |
+---+---+---+
|   | B |   |
+---+---+---+
|   | M | B |
+---+---+---+

Shotgun: [shooter:shotgun]

+---+---+---+
| S |   |   |
+---+---+---+
|   | S |   |
+---+---+---+
|   | M | B |
+---+---+---+

Sub Machine Gun: [shooter:machine_gun]

+---+---+---+
| S | S | S |
+---+---+---+
|   | B | M |
+---+---+---+
|   | B |   |
+---+---+---+

Ammo Pack: [shooter:ammo]

+---+---+
| G | B |
+---+---+

Grappling Hook: [shooter:grapple_hook]

+---+---+---+
| S | S | D |
+---+---+---+
| S | S |   |
+---+---+---+
| D |   | S |
+---+---+---+

Grappling Hook Gun: [shooter:grapple_gun]

+---+---+
| S | S |
+---+---+
|   | D |
+---+---+

Flare: [shooter:flare]

+---+---+
| G | R |
+---+---+

Flare Gun: [shooter:flaregun]

+---+---+---+
| R | R | R |
+---+---+---+
|   |   | S |
+---+---+---+

Grenade: [shooter:grenade]

+---+---+
| G | S |
+---+---+

Flare Gun: [shooter:rocket_gun]

+---+---+---+
| B | S | S |
+---+---+---+
|   |   | D |
+---+---+---+

Rocket: [shooter:rocket]

+---+---+---+
| B | G | B |
+---+---+---+

Turret: [shooter:turret]

+---+---+---+
| B | B | S |
+---+---+---+
|   | B | S |
+---+---+---+
|   | D |   |
+---+---+---+

	
	
	
	]]
