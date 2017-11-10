
-- Simple Skins mod for minetest (26th July 2017)
-- Adds a simple skin selector to the inventory, using inventory_plus
-- or by using the /skin command to bring up selection list.
-- Released by TenPlus1 and based on Zeg9's code under MIT license

--skins = {}
gui.skins = {}
gui.modpath = minetest.get_modpath("gui")
gui.armor = minetest.get_modpath("3d_armor")
gui.inv = minetest.get_modpath("gui")

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

-- load skin list
gui.list = {}
gui.add = function(skin)
	table.insert(gui.list, skin)
end

local id = 1
local f
while true do
	f = io.open(gui.modpath .. "/textures/character_" .. id .. ".png")
	if not f then break end
	f:close()
	gui.add("character_" .. id)
	id = id + 1
end

id = id - 1

-- load Metadata
gui.meta = {}
local f, data
for _, i in pairs(gui.list) do
	gui.meta[i] = {}
	f = io.open(gui.modpath .. "/meta/" .. i .. ".txt")
	data = nil
	if f then
		data = minetest.deserialize("return {" .. f:read('*all') .. "}")
		f:close()
	end
	data = data or {}
	gui.meta[i].name = data.name or ""
	gui.meta[i].author = data.author or ""
end

-- player load/save routines
gui.file = minetest.get_worldpath() .. "/simple_gui.mt"

gui.load = function()
	local input = io.open(gui.file, "r")
	local data = nil
	if input then
		data = input:read('*all')
	end
	if data and data ~= "" then
		local lines = string.split(data, "\n")
		for _, line in pairs(lines) do
			data = string.split(line, ' ', 2)
			gui.skins[data[1]] = data[2]
		end
		io.close(input)
	end
end

-- load player skins now
gui.load()

gui.save = function()
	local output = io.open(gui.file,'w')
	for name, skin in pairs(gui.skins) do
		if name and skin then
			output:write(name .. " " .. skin .. "\n")
		end
	end
	io.close(output)
end

-- skin selection page
gui.formspec = {}
gui.formspec.main = function(name)

	local selected = 1 -- select default
	local formspec = "size[7,7]"
		.. "bgcolor[#08080822;true]"
		.. "label[.5,2;" .. S("Select Player Skin:") .. "]"
		.. "textlist[.5,2.5;5.8,4;skins_set;"

	for i = 1, #gui.list do

		formspec = formspec .. gui.meta[ gui.list[i] ].name .. ","

		if gui.skins[name] == gui.list[i] then
			selected = i
		end
	end

	formspec = formspec .. ";" .. selected .. ";true]"

	local meta = gui.meta[ gui.skins[name] ]

	if meta then
		if meta.name then
			formspec = formspec .. "label[2,.5;" .. S("Name: ") .. meta.name .. "]"
		end
		if meta.author then
			formspec = formspec .. "label[2,1;" .. S("Author: ") .. meta.author .. "]"
		end
	end

	return formspec
end

-- update player skin
gui.update_player_skin = function(player)

	if not player then
		return
	end

	local name = player:get_player_name()

--	if gui.armor then
--		armor.textures[name].skin = gui.skins[name] .. ".png"
--		armor:set_player_armor(player)
--	else
		player:set_properties({
			textures = {gui.skins[name] .. ".png"},
		})
--	end

	gui.save()
end

-- load player skin on join
minetest.register_on_joinplayer(function(player)

	local name = player:get_player_name()

	if not gui.skins[name] then
		gui.skins[name] = "character_1"
	end

	gui.update_player_skin(player)

	if gui.inv then
		gui.register_button(player,"skins", "Skin")
	end
end)

-- formspec control
minetest.register_on_player_receive_fields(function(player, formname, fields)

	local name = player:get_player_name()

	if fields.skins then
		gui.set_inventory_formspec(player,
			gui.formspec.main(name) .. "button[0,.75;2,.5;main;Back]"
		)
	end

	local event = minetest.explode_textlist_event(fields["skins_set"])

	if event.type == "CHG" then

		local index = event.index

		if index > id then index = id end

		gui.skins[name] = gui.list[index]

		if gui.inv then
			gui.set_inventory_formspec(player,
				gui.formspec.main(name) .. "button[0,.75;2,.5;main;Back]"
			)
		end

		gui.update_player_skin(player)

	end
end)

-- admin command to set player skin (usually for custom skins)
minetest.register_chatcommand("setskin", {
	params = "<player> <skin number>",
	description = S("Admin command to set player skin"),
	privs = {server = true},
	func = function(name, param)

		if not param or param == "" then return end

		local user, skin = string.match(param, "([^ ]+) (-?%d+)")

		if not user or not skin then return end

		gui.skins[user] = "character_"..tonumber(skin)
		gui.save()

		minetest.chat_send_player(name,
			 "** " .. user .. S("'s skin set to") .. " character_" .. skin .. ".png")
	end,
})

-- player command to set skin
minetest.register_chatcommand("skin", {
	description = S("Set player skin"),
	func = function(name, param)
		minetest.show_formspec(name,
			"skins_set",
			gui.formspec.main(name)
			.."button_exit[0,.75;2,.5;;" .. S("Close") .. "]"
		)
	end,
})

print (S("[MOD] Simple Skins loaded"))

--[[

Simple Skins

Simple Skins mod for Minetest uses Inventory Plus mod when available or the
/skin command to allow players to select a skin/texture from the list.
Also supports 3d_armor mod.

https://forum.minetest.net/viewtopic.php?id=9100

Change log:

- 0.4 - Added /skin command to set player skin, no longer dependent on Inventory+, also /setskin command for server admin to set custom skins for player.
- 0.3 - Now works with Minetest 0.4.10+
- 0.2 - Added 3D_Armor mod compatibility
- 0.1 - Added addi's changes to highlight selected skin on list (thanks)
- 0.0 - Initial release


The MIT License (MIT)

Copyright (c) 2016 TenPlus1

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]
