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

default.register_fachwerk = function( basename, texture, description, craft_from )

	local group_def = {choppy=1,cracky=1};
--[[
	minetest.register_node("default:"..basename, { 
		description = "Truss with "..description,
		tiles = { texture.."^fachwerk_blank.png"},
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
	})
]]
	minetest.register_node("default:"..basename.."_1", { 
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
	minetest.register_node("default:"..basename.."_2", { 
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

	minetest.register_node("default:"..basename.."_cross", {
		description = "truss with "..description.." cross",
		tiles = {texture.."^fachwerk_cross.png"},
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
	})

	--crafting--

	-- yields 2; after all we did add a lot of wood
	--[[
	minetest.register_craft({
		output = "default:"..basename.." 2",
		recipe = { { "group:wood","group:wood","group:wood" },
			{ "group:wood", craft_from,"group:wood" },
			{ "group:wood","group:wood","group:wood" },
		} });
		]]
	minetest.register_craft({
		output = "default:"..basename.."_cross 2",
		recipe = { { "group:wood",craft_from,"group:wood" },
			{ craft_from, "group:wood",craft_from },
			{ "group:wood",craft_from,"group:wood" },
		} });
	
	minetest.register_craft({
		output = "default:"..basename.."_1 2",
		recipe = { { craft_from,"group:wood", craft_from},
			{ craft_from, craft_from, craft_from},
			{ "group:wood", craft_from, craft_from},
		} });
		
	minetest.register_craft({
		output = "default:"..basename.."_2 2",
		recipe = { { craft_from, craft_from,"group:wood"},
			{ craft_from, craft_from, craft_from },
			{  craft_from,"group:wood" ,craft_from },
		} });
	
	-- chain of craft receipes to convert nodes into each other
	--[[minetest.register_craft({
		output = "default:"..basename.."_1",
		recipe = { {"default:"..basename }} });
			 
	minetest.register_craft({
		output = "default:"..basename.."_2",
		recipe = { {"default:"..basename.."_1" }} });

	minetest.register_craft({
		output = "default:"..basename.."_cross",
		recipe = { {"default:"..basename.."_2" }} });

	minetest.register_craft({
		output = "default:"..basename,
		recipe = { {"default:"..basename.."_cross" }} });--]]

end

default.register_fachwerk( 'clay',        'default_clay.png',        'clay',         'default:clay' );
default.register_fachwerk( 'brick',       'default_brick.png',       'bricks',       'default:brick' );
default.register_fachwerk( 'stone_brick', 'default_stone_brick.png', 'stone bricks', 'default:stonebrick' );

default.register_fachwerk( 'cobble',      'default_cobble.png',      'cobble',       'default:cobble' );
default.register_fachwerk( 'stone',       'default_stone.png',       'stone',        'default:stone' );

default.register_fachwerk( 'wood',        'default_wood.png',        'wood',         'default:wood' );
default.register_fachwerk( 'junglewood',  'default_junglewood.png',  'junglewood',   'default:junglewood' );
--optional fachwerk types you can enable if you like
--[[

default.register_fachwerk( 'desert_stone','default_desert_stone.png','desert stone', 'default:desert_stone' );
default.register_fachwerk( 'white',       'wool_white.png',          'white',        'wool:white' );
default.register_fachwerk( 'grey',        'wool_grey.png',           'grey',         'wool:grey' );
default.register_fachwerk( 'yellow',      'wool_yellow.png',         'yellow',       'wool:yellow' );
default.register_fachwerk( 'wood',        'default_wood.png',        'wood',         'default:wood' );
default.register_fachwerk( 'junglewood',  'default_junglewood.png',  'junglewood',   'default:junglewood' );]]-- -- you can enable this to get more fachwerk blocks.



  

if minetest.setting_getbool("log_mods") then
	minetest.log("action", "[fachwerk] loaded.")
end

