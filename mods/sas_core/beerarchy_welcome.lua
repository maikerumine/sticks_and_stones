minetest.register_on_newplayer(function(player)
--minetest.register_on_joinplayer(function(player)
	if player then
		show_welcome_message(player)
	end
end)

minetest.register_chatcommand("welcome", {
	params = "",
	description = "Show welcome message.",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if player then
			show_welcome_message(player)
		end
		return true
	end,
})

function show_welcome_message(player)
	local formspec =		"size[11,7.7]textarea[0.5,0.5;10.5,7;welcome:welcome_textarea;;"..
							"Welcome "..player:get_player_name().."!\n\n"..

							"This is the world known as Sticks -n- Stones. This is an anarchy server"..
							" without moderation besides keeping the server up and running. Feel "..
							" free to say whatever you want in chat. Griefing in any form whatsoever"..
							" is permitted (destroying structures, lava casting, spawn killing). "..
							"For those who are easily offended, either fuck off, deal"..
							" with the lack of rules or leave if you can't handle anarchy.\n\n"..
							"This server has a very complicated cxrafting system in place."..
							" various crafts are shown in the built in craft guide, USE IT! "..
							"Your first tool to craft is the hand axe made from small stones"..
							" and plant fibers, which are all types of plantlife crafted together.\n\n"..
							"Your second IMPORTANT tool to make is the gravelsieve hammer. "..
							"This is your main blacksmithing tool that will get you started making "..
							"more complete tools and metal components, as well as making gravel from "..
							" cobblestone.  The gravelsieve can harvest iron ores from gravel as well."..
							"This hammer is used in most metal working crafts, so don't lose it!\n\n"..
							"The next special tool to make is the Swag Block, as with it you will craft the "..
							" next special tool, the foundry tongs, as well as other bits and bobs that you "..
							" will be crafting on a daily basis. "..
							"Now for the fun stuff...\n\n"..
							"Good luck "..player:get_player_name()..", you will need it as you will "..
							" start with nothing. And oh, I forgot, food is easy to come by...\n\n"..
							"By continuing on this server, you agree to the rules and "..
							" that the administrator of this server is in no way "..
							" whatsoever liable for your actions or those of other players.\n\n"..
							"Some useful chat commands..\n\n"..
							"/killme: -> You return to your last bed (simple set home) or back at spawn\n"..
							"/weather -> See the current weather"..
							--" starting the music sometimes. If so, you can try \"/music on\" to"..
							--" reset the music.\n"..
							--"/mail -> Read mail/ offline messages.\n"..
							--"/rank <player> -> Show your rank. If player is specified, show the"..
							--" stats of player.\n"..
							--"/clearbed -> Clear the bed as respawn position. Use this in case you"..
							--" get stuck in your bed and need to respawn at the world starting point.\n"..
							"/verse -> Let ChristianBibleBot cite a verse from the KJV bible."..
							"REMEMBER TO ALWAYS PICK UP STICKS AND STONES.\n"..
							"]button_exit[9,7;2,1;continue;Continue]"

	minetest.show_formspec(player:get_player_name(), "welcome:welcome", formspec)

end
