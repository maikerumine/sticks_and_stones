minetest.register_on_joinplayer(function(player)
    minetest.setting_set("time_speed", 2.635431918)
end)
minetest.register_on_shutdown(function(player)
    minetest.setting_set("time_speed", 72)
end)

-- Disable clouds and enable them again when player leaves the game. (Experimental)
--[[
minetest.register_on_joinplayer(function(player)
    minetest.setting_set("enable_clouds", 0)
end)
minetest.register_on_shutdown(function(player)
    minetest.setting_set("enable_clouds", 1)
end)

]]
--[[
local skytextures = {
	"sky_pos_y.png",
	"sky_neg_y.png",
	"sky_pos_z.png",
	"sky_neg_z.png",	
	"sky_neg_x.png",
	"sky_pos_x.png",
}



skybox.set = function(player, number)
	if number == 0 then
		skybox.clear(player)
	else
		local sky = skies[number]
		player:override_day_night_ratio(sky[3])
		player:set_sky(sky[2], "skybox", {
			sky[1] .. "Up.jpg",
			sky[1] .. "Down.jpg",
			sky[1] .. "Front.jpg",
			sky[1] .. "Back.jpg",
			sky[1] .. "Left.jpg",
			sky[1] .. "Right.jpg",
		}, true)
		player:set_clouds(sky[4])
		player:set_attribute("skybox:skybox", sky[1])
	end
end


]]

local skytextures = {
	"CloudyLightRaysUp.jpg",
	"CloudyLightRaysDown.jpg",
	"CloudyLightRaysFront.jpg",
	"CloudyLightRaysBack.jpg",	
	"CloudyLightRaysLeft.jpg",
	"CloudyLightRaysRight.jpg",
}

--Sky textures
minetest.register_on_joinplayer(function(player)
	minetest.after(0, function()
		player:set_sky({r=0, g=0, b=0, a=0},"skybox", skytextures)
	end)
end)

