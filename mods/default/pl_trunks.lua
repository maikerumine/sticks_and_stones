-----------------------------------------------------------------------------------------------
local title		= "Trunks"
local version 	= "0.1.4"
local mname		= "trunks"
-----------------------------------------------------------------------------------------------
-- Code by Mossmanikin & Neuromancer

--default = {}

dofile(minetest.get_modpath("default").."/trunks_settings.txt")
--dofile(minetest.get_modpath("trunks").."/generating.lua")
--dofile(minetest.get_modpath("trunks").."/nodes.lua")
--dofile(minetest.get_modpath("trunks").."/crafting.lua")

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------

-- Code by Mossmanikin & Neuromancer
-----------------------------------------------------------------------------------------------
-- TWiGS
-----------------------------------------------------------------------------------------------
-- For compatibility with older stuff
minetest.register_alias("default:twig",	"default:twig_1")

local flat_stick = {-1/2, -1/2, -1/2, 1/2, -7/16, 1/2}
local NoDe = { {1}, {2}, {3}, {4}, {5}, --[[{6},]] {7}, {8}, {9}, {10}, {11}, {12}, {13} }


for i in pairs(NoDe) do
	local NR = NoDe[i][1]
	local iNV = NR - 1
	minetest.register_node("default:twig_"..NR, {
		description = "Twig",
		inventory_image = "trunks_twig_"..NR..".png",
		wield_image = "trunks_twig_"..NR..".png",
		drawtype = "nodebox",
		tiles = { 
			"trunks_twig_"..NR..".png",
			"trunks_twig_"..NR..".png^[transformFY", -- mirror
			"trunks_twig_6.png" -- empty
		},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		sunlight_propagates = true,
		buildable_to = true,
		node_box = {type = "fixed", fixed = flat_stick},
		groups = {
			choppy=2,
			oddly_breakable_by_hand=2,
			flammable=3,
			attached_node=1,
			not_in_creative_inventory=iNV,
			kindling=1
		},
		drop = "default:twig_1",
		sounds = default.node_sound_leaves_defaults(),
		liquids_pointable = true,
		on_place = function(itemstack, placer, pointed_thing)
			local pt = pointed_thing
			local direction = minetest.dir_to_facedir(placer:get_look_dir())
			if minetest.get_node(pt.above).name=="air" then
				minetest.set_node(pt.above, {name="default:twig_"..math.random(1,4), param2=direction})
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end
				return itemstack
			end
		end,
	})
end

-----------------------------------------------------------------------------------------------
-- MoSS
-----------------------------------------------------------------------------------------------
local flat_moss = {-1/2, -1/2, -1/2, 1/2, -15/32--[[<-flickers if smaller]], 1/2}

minetest.register_node("default:moss", {
	description = "Moss",
	drawtype = "nodebox",--"signlike",
	tiles = {"trunks_moss.png"},
	inventory_image = "trunks_moss.png",
	wield_image = "trunks_moss.png",
	paramtype = "light",
	paramtype2 = "facedir",--"wallmounted",
	sunlight_propagates = true,
	walkable = false,
	node_box = {type = "fixed", fixed = flat_moss},
	selection_box = {type = "fixed", fixed = flat_stick},--{type = "wallmounted"},
	groups = {snappy = 3, flammable = 3, plant_fiber = 1 },
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- MoSS & FuNGuS
-----------------------------------------------------------------------------------------------
minetest.register_node("default:moss_fungus", {
	description = "Moss with Fungus",
	drawtype = "nodebox",--"signlike",
	tiles = {"trunks_moss_fungus.png"},
	inventory_image = "trunks_moss_fungus.png",
	wield_image = "trunks_moss_fungus.png",
	paramtype = "light",
	paramtype2 = "facedir",--"wallmounted",
	sunlight_propagates = true,
	walkable = false,
	node_box = {type = "fixed", fixed = flat_moss},
	selection_box = {type = "fixed", fixed = flat_stick},--{type = "wallmounted"},
	groups = {snappy = 3, flammable = 3, plant_fiber = 1 },
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWiGS BLoCK
-----------------------------------------------------------------------------------------------
minetest.register_alias("woodstuff:twigs",	"default:twigs")

minetest.register_node("default:twigs", {
	description = "Twigs Block",
	paramtype2 = "facedir",
	tiles = {"trunks_twigs.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWiGS SLaB
-----------------------------------------------------------------------------------------------
minetest.register_alias("woodstuff:twigs_slab",	"default:twigs_slab")

minetest.register_node("default:twigs_slab", {
	description = "Twigs Slab",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"trunks_twigs.png"},
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWiGS RooF
-----------------------------------------------------------------------------------------------
minetest.register_alias("woodstuff:twigs_roof",	"default:twigs_roof")

minetest.register_node("default:twigs_roof", {
	description = "Twigs Roof",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"trunks_twigs.png"},
	node_box = {
		type = "fixed",
--			{ left, bottom, front, right, top, back }
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWiGS RooF CoRNeR
-----------------------------------------------------------------------------------------------
minetest.register_alias("woodstuff:twigs_roof_corner",	"default:twigs_roof_corner")

minetest.register_node("default:twigs_roof_corner", {
	description = "Twigs Roof Corner 1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"trunks_twigs_corner.png",
		"trunks_twigs_corner.png",
		"trunks_twigs.png"
	},
	node_box = {
		type = "fixed",
--			{ left, bottom, front, right, top, back }
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWiGS RooF CoRNeR 2
-----------------------------------------------------------------------------------------------
minetest.register_alias("woodstuff:twigs_roof_corner_2",	"default:twigs_roof_corner_2")

minetest.register_node("default:twigs_roof_corner_2", {
	description = "Twigs Roof Corner 2",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"trunks_twigs_corner.png",
		"trunks_twigs_corner.png",
		"trunks_twigs.png"
	},
	node_box = {
		type = "fixed",
--			{ left, bottom, front, right, top, back }
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

if Auto_Roof_Corner == true then

	local roof = "default:twigs_roof"
	local corner = "default:twigs_roof_corner"
	local corner_2 = "default:twigs_roof_corner_2"

	minetest.register_abm({
		nodenames = {roof},
		interval = 1,
		chance = 1,
		action = function(pos)
	
			local node_east = 			minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z  })
			local node_west = 			minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z  })
			local node_north = 			minetest.get_node({x=pos.x,   y=pos.y, z=pos.z+1})
			local node_south = 			minetest.get_node({x=pos.x,   y=pos.y, z=pos.z-1})
		-- corner 1
			if ((node_west.name == roof and node_west.param2 == 0)
			or (node_west.name == corner and node_west.param2 == 1))
			and ((node_north.name == roof and node_north.param2 == 3)
			or (node_north.name == corner and node_north.param2 == 3))
			then
				minetest.set_node(pos, {name=corner, param2=0})
			end
		
			if ((node_north.name == roof and node_north.param2 == 1)
			or (node_north.name == corner and node_north.param2 == 2))
			and ((node_east.name == roof and node_east.param2 == 0)
			or (node_east.name == corner and node_east.param2 == 0))
			then
				minetest.set_node(pos, {name=corner, param2=1})
			end
		
			if ((node_east.name == roof and node_east.param2 == 2)
			or (node_east.name == corner and node_east.param2 == 3))
			and ((node_south.name == roof and node_south.param2 == 1)
			or (node_south.name == corner and node_south.param2 == 1))
			then
				minetest.set_node(pos, {name=corner, param2=2})
			end
		
			if ((node_south.name == roof and node_south.param2 == 3)
			or (node_south.name == corner and node_south.param2 == 0))
			and ((node_west.name == roof and node_west.param2 == 2)
			or (node_west.name == corner and node_west.param2 == 2))
			then
				minetest.set_node(pos, {name=corner, param2=3})
			end
		-- corner 2
			if ((node_west.name == roof and node_west.param2 == 2)
			or (node_west.name == corner_2 and node_west.param2 == 1))
			and ((node_north.name == roof and node_north.param2 == 1)
			or (node_north.name == corner_2 and node_north.param2 == 3))
			then
				minetest.set_node(pos, {name=corner_2, param2=0})
			end
		
			if ((node_north.name == roof and node_north.param2 == 3)
			or (node_north.name == corner_2 and node_north.param2 == 2))
			and ((node_east.name == roof and node_east.param2 == 2)
			or (node_east.name == corner_2 and node_east.param2 == 0))
			then
				minetest.set_node(pos, {name=corner_2, param2=1})
			end
		
			if ((node_east.name == roof and node_east.param2 == 0)
			or (node_east.name == corner_2 and node_east.param2 == 3))
			and ((node_south.name == roof and node_south.param2 == 3)
			or (node_south.name == corner_2 and node_south.param2 == 1))
			then
				minetest.set_node(pos, {name=corner_2, param2=2})
			end
		
			if ((node_south.name == roof and node_south.param2 == 1)
			or (node_south.name == corner_2 and node_south.param2 == 0))
			and ((node_west.name == roof and node_west.param2 == 0)
			or (node_west.name == corner_2 and node_west.param2 == 2))
			then
				minetest.set_node(pos, {name=corner_2, param2=3})
			end

		end,
	})
end

-- MM: The following stuff is just for testing purposes for now; no generating of roots.
--     I'm not satisfied with this; they should be either bigger or a different drawtype.
-----------------------------------------------------------------------------------------------
-- RooTS 
-----------------------------------------------------------------------------------------------
if Roots == true then -- see settings.txt

local roots_cube =	{-2/16, -1/2, -3/16, 2/16, 1/16, 1/2}

local roots_sheet = {0, -1/2, -1/2, 0, 1/16, 1/2}

local TRuNKS = {
--	  MoD 						 TRuNK
    {"default",  				"tree"						},
	{"default",					"jungletree"				},
	
	{"trees",					"tree_conifer"				},
	{"trees",					"tree_mangrove"				},
	{"trees",					"tree_palm"					},
	
	{"moretrees",				"apple_tree_trunk"			},
	{"moretrees",				"beech_trunk"				},
	{"moretrees",				"birch_trunk"				},
	{"moretrees",				"fir_trunk"					},
	{"moretrees",				"oak_trunk"					},
	{"moretrees",				"palm_trunk"				},
	{"moretrees",				"pine_trunk"				},
	{"moretrees",				"rubber_tree_trunk"			},
	{"moretrees",				"rubber_tree_trunk_empty"	},
	{"moretrees",				"sequoia_trunk"				},
	{"moretrees",				"spruce_trunk"				},
	{"moretrees",				"willow_trunk"				},
}

for i in pairs(TRuNKS) do
	local 	MoD = 			TRuNKS[i][1]
	local 	TRuNK = 		TRuNKS[i][2]
	if minetest.get_modpath(MoD) ~= nil then
		
		local des = minetest.registered_nodes[MoD..":"..TRuNK].description
	
		minetest.register_node("default:"..TRuNK.."root", {
			description = des.." Root",
			paramtype = "light",
			paramtype2 = "facedir",
			tiles = {
--[[top]]		MoD.."_"..TRuNK..".png",
--[[bottom]]	MoD.."_"..TRuNK..".png",
--[[right]]		MoD.."_"..TRuNK..".png^trunks_root_mask.png^[makealpha:0,0,0",
--[[left]]		MoD.."_"..TRuNK..".png^trunks_root_mask.png^[transformFX^[makealpha:0,0,0",
--[[back]]		MoD.."_"..TRuNK..".png",
--[[front]]		MoD.."_"..TRuNK..".png"
			},
			drawtype = "nodebox",
			selection_box = {type = "fixed", fixed = roots_cube},
			node_box = {type = "fixed", fixed = roots_sheet},
			groups = {
				tree=1,
				snappy=1,
				choppy=2,
				oddly_breakable_by_hand=1,
				flammable=2--,
				--not_in_creative_inventory=1 -- atm in inv for testing 
			},
			--drop = "default:twig_1", -- not sure about this yet
			sounds = default.node_sound_wood_defaults(),
		}) 
	
	end
end
end


-- Code by Mossmanikin, Neuromancer, and others

local function clone_node(name)
	local node2 = {}
	local node = minetest.registered_nodes[name]
	for k,v in pairs(node) do
		node2[k]=v
	end
	return node2
end

-----------------------------------------------------------------------------------------------
-- TWiGS
-----------------------------------------------------------------------------------------------

default.place_twig = function(pos)
	local twig_size 	= math.random(1,27)
	
	local right_here 	= {x=pos.x  , y=pos.y+1, z=pos.z  }
	local north 		= {x=pos.x  , y=pos.y+1, z=pos.z+1}
	local north_east 	= {x=pos.x+1, y=pos.y+1, z=pos.z+1}
	local east 			= {x=pos.x+1, y=pos.y+1, z=pos.z  }
	local south_east 	= {x=pos.x+1, y=pos.y+1, z=pos.z-1}
	local south 		= {x=pos.x  , y=pos.y+1, z=pos.z-1}
	local south_west 	= {x=pos.x-1, y=pos.y+1, z=pos.z-1}
	local west 			= {x=pos.x-1, y=pos.y+1, z=pos.z  }
	local north_west 	= {x=pos.x-1, y=pos.y+1, z=pos.z+1}
	
	local node_here 	= minetest.get_node(right_here)
	local node_north 	= minetest.get_node(north)
	local node_n_e 		= minetest.get_node(north_east)
	local node_east 	= minetest.get_node(east)
	local node_s_e 		= minetest.get_node(south_east)
	local node_south 	= minetest.get_node(south)
	local node_s_w 		= minetest.get_node(south_west)
	local node_west 	= minetest.get_node(west)
	local node_n_w 		= minetest.get_node(north_west)
--	small twigs	
	if twig_size <= 16 then
		minetest.set_node(right_here, {name="default:twig_"..math.random(1,4), param2=math.random(0,3)})
	end
-- 	big twigs
	if Big_Twigs == true then
--	big twig 1		
	if twig_size == 17 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_5"})
			end
			if minetest.registered_nodes[node_n_e.name].buildable_to then
				minetest.set_node(north_east, {name="default:twig_7"})
			end
			if minetest.registered_nodes[node_east.name].buildable_to then
				minetest.set_node(east, 	  {name="default:twig_8"})
			end
		end
	elseif twig_size == 18 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_5", param2=1})
			end
			if minetest.registered_nodes[node_s_e.name].buildable_to then
				minetest.set_node(south_east, {name="default:twig_7", param2=1})
			end
			if minetest.registered_nodes[node_south.name].buildable_to then
				minetest.set_node(south, 	  {name="default:twig_8", param2=1})
			end
		end
	elseif twig_size == 19 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_5", param2=2})
			end
			if minetest.registered_nodes[node_s_w.name].buildable_to then
				minetest.set_node(south_west, {name="default:twig_7", param2=2})
			end
			if minetest.registered_nodes[node_west.name].buildable_to then
				minetest.set_node(west, 	  {name="default:twig_8", param2=2})
			end
		end
	elseif twig_size == 20 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_5", param2=3})
			end
			if minetest.registered_nodes[node_n_w.name].buildable_to then
				minetest.set_node(north_west, {name="default:twig_7", param2=3})
			end
			if minetest.registered_nodes[node_north.name].buildable_to then
				minetest.set_node(north, 	  {name="default:twig_8", param2=3})
			end
		end
--	big twig 2		
	elseif twig_size == 21 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_9"})
			end
			if minetest.registered_nodes[node_north.name].buildable_to then
				minetest.set_node(north, 	  {name="default:twig_10"})
			end
			if minetest.registered_nodes[node_n_e.name].buildable_to then
				minetest.set_node(north_east, {name="default:twig_11"})
			end
		end
	elseif twig_size == 22 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_9", param2=1})
			end
			if minetest.registered_nodes[node_east.name].buildable_to then
				minetest.set_node(east, 	  {name="default:twig_10", param2=1})
			end
			if minetest.registered_nodes[node_s_e.name].buildable_to then
				minetest.set_node(south_east, {name="default:twig_11", param2=1})
			end
		end
	elseif twig_size == 23 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z-1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_9", param2=2})
			end
			if minetest.registered_nodes[node_south.name].buildable_to then
				minetest.set_node(south, 	  {name="default:twig_10", param2=2})
			end
			if minetest.registered_nodes[node_s_w.name].buildable_to then
				minetest.set_node(south_west, {name="default:twig_11", param2=2})
			end
		end
	elseif twig_size == 24 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="default:twig_9", param2=3})
			end
			if minetest.registered_nodes[node_west.name].buildable_to then
				minetest.set_node(west, 	  {name="default:twig_10", param2=3})
			end
			if minetest.registered_nodes[node_n_w.name].buildable_to then
				minetest.set_node(north_west, {name="default:twig_11", param2=3})
			end
		end
	elseif twig_size <= 25 then
		minetest.set_node(right_here, {name="default:twig_"..math.random(12,13), param2=math.random(0,3)})
	end
	end
end

if Twigs_on_ground == true then
default:register_generate_plant({
    surface = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter", "default:dirt_with_dry_grass", "default:dirt_with_coniferous_litter",},
    max_count = Twigs_on_ground_Max_Count,
    rarity = Twigs_on_ground_Rarity,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {"group:tree","default:fern_03","default:fern_02","default:fern_01"},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.place_twig
)
end

if Twigs_on_water == true then
default:register_generate_plant({
    surface = {"default:water_source"},
    max_count = Twigs_on_water_Max_Count,
    rarity = Twigs_on_water_Rarity,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {"group:tree"},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.place_twig
)
end

-----------------------------------------------------------------------------------------------
-- TRuNKS
-----------------------------------------------------------------------------------------------
local TRuNKS = {
--	  MoD 						 TRuNK						NR
    {"default",  				"tree",				 		 1},
	{"default",					"jungletree",				 2},
	
	{"trees",					"tree_conifer",		 		 3},
	{"trees",					"tree_mangrove",			 4},
	{"trees",					"tree_palm",				 5},
	
	{"moretrees",				"apple_tree_trunk",			 6},
	{"moretrees",				"beech_trunk",				 7},
	{"moretrees",				"birch_trunk",				 8},
	{"moretrees",				"fir_trunk",				 9},
	{"moretrees",				"oak_trunk",				10},
	{"moretrees",				"palm_trunk",				11},
	{"moretrees",				"pine_trunk",				12},
	{"moretrees",				"rubber_tree_trunk",		13},
	{"moretrees",				"rubber_tree_trunk_empty",	14},
	{"moretrees",				"sequoia_trunk",			15},
	{"moretrees",				"spruce_trunk",				16},
	{"moretrees",				"willow_trunk",				17},
}

if Horizontal_Trunks == true then -- see settings.txt
for i in pairs(TRuNKS) do
	local 	MoD = 	TRuNKS[i][1]
	local 	TRuNK = TRuNKS[i][2]
	local 	NR = 	TRuNKS[i][3]
	local	trunkname = MoD..":"..TRuNK
	if minetest.get_modpath(MoD) ~= nil 
	and NR < 6 -- moretrees trunks allready have facedir
	and minetest.registered_nodes[trunkname] then -- the node being called exists.
			temptrunk = clone_node(trunkname)
			temptrunk.paramtype2 = "facedir"
			minetest.register_node(":"..trunkname, temptrunk)
	end
end
end
	
default.place_trunk = function(pos)
	
	local right_here = {x=pos.x, y=pos.y+1, z=pos.z}
	local north = {x=pos.x, y=pos.y+1, z=pos.z+1}
	local north2 = {x=pos.x, y=pos.y+1, z=pos.z+2}
	local south = {x=pos.x, y=pos.y+1, z=pos.z-1}
	local south2 = {x=pos.x, y=pos.y+1, z=pos.z-2}
	local west = {x=pos.x-1, y=pos.y+1, z=pos.z}
	local west2 = {x=pos.x-2, y=pos.y+1, z=pos.z}
	local east = {x=pos.x+1, y=pos.y+1, z=pos.z}
	local east2 = {x=pos.x+2, y=pos.y+1, z=pos.z}
	
	local node_here = minetest.get_node(right_here)
	local node_north = minetest.get_node(north)
	local node_north2 = minetest.get_node(north2)
	local node_south = minetest.get_node(south)
	local node_south2 = minetest.get_node(south2)
	local node_west = minetest.get_node(west)
	local node_west2 = minetest.get_node(west2)
	local node_east = minetest.get_node(east)
	local node_east2 = minetest.get_node(east2)
	if minetest.registered_nodes[node_here.name].buildable_to then -- instead of check_air = true,
		for i in pairs(TRuNKS) do
			local 	MoD = 			TRuNKS[i][1]
			local 	TRuNK = 		TRuNKS[i][2]
			local 	NR = 			TRuNKS[i][3]
			local 	chance = 		math.random(1, 17)
			local 	length = 		math.random(3,5)
			if chance == NR then
				local trunk_type = math.random(1,3)
				if trunk_type == 1 then
					if minetest.get_modpath(MoD) ~= nil then
						minetest.set_node(right_here, {name=MoD..":"..TRuNK})
					else
						minetest.set_node(right_here, {name="default:tree"})
					end
				elseif trunk_type == 2 and Horizontal_Trunks == true then
					if minetest.get_modpath(MoD) ~= nil then
						if minetest.registered_nodes[node_north.name].buildable_to then
							minetest.set_node(north, {name=MoD..":"..TRuNK, param2=4})
						end
						
						if length >= 4 and minetest.registered_nodes[node_north2.name].buildable_to then
							minetest.set_node(north2, {name=MoD..":"..TRuNK, param2=4})
						end

						minetest.set_node(right_here, {name=MoD..":"..TRuNK, param2=4})
						if minetest.registered_nodes[node_south.name].buildable_to then
							minetest.set_node(south, {name=MoD..":"..TRuNK, param2=4})
						end
						if length == 5 and minetest.registered_nodes[node_south2.name].buildable_to then
							minetest.set_node(south2, {name=MoD..":"..TRuNK, param2=4})
						end
					else
						if minetest.registered_nodes[node_north.name].buildable_to then
							minetest.set_node(north, {name="default:tree", param2=4})
						end
						if length >= 4 and minetest.registered_nodes[node_north2.name].buildable_to then
							minetest.set_node(north2, {name="default:tree", param2=4})
						end
						minetest.set_node(right_here, {name="default:tree", param2=4})
						if minetest.registered_nodes[node_south.name].buildable_to then
							minetest.set_node(south, {name="default:tree", param2=4})
						end
						if length == 5 and minetest.registered_nodes[node_south2.name].buildable_to then
							minetest.set_node(south2, {name="default:tree", param2=4})
						end
					end
				elseif trunk_type == 3 and Horizontal_Trunks == true then
					if minetest.get_modpath(MoD) ~= nil then
						if minetest.registered_nodes[node_west.name].buildable_to then
							minetest.set_node(west, {name=MoD..":"..TRuNK, param2=12})
						end
						if length >= 4 and minetest.registered_nodes[node_west2.name].buildable_to then
							minetest.set_node(west2, {name=MoD..":"..TRuNK, param2=12})
						end
						minetest.set_node(right_here, {name=MoD..":"..TRuNK, param2=12})
						if minetest.registered_nodes[node_east.name].buildable_to then
							minetest.set_node(east, {name=MoD..":"..TRuNK, param2=12})
						end
						if length == 5 and minetest.registered_nodes[node_east2.name].buildable_to then
							minetest.set_node(east2, {name=MoD..":"..TRuNK, param2=12})
						end
					else
						if minetest.registered_nodes[node_west.name].buildable_to then
							minetest.set_node(west, {name="default:tree", param2=12})
						end
						if length >= 4 and minetest.registered_nodes[node_west2.name].buildable_to then
							minetest.set_node(west2, {name="default:tree", param2=12})
						end
						minetest.set_node(right_here, {name="default:tree", param2=12})
						if minetest.registered_nodes[node_east.name].buildable_to then
							minetest.set_node(east, {name="default:tree", param2=12})
						end
						if length == 5 and minetest.registered_nodes[node_east2.name].buildable_to then
							minetest.set_node(east2, {name="default:tree", param2=12})
						end
					end
				end
			end
		end
	end
end

default:register_generate_plant({
    surface = {"default:dirt_with_grass"},
    max_count = Trunks_Max_Count, -- 320,
    rarity = Trunks_Rarity, -- 99,
    min_elevation = 1,
	max_elevation = 40,
	avoid_nodes = {"group:tree"},
	avoid_radius = 1,
	near_nodes = {"group:tree","default:fern_03","default:fern_02","default:fern_01"},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.place_trunk
)

-----------------------------------------------------------------------------------------------
-- MoSS & FuNGuS -- on ground
-----------------------------------------------------------------------------------------------
if Moss_on_ground == true then
default.grow_moss_on_ground = function(pos)
	local on_ground = {x=pos.x, y=pos.y+1, z=pos.z}
	local moss_type = math.random(1,21)
	
	if moss_type == 1 then
		minetest.set_node(on_ground, {name="default:moss_fungus", param2=math.random(0,3)})
	else
		minetest.set_node(on_ground, {name="default:moss", param2=math.random(0,3)})
	end
	
end

default:register_generate_plant({
    surface = {"default:dirt_with_grass"},
    max_count = Moss_on_ground_Max_Count,
    rarity = Moss_on_ground_Rarity,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {
		"group:tree",
		"default:fern_03",
		"default:fern_02",
		"default:fern_01"
	},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  default.grow_moss_on_ground
)
end

-----------------------------------------------------------------------------------------------
-- MoSS & FuNGuS -- on trunks
-----------------------------------------------------------------------------------------------
if Moss_on_trunk == true then
default.grow_moss_on_trunk = function(pos)
	local on_ground = {x=pos.x, y=pos.y+1, z=pos.z}
	local at_side_n = {x=pos.x, y=pos.y, z=pos.z+1}
	local at_side_e = {x=pos.x+1, y=pos.y, z=pos.z}
	local at_side_s = {x=pos.x, y=pos.y, z=pos.z-1}
	local at_side_w = {x=pos.x-1, y=pos.y, z=pos.z}
	local undrneath = {x=pos.x, y=pos.y-1, z=pos.z}
	
	local node_here = minetest.get_node(on_ground)
	local node_north = minetest.get_node(at_side_n)
	local node_east = minetest.get_node(at_side_e)
	local node_south = minetest.get_node(at_side_s)
	local node_west = minetest.get_node(at_side_w)
	local node_under = minetest.get_node(undrneath)
	
	--if minetest.get_item_group(node_under.name, "tree") < 1 then
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_here.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(on_ground, {name="default:moss_fungus", param2=math.random(0,3) --[[1]]})
			elseif moss_type < 22 then
				minetest.set_node(on_ground, {name="default:moss", param2=math.random(0,3) --[[1]]})
			end
		end
		local moss_type = math.random(1,31) -- cliche of more moss at north
		if minetest.registered_nodes[node_north.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_n, {name="default:moss_fungus", param2=math.random(4,7)}) -- 5,4,6,7
			elseif moss_type < 22 then
				minetest.set_node(at_side_n, {name="default:moss", param2=math.random(4,7)})
			end
		end
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_east.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_e, {name="default:moss_fungus", param2=math.random(12,15)})
			elseif moss_type < 22 then
				minetest.set_node(at_side_e, {name="default:moss", param2=math.random(12,15)})
			end
		end
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_south.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_s, {name="default:moss_fungus", param2=math.random(8,11)})
			elseif moss_type < 22 then
				minetest.set_node(at_side_s, {name="default:moss", param2=math.random(8,11)})
			end
		end
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_west.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_w, {name="default:moss_fungus", param2=math.random(16,19)})
			elseif moss_type < 22 then
				minetest.set_node(at_side_w, {name="default:moss", param2=math.random(16,19)})
			end
		end
	--end
end

default:register_generate_plant({
    surface = {
		"default:tree",
		"default:jungletree",
		"trees:tree_conifer",
		"trees:tree_mangrove",
		--"trees:tree_palm",
		"moretrees:apple_tree_trunk",
		"moretrees:beech_trunk",
		"moretrees:birch_trunk",
		"moretrees:fir_trunk",
		"moretrees:oak_trunk",
		--"moretrees:palm_trunk",
		"moretrees:pine_trunk",
		"moretrees:rubber_tree_trunk",
		"moretrees:rubber_tree_trunk_empty",
		"moretrees:sequoia_trunk",
		"moretrees:spruce_trunk",
		"moretrees:willow_trunk",
		"default:mossycobble"
	},
    max_count = Moss_on_trunk_Max_Count,
    rarity = Moss_on_trunk_Rarity,
    min_elevation = 1,
	max_elevation = 40,
    plantlife_limit = -0.9,
	check_air = false,
  },
  "default.grow_moss_on_trunk"
)
end

-----------------------------------------------------------------------------------------------
-- RooTS 
-----------------------------------------------------------------------------------------------
if Roots == true then -- see settings.txt

default.grow_roots = function(pos)
	local twig_size 	= math.random(1,27)
	
	local right_here 	= {x=pos.x  , y=pos.y  , z=pos.z  }
	local below 		= {x=pos.x  , y=pos.y-1, z=pos.z  }
	local north 		= {x=pos.x  , y=pos.y  , z=pos.z+1}
	local east 			= {x=pos.x+1, y=pos.y  , z=pos.z  }
	local south 		= {x=pos.x  , y=pos.y  , z=pos.z-1}
	local west 			= {x=pos.x-1, y=pos.y  , z=pos.z  }
	
	local node_here 	= minetest.get_node(right_here)
	local node_below	= minetest.get_node(below)
	local node_north 	= minetest.get_node(north)
	local node_east 	= minetest.get_node(east)
	local node_south 	= minetest.get_node(south)
	local node_west 	= minetest.get_node(west)

	for i in pairs(TRuNKS) do
		local 	MoD = 			TRuNKS[i][1]
		local 	TRuNK = 		TRuNKS[i][2]
		if minetest.get_modpath(MoD) ~= nil 
		and node_here.name == MoD..":"..TRuNK 
		and string.find(node_below.name, "dirt")
		and node_here.param2 == 0 then
			if minetest.registered_nodes[node_north.name].buildable_to then
				minetest.set_node(north, {name="default:"..TRuNK.."root", param2=2})
			end
			if minetest.registered_nodes[node_east.name].buildable_to then
				minetest.set_node(east, {name="default:"..TRuNK.."root", param2=3})
			end
			if minetest.registered_nodes[node_south.name].buildable_to then
				minetest.set_node(south, {name="default:"..TRuNK.."root", param2=0})
			end
			if minetest.registered_nodes[node_west.name].buildable_to then
				minetest.set_node(west, {name="default:"..TRuNK.."root", param2=1})
			end
		end
	end
end

default:register_generate_plant({
    surface = {"group:tree"},
    max_count = 1000,
    rarity = 1,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {"default:dirt_with_grass"},
	near_nodes_size = 1,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -1,
    check_air = false,
  },
  "default.grow_roots"
)

end


-- Code by Mossmanikin
-----------------------------------------------------------------------------------------------
-- TWiGS
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- *leaves --> twigs
	output = "default:twig_1 2",
	recipe = {{"group:leafdecay"}}
})
if minetest.get_modpath("moretrees") ~= nil then
minetest.register_craft({ -- moretrees_leaves --> twigs
	output = "default:twig_1 2",
	recipe = {{"group:moretrees_leaves"}}
})
minetest.register_craft({ -- except moretrees:palm_leaves
	output = "moretrees:palm_leaves",
	recipe = {{"moretrees:palm_leaves"}}
})
end
--if minetest.get_modpath("default") ~= nil then
minetest.register_craft({ -- BushLeaves --> twigs
	output = "default:twig_1 2",
	recipe = {{"default:BushLeaves1"}}
})
minetest.register_craft({
	output = "default:twig_1 2",
	recipe = {{"default:BushLeaves2"}}
})
minetest.register_craft({ -- bushbranches --> twigs
	output = "default:twig_1 4",
	recipe = {{"default:bushbranches1"}}
})
minetest.register_craft({
	output = "default:twig_1 4",
	recipe = {{"default:bushbranches2"}}
})
minetest.register_craft({
	output = "default:twig_1 4",
	recipe = {{"default:bushbranches2a"}}
})
minetest.register_craft({
	output = "default:twig_1 4",
	recipe = {{"default:bushbranches3"}}
})
--end
minetest.register_craft({ -- twigs block --> twigs
	output = "default:twig_1 8",
	recipe = {{"default:twigs"}}
})
minetest.register_craft({ -- twigs_slab --> twigs
	output = "default:twig_1 4",
	recipe = {{"default:twigs_slab"}}
})
minetest.register_craft({ -- twigs_roof --> twigs
	output = "default:twig_1 4",
	recipe = {{"default:twigs_roof"}}
})
minetest.register_craft({ -- twigs_roof_corner --> twigs
	output = "default:twig_1 3",
	recipe = {{"default:twigs_roof_corner"}}
})
minetest.register_craft({ -- twigs_roof_corner_2 --> twigs
	output = "default:twig_1 3",
	recipe = {{"default:twigs_roof_corner_2"}}
})
-----------------------------------------------------------------------------------------------
-- STiCK
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- twig --> stick
	output = "default:stick",
	recipe = {{"default:twig_1"}}
})

-----------------------------------------------------------------------------------------------
-- TWiGS BLoCK
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- twigs --> twigs block
	output = "default:twigs",
	recipe = {
		{"default:twig_1","default:twig_1","default:twig_1"},
		{"default:twig_1",      ""       ,"default:twig_1"},
		{"default:twig_1","default:twig_1","default:twig_1"},
	}
})

-----------------------------------------------------------------------------------------------
-- TWiGS SLaBS
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- twigs blocks --> twigs_slabs
	output = "default:twigs_slab 6",
	recipe = {
		{"default:twigs","default:twigs","default:twigs"},
	}
})

-----------------------------------------------------------------------------------------------
-- TWiGS RooFS
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- twigs blocks --> twigs_roofs
	output = "default:twigs_roof 4",
	recipe = {
		{"default:twigs",""},
		{"","default:twigs"},
	}
})
minetest.register_craft({
	output = "default:twigs_roof 4",
	recipe = {
		{"","default:twigs"},
		{"default:twigs",""},
	}
})

-----------------------------------------------------------------------------------------------
-- TWiGS RooF CoRNeRS
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- twigs blocks --> twigs_roof_corners
	output = "default:twigs_roof_corner 8",
	recipe = {
		{      ""      ,"default:twigs",      ""      },
		{"default:twigs",      ""      ,"default:twigs"},
	}
})

-----------------------------------------------------------------------------------------------
-- TWiGS RooF CoRNeRS 2
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- twigs blocks --> twigs_roof_corner_2's
	output = "default:twigs_roof_corner_2 8",
	recipe = {
		{"default:twigs",      ""      ,"default:twigs"},
		{      ""      ,"default:twigs",      ""      },
	}
})



--[[
-------------------------------------------------------------
Credit for textures of "trunks"
-------------------------------------------------------------
(If more than one author is listed the names are in alphabetical order)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FOLDER								TEXTURE							AUTHORS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
../trunks/textures					trunks_moss.png					Neuromancer
									trunks_moss_fungus.png			Neuromancer
									trunks_twig_1.png 				Mossmanikin
									trunks_twig_2.png 				Mossmanikin, Neuromancer
									trunks_twig_3.png 				Mossmanikin, Neuromancer
									trunks_twig_4.png 				Mossmanikin, Neuromancer
									trunks_twig_5.png 				Mossmanikin, Neuromancer
								   (trunks_twig_6.png) 			   (Mossmanikin)
									trunks_twig_7.png 				Mossmanikin, Neuromancer
									trunks_twig_8.png 				Mossmanikin, Neuromancer
									trunks_twig_9.png 				Mossmanikin, Neuromancer
									trunks_twig_10.png 				Mossmanikin, Neuromancer
									trunks_twig_11.png 				Mossmanikin, Neuromancer
									trunks_twigs.png 				Mossmanikin
									trunks_twigs_corner.png 		Mossmanikin
									trunks_twigs_top.png 			Mossmanikin
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
../trunks/textures/old & unused		comboSticks.png					Mossmanikin, Neuromancer	
									comboSticks_2.png				Mossmanikin, Neuromancer
									trunks_twig_1e.png				Mossmanikin, Neuromancer
									trunks_twig_1n.png				Mossmanikin, Neuromancer
									trunks_twig_2n.png				Mossmanikin, Neuromancer
									trunks_twig_3n.png				Mossmanikin, Neuromancer
									trunks_twig_4n.png				Mossmanikin, Neuromancer
									trunks_twig_5-8.png				Mossmanikin, Neuromancer
									trunks_twig_9-12.png			Mossmanikin, Neuromancer
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


]]