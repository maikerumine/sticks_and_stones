-----------------------------------------------------------------------------------------------
local title		= "Wood Soils" -- former "Forest Soils"
local version 	= "0.0.9"
local mname		= "woodsoils" -- former "forestsoils"
-----------------------------------------------------------------------------------------------

--default = {}

--dofile(minetest.get_modpath("woodsoils").."/nodes.lua")
--dofile(minetest.get_modpath("woodsoils").."/generating.lua")

-- felt like playing a bit :D
print("  _____                              __")  
print("_/ ____\\___________   ____   _______/  |_")
print("\\   __\\/  _ \\_  __ \\_/ __ \\ /  ___/\\   __\\")
print(" |  | (  <_> )  | \\/\\  ___/ \\___ \\  |  |")  
print(" |__|  \\____/|__|    \\___  >____  > |__|") 
print("                         \\/     \\/")

print("             .__.__")        
print("  __________ |__|  |   ______")
print(" /  ___/  _ \\|  |  |  /  ___/")
print(" \\___ (  <_> )  |  |__\\___ \\")
print("/____  >____/|__|____/____  >")
print("     \\/                   \\/")

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------

-- nodes

minetest.register_node("default:dirt_with_leaves_1", {
	description = "Forest Soil 1",
	tiles = {
		"default_dirt.png^woodsoils_ground_cover.png", 
		"default_dirt.png", 
		"default_dirt.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1, falling_node = 1--,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("default:dirt_with_leaves_2", {
	description = "Forest Soil 2",
	tiles = {
		"woodsoils_ground.png", 
		"default_dirt.png", 
		"default_dirt.png^woodsoils_ground_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1, falling_node = 1--,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("default:grass_with_leaves_1", {
	description = "Forest Soil 3",
	tiles = {
		"default_grass.png^woodsoils_ground_cover2.png", 
		"default_dirt.png", 
		"default_dirt.png^default_grass_side.png^woodsoils_ground_cover_side2.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1, falling_node = 1--,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("default:grass_with_leaves_2", {
	description = "Forest Soil 4",
	tiles = {
		"default_grass.png^woodsoils_ground_cover.png", 
		"default_dirt.png", 
		"default_dirt.png^default_grass_side.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1, falling_node = 1--,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

-- For compatibility with older stuff
minetest.register_alias("forestsoils:dirt_with_leaves_1",	"default:dirt_with_leaves_1")
minetest.register_alias("forestsoils:dirt_with_leaves_2",	"default:dirt_with_leaves_2")
minetest.register_alias("forestsoils:grass_with_leaves_1",	"default:grass_with_leaves_1")
minetest.register_alias("forestsoils:grass_with_leaves_2",	"default:grass_with_leaves_2")



-- generating of forest soils

local RaDiuS = {
--	WE1 NS1	   WE2 NS2     WE3 NS3
	{-1,-2,		-2,-2,		-2,-3},
	{ 0,-2,		-3,-1,		-3,-2},
	{ 1,-2,		-3, 0,		-4,-1},
	{-2,-1,		-3, 1,		-4, 0},
	{-1,-1,		-2, 2,		-4, 1},
	{ 0,-1,		-1, 3,		-3, 2},
	{ 1,-1,		 0, 3,		-2, 3},
	{ 2,-1,		 1, 3,		-1, 4},
	{-2, 0,		 2, 2,		 0, 4},
	{-1, 0,		 3, 1,		 1, 4},
	{ 0, 0,		 3, 0,		 2, 3},
	{ 1, 0,		 3,-1,		 3, 2},
	{ 2, 0,		 2,-2,		 4, 1},
	{-2, 1,		 1,-3,		 4, 0},
	{-1, 1,		 0,-3,		 4,-1},
	{ 0, 1,		-1,-3,		 3,-2},
	{ 1, 1,		 0, 0,		 2,-3},
	{ 2, 1,		 0, 0,		 1,-4},
	{-1, 2,		 0, 0,		 0,-4},
	{ 0, 2,		 0, 0,		-1,-4},
	{ 1, 2,		 0, 0,		 0, 0},
}
--  e = + , n = +
default.place_soil = function(pos)
	
	if minetest.get_item_group(minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name, "soil") > 0
	or minetest.get_item_group(minetest.get_node({x=pos.x,y=pos.y-2,z=pos.z}).name, "soil") > 0 then
		for i in pairs(RaDiuS) do
			local WE1 = RaDiuS[i][1]
			local NS1 = RaDiuS[i][2]
			local WE2 = RaDiuS[i][3]
			local NS2 = RaDiuS[i][4]
			local WE3 = RaDiuS[i][5]
			local NS3 = RaDiuS[i][6]
			local radius_1a = {x=pos.x+WE1,y=pos.y-1,z=pos.z+NS1}
			local radius_1b = {x=pos.x+WE1,y=pos.y-2,z=pos.z+NS1}
			local radius_2a = {x=pos.x+WE2,y=pos.y-1,z=pos.z+NS2}
			local radius_2b = {x=pos.x+WE2,y=pos.y-2,z=pos.z+NS2}
			local radius_3a = {x=pos.x+WE3,y=pos.y-1,z=pos.z+NS3}
			local radius_3b = {x=pos.x+WE3,y=pos.y-2,z=pos.z+NS3}
			--local node_1a = minetest.get_node(radius_1a)
			--local node_1b = minetest.get_node(radius_1b)
			local node_2a = minetest.get_node(radius_2a)
			local node_2b = minetest.get_node(radius_2b)
			local node_3a = minetest.get_node(radius_3a)
			local node_3b = minetest.get_node(radius_3b)
			-- Dirt with Leaves 1
			if minetest.get_item_group(minetest.get_node(radius_1a).name, "soil") > 0 then
				minetest.set_node(radius_1a, {name="default:dirt_with_leaves_1"})
			end
			if minetest.get_item_group(minetest.get_node(radius_1b).name, "soil") > 0 then
				minetest.set_node(radius_1b, {name="default:dirt_with_leaves_1"})
			end
			-- Grass with Leaves 2
			if string.find(node_2a.name, "dirt_with_grass") then
				minetest.set_node(radius_2a, {name="default:grass_with_leaves_2"})
			end
			if string.find(node_2b.name, "dirt_with_grass") then
				minetest.set_node(radius_2b, {name="default:grass_with_leaves_2"})
			end
			-- Grass with Leaves 1
			if string.find(node_3a.name, "dirt_with_grass") then
				minetest.set_node(radius_3a, {name="default:grass_with_leaves_1"})
			end
			if string.find(node_3b.name, "dirt_with_grass") then
				minetest.set_node(radius_3b, {name="default:grass_with_leaves_1"})
			end
		end
	end
end

default:register_generate_plant({
    surface = {
		"group:tree",
		"default:fern_03",
		"default:fern_02",
		"default:fern_01"
	},
    max_count = 1000,
    rarity = 1,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {"group:tree","default:fern_03","default:fern_02","default:fern_01"},
	near_nodes_size = 5,
	near_nodes_vertical = 1,
	near_nodes_count = 4,
    plantlife_limit = -1,
    check_air = false,
  },
  "default.place_soil"
)

default:register_generate_plant({
    surface = {
		"moretrees:apple_tree_sapling_ongen",
		"moretrees:beech_sapling_ongen",
		"moretrees:birch_sapling_ongen",
		"moretrees:fir_sapling_ongen",
		"moretrees:jungletree_sapling_ongen",
		"moretrees:oak_sapling_ongen",
		"moretrees:palm_sapling_ongen",
		"moretrees:pine_sapling_ongen",
		"moretrees:rubber_tree_sapling_ongen",
		"moretrees:sequoia_sapling_ongen",
		"moretrees:spruce_sapling_ongen",
		"moretrees:willow_sapling_ongen"
	},
    max_count = 1000,
    rarity = 2,
    min_elevation = 1,
	max_elevation = 40,
	plantlife_limit = -0.9,
    check_air = false,
  },
  "default.place_soil"
)

minetest.register_abm({
	nodenames = {"default:papyrus"},
	neighbors = {
		"default:dirt_with_leaves_1",
		"default:dirt_with_leaves_2",
		"default:grass_with_leaves_1",
		"default:grass_with_leaves_2"
	},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if string.find(name, "_with_leaves_") then
			if minetest.find_node_near(pos, 3, {"group:water"}) == nil then
				return
			end
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "default:papyrus" and height < 4 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="default:papyrus"})
				end
			end
		end
	end,
})


--[[
-------------------------------------------------------------
Credit for textures of "woodsoils"
-------------------------------------------------------------
(If more than one author is listed the names are in alphabetical order)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FOLDER								TEXTURE								AUTHORS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
../woodsoils/textures				woodsoils_ground.png				Mossmanikin
									woodsoils_ground_cover.png			Mossmanikin
									woodsoils_ground_cover_side.png		Mossmanikin
									woodsoils_ground_cover_side2.png	Mossmanikin
									woodsoils_ground_cover2.png			Mossmanikin
									woodsoils_ground_side.png			Mossmanikin
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
../woodsoils/textures/not in use	woodsoils.png						Mossmanikin
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

]]