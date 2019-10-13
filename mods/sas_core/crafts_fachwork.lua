
minetest.register_alias("default:clay_1", "sas_core:clay_1")
minetest.register_alias("default:brick_1", "sas_core:brick_1")
minetest.register_alias("default:stone_brick_1", "sas_core:stone_brick_1")
minetest.register_alias("default:cobble_1", "sas_core:cobble_1")
minetest.register_alias("default:stone_1", "sas_core:stone_1")
minetest.register_alias("default:wood_1", "sas_core:wood_1")
minetest.register_alias("default:junglewood_1", "sas_core:junglewood_1")

minetest.register_alias("default:clay_2", "sas_core:clay_2")
minetest.register_alias("default:brick__2", "sas_core:brick_2")
minetest.register_alias("default:stone_brick_2", "sas_core:stone_brick_2")
minetest.register_alias("default:cobble_2", "sas_core:cobble_2")
minetest.register_alias("default:stone_2", "sas_core:stone_2")
minetest.register_alias("default:wood_2", "sas_core:wood_2")
minetest.register_alias("default:junglewood_2", "sas_core:junglewood_2")

minetest.register_alias("default:clay_cross", "sas_core:clay_cross")
minetest.register_alias("default:brick_cross", "sas_core:brick_cross")
minetest.register_alias("default:stone_brick_cross", "sas_core:stone_brick_cross")
minetest.register_alias("default:cobble_cross", "sas_core:cobble_cross")
minetest.register_alias("default:stone_cross", "sas_core:stone_cross")
minetest.register_alias("default:wood_cross", "sas_core:wood_cross")
minetest.register_alias("default:junglewood_cross", "sas_core:junglewood_cross")



--[[
================================================================
** fachwerk **
By JBB

Copyright (c) 2015 JBB
(sites.google.com/site/jbbsblog)
The WTFPL applies to all code in this project.
http://www.wtfpl.net/txt/copying/
See README.txt
================================================================
--]]


--default = {}  sounds = default.node_sound_stone_defaults(),

sas_core.register_fachwerk = function( basename, texture, description, craft_from )

	local group_def = {choppy=1,cracky=1};
--[[
	minetest.register_node("sas_core:"..basename, { 
		description = "Truss with "..description,
		tiles = { texture.."^fachwerk_blank.png"},
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
	})
]]
	minetest.register_node("sas_core:"..basename.."_1", { 
		description = "truss with "..description.." oblique beam 1",
		tiles = {
			texture.."^fachwerk_blank.png", -- top
			texture.."^fachwerk_blank.png", -- bottom
			texture.."^fachwerk_beam_1.png",
			texture.."^fachwerk_beam_1.png^[transformFX",
			texture.."^fachwerk_beam_1.png^[transformFX",
			texture.."^fachwerk_beam_1.png" },
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
	})
	
	-- TODO: is this one really needed? the node above covers most of that already
	minetest.register_node("sas_core:"..basename.."_2", { 
	description = "Truss with "..description.." oblique beam 2",
		tiles = {
			texture.."^fachwerk_blank.png", -- top
			texture.."^fachwerk_blank.png", -- bottom
			texture.."^fachwerk_beam_2.png",
			texture.."^fachwerk_beam_2.png^[transformFX",
			texture.."^fachwerk_beam_2.png^[transformFX",
			texture.."^fachwerk_beam_2.png" },
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
	})

	minetest.register_node("sas_core:"..basename.."_cross", {
		description = "truss with "..description.." cross",
		tiles = {texture.."^fachwerk_cross.png"},
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
	})

	--crafting--

	-- yields 2; after all we did add a lot of wood
	--[[
	minetest.register_craft({
		output = "sas_core:"..basename.." 2",
		recipe = { { "group:wood","group:wood","group:wood" },
			{ "group:wood", craft_from,"group:wood" },
			{ "group:wood","group:wood","group:wood" },
		} });
		]]
	minetest.register_craft({
		output = "sas_core:"..basename.."_cross 2",
		recipe = { { "group:wood",craft_from,"group:wood" },
			{ craft_from, "group:wood",craft_from },
			{ "group:wood",craft_from,"group:wood" },
		} });
	
	minetest.register_craft({
		output = "sas_core:"..basename.."_1 2",
		recipe = { { craft_from,"group:wood", craft_from},
			{ craft_from, craft_from, craft_from},
			{ "group:wood", craft_from, craft_from},
		} });
		
	minetest.register_craft({
		output = "sas_core:"..basename.."_2 2",
		recipe = { { craft_from, craft_from,"group:wood"},
			{ craft_from, craft_from, craft_from },
			{  craft_from,"group:wood" ,craft_from },
		} });
	
	-- chain of craft receipes to convert nodes into each other
	--[[minetest.register_craft({
		output = "sas_core:"..basename.."_1",
		recipe = { {"sas_core:"..basename }} });
			 
	minetest.register_craft({
		output = "sas_core:"..basename.."_2",
		recipe = { {"sas_core:"..basename.."_1" }} });

	minetest.register_craft({
		output = "sas_core:"..basename.."_cross",
		recipe = { {"sas_core:"..basename.."_2" }} });

	minetest.register_craft({
		output = "sas_core:"..basename,
		recipe = { {"sas_core:"..basename.."_cross" }} });--]]

end

sas_core.register_fachwerk( 'clay',        'default_clay.png',        'clay',         'default:clay' );
sas_core.register_fachwerk( 'brick',       'default_brick.png',       'bricks',       'default:brick' );
sas_core.register_fachwerk( 'stone_brick', 'default_stone_brick.png', 'stone bricks', 'default:stonebrick' );

sas_core.register_fachwerk( 'cobble',      'default_cobble.png',      'cobble',       'default:cobble' );
sas_core.register_fachwerk( 'stone',       'default_stone.png',       'stone',        'default:stone' );

sas_core.register_fachwerk( 'wood',        'default_wood.png',        'wood',         'default:wood' );
sas_core.register_fachwerk( 'junglewood',  'default_junglewood.png',  'junglewood',   'default:junglewood' );
--optional fachwerk types you can enable if you like
--[[

sas_core.register_fachwerk( 'desert_stone','default_desert_stone.png','desert stone', 'sas_core:desert_stone' );
sas_core.register_fachwerk( 'white',       'wool_white.png',          'white',        'wool:white' );
sas_core.register_fachwerk( 'grey',        'wool_grey.png',           'grey',         'wool:grey' );
sas_core.register_fachwerk( 'yellow',      'wool_yellow.png',         'yellow',       'wool:yellow' );
sas_core.register_fachwerk( 'wood',        'default_wood.png',        'wood',         'sas_core:wood' );
sas_core.register_fachwerk( 'junglewood',  'default_junglewood.png',  'junglewood',   'sas_core:junglewood' );]]-- -- you can enable this to get more fachwerk blocks.



  

if minetest.setting_getbool("log_mods") then
	minetest.log("action", "[fachwerk] loaded.")
end

