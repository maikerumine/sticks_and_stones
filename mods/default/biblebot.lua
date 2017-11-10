--[[
Random_messages mod by arsdragonfly.
arsdragonfly@gmail.com
6/19/2013
Re-writted by: maikerumine 20170710
--]]
--Time between two subsequent verses.
local VERSE_INTERVAL = 0
-- Added default verses file
local default_verses_file = "mt_biblebot"

math.randomseed(os.time())

--mt_biblebot = {}
default.verses = {} --This table contains all verses.

function table.count( t )
	local i = 0
	for k in pairs( t ) do i = i + 1 end
	return i
end

function table.random( t )
	local rk = math.random( 1, table.count( t ) )
	local i = 1
	for k, v in pairs( t ) do
		if ( i == rk ) then return v, k end
		i = i + 1
	end
end
--[[
function default.initialize() --Set the interval in minetest.conf.
	minetest.settings:set("mt_biblebot_interval",180)
	minetest.settings:save();
	return 180
end

function default.set_interval() --Read the interval from minetest.conf(set it if it doesn'st exist)
	VERSE_INTERVAL = tonumber(minetest.settings:get("mt_biblebot_interval")) or default.initialize()
end
]]
function default.check_params(name,func,params)
	local stat,vrs = func(params)
	if not stat then
		minetest.chat_send_player(name,vrs)
		return false
	end
	return true
end

function default.read_verses()
	local line_number = 1
	-- define input 
	local input = io.open(minetest.get_worldpath().."/mt_biblebot","r")
	-- no input file found
	if not input then
		-- look for default file
		local default_input = io.open(minetest.get_modpath("default").."/"..default_verses_file,"r")
		local output = io.open(minetest.get_worldpath().."/mt_biblebot","w")
		if not default_input then
			-- blame the admin if not found
			output:write("Blame the server admin! He/She has probably not edited the random verses yet.\n")
			output:write("Tell your dumb admin that this line is in (worldpath)/mt_biblebot \n")
		else
			-- or write default_input content in worldpath message file
			local content = default_input:read("*all")
			output:write(content)
		end
		io.close(output)
		io.close(default_input)
		input = io.open(minetest.get_worldpath().."/mt_biblebot","r")
	end
	-- we should have input by now, so lets read it
	for line in input:lines() do
		default.verses[line_number] = line
		line_number = line_number + 1
	end
	io.close(input)
end
--[[
function default.display_verse(verse_number)
	local vrs = default.verses[verse_number] or verse_number
	if vrs then
		minetest.chat_send_all(vrs)
	end
end

function default.show_verse()
	default.display_message(table.random(default.verses))
end
]]

--=======
--BEERHOLDER CODE HERE
function default.display_verse(verse_number)
	local vrs = default.verses[verse_number] or verse_number
	if vrs then
--		minetest.chat_send_all(vrs)
		for _,player in ipairs(minetest.get_connected_players()) do
			local target = player:get_player_name()
					minetest.chat_send_player(target, string.char(0x1b).."(c@#00ff00)"..
													  string.format("[%s] %s", "Biblebot", vrs))	
		end
	end
end

function default.show_verse()
	local vrs = string.char(0x1b).."(c@#00ff00)"..table.random(default.verses)
	default.display_verse(vrs)
end
--=======

function default.list_verses()
	local str = ""
	for k,v in pairs(default.verses) do
		str = str .. k .. " | " .. v .. "\n"
	end
	return str
end
--[[
function default.remove_verse(k)
	table.remove(default.verses,k)
	default.save_verses()
end

function default.add_verse(t)
	table.insert(default.verses,table.concat(t," ",2))
	default.save_verses()
end

function default.save_verses()
		local output = io.open(minetest.get_worldpath().."/mt_biblebot","w")
		for k,v in pairs(default.verses) do
			output:write(v .. "\n")
		end
		io.close(output)
end
]]
--When server starts:
--default.set_interval()
default.read_verses()
--[[
local TIMER = 0
minetest.register_globalstep(function(dtime)
	TIMER = TIMER + dtime;
	if TIMER > MESSAGE_INTERVAL then
		default.show_verse()
		TIMER = 0
	end
end)
]]

--[[
local register_chatcommand_table = {
	params = "viewverses | removemverse <number> | addverse <number>",
	privs = {server = true},
	description = "View and/or alter the server's random verses",
	func = function(name,param)
		local t = string.split(param, " ")
		if t[1] == "viewverses" then
			minetest.chat_send_player(name,default.list_verses())
		elseif t[1] == "removeverse" then
			if not default.check_params(
			name,
			function (params)
				if not tonumber(params[2]) or
				default.verses[tonumber(params[2])] == nil then
					return false,"ERROR: No such verse."
				end
				return true
			end,
			t) then return end
			default.remove_verse(t[2])
		elseif t[1] == "addverse" then
			if not t[2] then
				minetest.chat_send_player(name,"ERROR: No verse.")
			else
				default.add_verse(t)
			end
		else
				minetest.chat_send_player(name,"ERROR: Invalid command.")
		end
	end
}

]]
--BEERHOLDER CODE HERE
local register_show_verse = {
	params = "",
	description = "Say a random verse",
	func = function(name, param)
		default.show_verse()
	end
}

--minetest.register_chatcommand("mt_biblebot", register_chatcommand_table)
--minetest.register_chatcommand("rverses", register_chatcommand_table)
--BEERHOLDER CODE HERE
minetest.register_chatcommand("verse", register_show_verse)


--[[
RandomMessages mod by arsdragonfly.
Put your messages in (world directory)/random_messages,1 message per line.
Messages can be all kinds of hints, mod usage, etc.
Add/Remove messages on the fly:
/rmessages viewmessages
to see all the messages.
/rmessages addmessage blah blah blah
to add the random message blah blah blah.
/rmessages removemessage 2
to remove the 2nd random message in /rmessages viewmessages .
In minetest.conf, random_messages_interval decides how often a message is sent.
Released under CC0.
Special thanks to:
Michael Rasmussen (michael@jamhome.us)
Enjoy it! ^_^
arsdragonfly@gmail.com
6/19/2013

20170710 Converted into a biblebot by maikerumine
KJV Bibles from: https://sites.google.com/site/ruwach/bibletext

bible.txt
Size: 1.27mb
Format: One Big Text file of the whole Bible
Bible Version: King James Bible also known as the Authorised Version
Bible Copyright: Public Domain
Software Copyright: Public Domain
 ]]