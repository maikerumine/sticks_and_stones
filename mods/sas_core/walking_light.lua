local wielding_only = false

local players = {}

--minetest.register_alias("sas_core:light", "sas_core:lightz")

minetest.register_on_joinplayer(function(mt_player)
	local name = mt_player:get_player_name()
	players[name] = {name=name,pos={x=0,y=32000,z=0},wielding=0,mt_player=mt_player}
end)

minetest.register_on_leaveplayer(function(mt_player)
	local name = mt_player:get_player_name()
	local pinfo=players[name]
	if pinfo.wielding > 0 then
		pinfo.wielding = 0
		update_light_player(pinfo)
	end
	players[name] = nil
end)

--wielding_light returns 0 for no light; 1 for regular light.  Outside of this function we don't care what's being wielded, carried or worn, just what needs to be done.
function wielding_light(pinfo)
	if (wielding_only) then
		local wielded_item = pinfo.mt_player:get_wielded_item():get_name()
		if (wielded_item == "sas_core:torch") then
			return 1
		end
	else 
		local inv = pinfo.mt_player:get_inventory()
		if inv ~= nil then
			local hotbar=inv:get_list("main")
			for i=1,8 do
				local item = hotbar[i]:get_name()
				if item == "sas_core:torch" then
					return 1
				end
			end
		end

	end
	return 0
end

function update_light_player(pinfo)
	local removes = {}
	local adds = {}
	if pinfo.wielded > 0 then
		local pos=pinfo.old_pos
		local hash = (pos.x%64)*4096 + (pos.y%64)*64 + pos.z%64
		removes[hash] = pos
	end
	
	if pinfo.wielding > 0 then
		local pos=pinfo.pos
		local hash = (pos.x%64)*4096 + (pos.y%64)*64 + pos.z%64
		removes[hash] = nil
		adds[hash] = pos
	end
	
	for h,p in pairs(adds) do
		local node = minetest.env:get_node_or_nil(p)
		if node == nil or (node ~= nil and node.name == "air") then
			minetest.env:add_node(p, {type="node",name="sas_core:lights"})
		end
	end

	for h,p in pairs(removes) do
		local node = minetest.env:get_node_or_nil(p)
		if node ~= nil and node.name == "sas_core:lights" then
			minetest.env:add_node(p, {type="node",name="air"})
		end
	end
end

function update_light_all(dtime)
	for name,pinfo in pairs(players) do
		local pos = pinfo.mt_player:getpos()
		pinfo.wielded = pinfo.wielding
		pinfo.wielding = wielding_light(pinfo)
		if pos ~= nil then
			pinfo.old_pos = pinfo.pos
			pinfo.pos = {
				x=math.floor(pos.x + 0.5),
				y=math.floor(pos.y + 1.5),
				z=math.floor(pos.z + 0.5)}
			pinfo.pos_changed=(
				pinfo.old_pos.x ~= pinfo.pos.x or
				pinfo.old_pos.y ~= pinfo.pos.y or
				pinfo.old_pos.z ~= pinfo.pos.z)
		end
		players[pinfo.name] = pinfo

		if pinfo.pos_changed or (pinfo.wielded ~= pinfo.wielding) then
			update_light_player(pinfo)
		end
	end
end

minetest.register_globalstep(update_light_all)

minetest.register_node("sas_core:lights", {
	--drawtype = "glasslike",
	description = "Gravity Lamp  --Use sparingly.  ;-)",
	--drawtype = "nodebox",
	drawtype = "airlike",
	--drawtype = "plantlike",
	tiles = {"fire_basic_flame.png"},
	--inventory_image = minetest.inventorycube("walking_light.png"),
	--inventory_image = minetest.inventorycube("icon.png"),
	inventory_image = "fire_basic_flame.png^icon.png",
	paramtype = "light",
	walkable = false,
	--
	drop = 'sas_core:stick',
	groups = {flammable = 2, falling_node = 1, not_in_creative_inventory = 1},
	pointable = false,
	buildable_to = true,
	--damage_per_second = 1 * 2,
	post_effect_color = {a = 19, r = 255, g = 64, b = 0},
	--
	is_ground_content = true,
	--light_propagates = true,
	sunlight_propagates = true,
	light_source = 13,
	--
		node_box = {
		type = "fixed",
		--fixed = {-1/14, -1/12, -1/14, 1/14, 1/12, 1/14},
		fixed = {0.1, 0.1,0.1, 0.1, 0.1,0.1},
	},
	selection_box = {
		type = "fixed",
		--fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		fixed = {0.1, 0.1,0.1, 0.1, 0.1,0.1},
	},
	
	--[[
	selection_box = {
		type = "fixed",
		fixed = {0, 0, 0, 0, 0, 0},
	},
	]]
})
--[[
minetest.register_abm({
	nodenames = {"sas_core:lights","sas_core:torch"},
	interval = 360.0,
	chance = 1,
	--drop = "sas_core:steel_ingot 4",
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Forbidden item abm.")
			hacky_swap_node(pos,"sas_core:torch")
			return
	end,
})

]]
minetest.register_abm({
	nodenames = {"sas_core:lights","sas_core:invis"},
	interval = 360.0,
	chance = 1,
	--drop = "sas_core:steel_ingot 4",
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
			meta:set_string("infotext","Forbidden item abm.")
			hacky_swap_node(pos,"sas_core:invis")
			return
	end,
})	
	
