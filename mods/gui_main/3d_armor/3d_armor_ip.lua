if not minetest.global_exists("gui") then
	minetest.log("warning", "3d_armor_ip: Mod loaded but unused.")
	return
end

armor.formspec = "size[8,8.5]button[6,0;2,0.5;main;Back]"..armor.formspec
armor:register_on_update(function(player)
	local name = player:get_player_name()
	local formspec = armor:get_armor_formspec(name, true)
	local page = player:get_inventory_formspec()
	if page:find("detached:"..name.."_armor") then
		gui.set_inventory_formspec(player, formspec)
	end
end)

if minetest.get_modpath("crafting") then
	gui.get_formspec = function(player, page)
	end
end

minetest.register_on_joinplayer(function(player)
	gui.register_button(player,"armor", "Armor")
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.armor then
		local name = armor:get_valid_player(player, "[on_player_receive_fields]")
		if not name then
			return
		end
		local formspec = armor:get_armor_formspec(name, true)
		gui.set_inventory_formspec(player, formspec)
	end
end)


--[[

[mod] 3d Armor integration to inventory plus [3d_armor_ip]
==========================================================

License Source Code: (C) 2012-2017 Stuart Jones - LGPL v2.1




]]