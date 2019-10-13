local time = 0
local update_time = tonumber(minetest.setting_get("wieldview_update_time"))
if not update_time then
	update_time = 2
	minetest.setting_set("wieldview_update_time", tostring(update_time))
end
local node_tiles = minetest.setting_getbool("wieldview_node_tiles")
if not node_tiles then
	node_tiles = false
	minetest.setting_set("wieldview_node_tiles", "false")
end
--[[
wieldview = {
	wielded_item = {},
	transform = {},
}
]]
--dofile(minetest.get_modpath(minetest.get_current_modname()).."/transform.lua")
-- Wielded Item Transformations - http://dev.minetest.net/texture

sas_core.transform = {
	["sas_core:torch"]="R270",
	["sas_core:sapling"]="R270",
	["flowers:dandelion_white"]="R270",
	["flowers:dandelion_yellow"]="R270",
	["flowers:geranium"]="R270",
	["flowers:rose"]="R270",
	["flowers:tulip"]="R270",
	["flowers:viola"]="R270",
	["bucket:bucket_empty"]="R270",
	["bucket:bucket_water"]="R270",
	["bucket:bucket_lava"]="R270",
	["screwdriver:screwdriver"]="R270",
	["screwdriver:screwdriver1"]="R270",
	["screwdriver:screwdriver2"]="R270",
	["screwdriver:screwdriver3"]="R270",
	["screwdriver:screwdriver4"]="R270",
	["vessels:glass_bottle"]="R270",
	["vessels:drinking_glass"]="R270",
	["vessels:steel_bottle"]="R270",
}


sas_core.get_item_texture = function(self, item)
	local texture = "3d_armor_trans.png"
	if item ~= "" then
		if minetest.registered_items[item] then
			if minetest.registered_items[item].inventory_image ~= "" then
				texture = minetest.registered_items[item].inventory_image
			elseif node_tiles == true and minetest.registered_items[item].tiles
					and type(minetest.registered_items[item].tiles[1]) == "string"
					and minetest.registered_items[item].tiles[1] ~= "" then
				texture = minetest.inventorycube(minetest.registered_items[item].tiles[1])
			end
		end
		-- Get item image transformation, first from group, then from transform.lua
		local transform = minetest.get_item_group(item, "wieldview_transform")
		if transform == 0 then
			transform = sas_core.transform[item]
		end
		if transform then
			-- This actually works with groups ratings because transform1, transform2, etc.
			-- have meaning and transform0 is used for identidy, so it can be ignored
			texture = texture.."^[transform"..tostring(transform)
		end
	end
	return texture
end

sas_core.update_wielded_item = function(self, player)
	if not player then
		return
	end
	local name = player:get_player_name()
	local stack = player:get_wielded_item()
	local item = stack:get_name()
	if not item then
		return
	end
	if self.wielded_item[name] then
		if self.wielded_item[name] == item then
			return
		end
		armor.textures[name].wielditem = self:get_item_texture(item)
		armor:update_player_visuals(player)
	end
	self.wielded_item[name] = item
end

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	sas_core.wielded_item[name] = ""
	minetest.after(0, function(player)
		sas_core:update_wielded_item(player)
	end, player)
end)

minetest.register_globalstep(function(dtime)
	time = time + dtime
	if time > update_time then
		for _,player in ipairs(minetest.get_connected_players()) do
			sas_core:update_wielded_item(player)
		end
		time = 0
	end
end)




--[[
[mod] visible wielded items [wieldview]
=======================================

Depends on: 3d_armor

Makes hand wielded items visible to other players.

default settings: [minetest.conf]

# Set number of seconds between visible wielded item updates.
wieldview_update_time = 2

# Show nodes as tiles, disabled by default
wieldview_node_tiles = false


Info for modders
################

Wield image transformation: To apply a simple transformation to the item in
hand, add the group “wieldview_transform” to the item definition. The group
rating equals one of the numbers used for the [transform texture modifier
of the Lua API.



[mod] visible wielded items [wieldview]
=======================================

License Source Code: Copyright (C) 2013-2017 Stuart Jones - LGPL v2.1





]]
