-- mods/default/functions.lua


--
-- Lavacooling
--

default.cool_lava = function(pos, node)
	if node.name == "default:lava_source" then
		minetest.set_node(pos, {name = "default:obsidian"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "default:cobble"})
	end
	minetest.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

if minetest.settings:get_bool("enable_lavacooling") ~= false then
	minetest.register_abm({
		label = "Lava cooling",
		nodenames = {"default:lava_source", "default:lava_flowing"},
		neighbors = {"group:cools_lava", "group:water"},
		interval = 1,
		chance = 2,
		catch_up = false,
		action = function(...)
			default.cool_lava(...)
		end,
	})
end


--
-- Metalcooling
--

default.cool_metal = function(pos, node)
	if node.name == "sas_core:metal_molten_source" then
		minetest.set_node(pos, {name = "stairs:slab_steelblock"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "default:cobble"})
	end
	minetest.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

if minetest.settings:get_bool("enable_lavacooling") ~= false then
	minetest.register_abm({
		label = "Lava cooling",
		nodenames = {"sas_core:metal_molten_source", "sas_core:metal_molten_flowing"},
		neighbors = {"group:cools_lava", "group:water"},
		interval = 1,
		chance = 2,
		catch_up = false,
		action = function(...)
			default.cool_metal(...)
		end,
	})
end


--Tenplus1's playerplus mod
pp = {}
local time = 0
minetest.register_globalstep(function(dtime)

	time = time + dtime
	local def = {}

	-- every 1 second
	if time > 1 then

		-- reset time for next check
		time = 0

		-- check players
		for _,player in ipairs(minetest.get_connected_players()) do

			-- where am I?
			local pos = player:getpos()

			-- what is around me?
			pos.y = pos.y - 0.1 -- standing on
			local nod_stand = minetest.get_node(pos).name

			pos.y = pos.y + 1.5 -- head level
			local nod_head = minetest.get_node(pos).name

			pos.y = pos.y - 1.2 -- feet level
			local nod_feet = minetest.get_node(pos).name

			pos.y = pos.y - 0.2 -- reset pos

			-- is 3d_armor mod active? if so make armor physics default
			if minetest.get_modpath("3d_armor") then
				def = armor.def[player:get_player_name()] or nil
			end

			-- set to armor physics or defaults
			pp.speed = def.speed or 1
			pp.jump = def.jump or 1
			pp.gravity = def.gravity or 1

			-- standing on ice? if so walk faster
			if nod_stand == "default:ice" then
				pp.speed = pp.speed + 0.4
			end

			-- standing on snow? if so walk slower
			if nod_stand == "default:snow"
			or nod_stand == "default:snowblock"
			or nod_stand == "default:sand"
			-- wading in water? if so walk slower
			or nod_feet == "default:water_flowing"
			or nod_feet == "default:sand"
			or nod_feet ==  "default:water_source" then
				pp.speed = pp.speed - 0.6
			end

			-- set player physics
			player:set_physics_override(pp.speed, pp.jump, pp.gravity)
			--print ("Speed:", pp.speed, "Jump:", pp.jump, "Gravity:", pp.gravity)

			-- is player suffocating inside node? (only nodes found in default game)
			if minetest.registered_nodes[nod_head]
			and minetest.registered_nodes[nod_head].walkable
			and nod_head:find("default:")
			and minetest.setting_getbool("enable_damage")
			and not minetest.check_player_privs(player:get_player_name(), {noclip=true}) then
				if player:get_hp() > 0 then
					minetest.sound_play("damage", {pos=pos})
					player:set_hp(player:get_hp()-1)
				end
			end

			-- am I near a hot node?
			local near_cac = minetest.find_node_near(pos, 1, "default:cactus")
			local near_furn = minetest.find_node_near(pos, 1, {"default:furnace_active", "sas_core:bloomery_active"})
			local near_hotliq = minetest.find_node_near(pos, 1, {"default:metal_molten_source","sas_core:metal_molten_flowing", "default:lava_source","default:lava_flowing"})
			local near_red = minetest.find_node_near(pos, 1, {

			"sas_core:redhot_steelblock", 
			"stairs:slab_redhot_steelblock", 
			"stairs:stair_redhot_steelblock", 
			"stairs:stair_inner_redhot_steelblock", 
			"stairs:stair_outer_redhot_steelblock",
			--copper
			"sas_core:orangehot_copperblock", 
			"stairs:slab_orangehot_steelblock",
			"stairs:stair_orangehot_steelblock",
			"stairs:stair_inner_orangehot_steelblock",
			"stairs:stair_outer_orangehot_steelblock"
			})
			
			
			if near_cac and minetest.setting_getbool("enable_damage") then
				-- am I touching the cactus? if so it hurts
				for _,object in ipairs(minetest.get_objects_inside_radius(near_cac, 1.0)) do
					if object:get_hp() > 0 then
						minetest.sound_play("damage", {pos=pos})
						object:set_hp(object:get_hp()-1)
					end
				end

			end
			
			if near_red and minetest.setting_getbool("enable_damage") then
				-- am I touching the cactus? if so it hurts
				for _,object in ipairs(minetest.get_objects_inside_radius(near_red, 3.0)) do
					if object:get_hp() > 0 then
						minetest.sound_play("damage", {pos=pos})
						object:set_hp(object:get_hp()-2)
					end
				end

			end	
			
			if near_hotliq and minetest.setting_getbool("enable_damage") then
				-- am I touching the cactus? if so it hurts
				for _,object in ipairs(minetest.get_objects_inside_radius(near_hotliq, 4.0)) do
					if object:get_hp() > 0 then
						minetest.sound_play("damage", {pos=pos})
						object:set_hp(object:get_hp()-3)
					end
				end

			end
			
			if near_furn and minetest.setting_getbool("enable_damage") then
				-- am I touching the cactus? if so it hurts
				for _,object in ipairs(minetest.get_objects_inside_radius(near_furn, 2.0)) do
					if object:get_hp() > 0 then
						minetest.sound_play("damage", {pos=pos})
						object:set_hp(object:get_hp()-1)
					end
				end

			end
			

		end

	end
end)


--
-- NOTICE: This method is not an official part of the API yet.
-- This method may change in future.
--

function default.can_interact_with_node(player, pos)
	if player then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- Is player wielding the right key?
	local item = player:get_wielded_item()
	if item:get_name() == "default:key" then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_metadata()
			if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end
