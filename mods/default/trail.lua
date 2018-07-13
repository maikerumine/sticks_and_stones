--Trail 0.3.0 by paramat
--For Minetest 0.4.15 and later
--Depends: default
--Licenses: Source code: MIT. Textures: CC BY-SA (3.0)

--This mod was developed from 'desire path' mod by Casimir
--https://forum.minetest.net/viewtopic.php?id=3390


-- Parameters

local FOO = true -- Enable footprints.
local FUNCYC = 0.2 -- Function cycle in seconds.
local TRACHA = 0.1 -- Chance walked dirt/grass is worn and compacted to trail:trail.
local ICECHA = 0.05 -- Chance walked snowblock is compacted to ice.

local EROSION = true -- Enable footprint and trail:trail erosion.
local EROINT = 16 -- Erosion interval.
local EROCHA = 128 -- Erosion 1/x chance.

-- Player positions

local player_pos = {}
local player_pos_previous = {}

minetest.register_on_joinplayer(function(player)
	player_pos_previous[player:get_player_name()] = {x = 0, y = 0, z = 0}
end)

minetest.register_on_leaveplayer(function(player)
	player_pos_previous[player:get_player_name()] = nil
end)

-- Nodes

minetest.register_node("default:trail_trail", {
	tiles = {"trail_trailtop.png", "default_dirt.png",
		"default_dirt.png^trail_trailside.png"},
	groups = {crumbly = 2, soil =1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dirt_trail", {
	description = "Dirt With Footprint",
	tiles = {"default_dirt.png^default_footprint.png", "default_dirt.png"},
	groups = {crumbly = 2, soil = 1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dirt_with_grass_trail", {
	description = "Dirt with Grass and Footprint",
	tiles = {"default_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
		tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_dry_grass_trail", {
	description = "Dirt with Dry Grass and Footprint",
	tiles = {"default_dry_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_dry_grass_side.png",
		tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

--==
minetest.register_node("default:dirt_with_rainforest_litter_trail", {
	description = "Rainforest and Footprint",
	tiles = {"default_rainforest_litter.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png",
		tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("default:dirt_with_coniferous_litter_trail", {
	description = "Conferous Litter and Footprint",
	tiles = {"default_coniferous_litter.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_coniferous_litter_side.png",
		tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

--==
minetest.register_node('default:sand_with_food_trail', {
	description = 'Sand With Food and Footprint',
	tiles = {'default_desert_sand.png^default_footprint.png', "default_sand.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1, sand=1, not_in_creative_inventory=1},
	sounds = default.node_sound_sand_defaults(),
		drop = {
		max_items = 2,
		items = {
			{
			items = {'default:oyster_raw'},
			rarity = 2,
			},
			{
			items = {'default:mussel_raw'},
			rarity = 2,
			},
			{
			items = {'default:desert_sand'},
			},
			},
		},
})

minetest.register_node("default:fall_grass_trail", {
	description = "Fall Grass and Footprint",
	tiles = {"default_grass.png^[colorize:brown:50^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^(default_grass_side.png^[colorize:brown:50)",
		tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	   soil = {
		base = "default:dirt_with_dry_grass",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.register_node("default:dirt_with_snow_trail", {
	description = "Dirt with Snow and Footprint",
	tiles = {"default_snow.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, falling_node = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("default:sand_trail", {
	description = "Sand With Footprint",
	tiles = {"default_sand.png^default_footprint.png", "default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	drop = "default:sand",
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:desert_sand_trail", {
	description = "Desert Sand With Footprint",
	tiles = {"default_desert_sand.png^default_footprint.png", "default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	drop = "default:desert_sand",
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:silver_sand_trail", {
	description = "Silver Sand With Footprint",
	tiles = {"default_silver_sand.png^default_footprint.png", "default_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	drop = "default:silver_sand",
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:snow_trail", {
	description = "Snow With Footprint",
	tiles = {"default_snow.png^default_footprint.png", "default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1},
	drop = "default:snow",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_node("default:snowblock_trail", {
	description = "Snow Block With Footprint",
	tiles = {"default_snow.png^default_footprint.png", "default_snow.png"},
	groups = {crumbly = 2, puts_out_fire = 1, cools_lava = 1, falling_node = 1},
	drop = "default:snowblock",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_node("default:wheat_trail", {
	description = "Flattened Wheat",
	tiles = {"trail_flat_wheat.png"},
	inventory_image = "trail_flat_wheat.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	buildable_to = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -3 / 8, 0.5}
		},
	},
	groups = {snappy = 3, flammable = 2, attached_node = 1, falling_node = 1},
	drop = "",
	sounds = default.node_sound_leaves_defaults(),
})

-- Globalstep function
local dirt_table = {-- original, walked on
  {'default:dirt_with_rainforest_litter', 'default:dirt_with_rainforest_litter_trail'},
  {'default:dirt_with_coniferous_litter', 'default:dirt_with_coniferous_litter_trail'},
  {'default:dirt_with_rainforest_litter_trail', 'default:grass_with_leaves_2'},
  {'default:dirt_with_coniferous_litter_trail', 'default:dirt_with_leaves_1'},
  {'mymonths:fall_grass', 'default:fall_grass_trail'},
  {'default:sand_with_food_trail', 'default:sand_with_food_trail'},
  {'default:dirt_with_grass', 'default:dirt_with_grass_trail'},
  {'default:grass_with_leaves_1', 'default:grass_with_leaves_2'},
  {'default:dirt_with_leaves_2', 'default:dirt_with_leaves_1'},
  {'default:grass_short', 'default:dirt_with_leaves_1'},
  {'default:dirt_with_leaves_1', 'default:dirt'},
  {'default:dirt', 'default:dirt_walked'},
  {'default:dirt_walked', 'default:trail_trail'},
  {'default:sand', 'default:sand_walked'},
  {'default:desert_sand', 'default:desert_sand_walked'}
}

local grasses = {-- original, walked on
  {'default:junglegrass', 'default:grass_5'},
  {'default:grass_5', 'default:grass_4'},
  {'default:grass_4', 'default:grass_3'},
  {'default:grass_3', 'default:grass_2'},
  {'default:grass_2', 'default:grass_1'},
  {'default:grass_1', 'air'}
}



local timer = 0

if FOO then
	minetest.register_globalstep(function(dtime)
		timer = timer + dtime
		if timer > FUNCYC then
			timer = 0
			for _, player in ipairs(minetest.get_connected_players()) do
				local pos = player:getpos()
				player_pos[player:get_player_name()] = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 0.2),
					z = math.floor(pos.z + 0.5)
				}

				local p_ground = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 0.4),
					z = math.floor(pos.z + 0.5)
				}
				local n_ground = minetest.get_node(p_ground).name
				local p_groundpl = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y - 0.5),
					z = math.floor(pos.z + 0.5)
				}
				local p_snow = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 1.2),
					z = math.floor(pos.z + 0.5)
				}
				local n_snow = minetest.get_node(p_snow).name
				local p_snowpl = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 0.5),
					z = math.floor(pos.z + 0.5)
				}
					
				--if player_pos_previous[player:get_player_name()] == nil then
					--break
				--end

				if player_pos[player:get_player_name()].x ~=
						player_pos_previous[player:get_player_name()].x or
						player_pos[player:get_player_name()].y <
						player_pos_previous[player:get_player_name()].y or
						player_pos[player:get_player_name()].z ~=
						player_pos_previous[player:get_player_name()].z then

					if n_ground == "default:dirt" then
						minetest.set_node(p_groundpl, {name = "default:dirt_trail"})				
					elseif n_ground == "default:dirt_with_grass" then
					--mymonths fall grass
						minetest.set_node(p_groundpl, {name = "default:dirt_with_grass_trail"})
					elseif n_ground == "mymonths:fall_grass" then
						minetest.set_node(p_groundpl, {name = "default:fall_grass_trail"})
					elseif n_ground == "default:fall_grass_trail" then
						minetest.set_node(p_groundpl, {name = "default:dirt_trail"})
					--mew mt nodes
					elseif n_ground == "default:dirt_with_rainforest_litter" then
						minetest.set_node(p_groundpl, {name = "default:dirt_with_rainforest_litter_trail"})
					elseif n_ground == "default:dirt_with_rainforest_litter_trail" then
						minetest.set_node(p_groundpl, {name = "default:dirt_with_leaves_2"})
						
					elseif n_ground == "default:dirt_with_coniferous_litter" then
						minetest.set_node(p_groundpl, {name = "default:dirt_with_coniferous_litter_trail"})
					elseif n_ground == "default:dirt_with_coniferous_litter_trail" then
						minetest.set_node(p_groundpl, {name = "default:dirt_with_leaves_1"})

						
					elseif n_ground == "default:dirt_with_dry_grass" then
						minetest.set_node(p_groundpl, {name = "default:dirt_with_dry_grass_trail"})

					elseif n_ground == "default:sand_with_food" then
						minetest.set_node(p_groundpl, {name = "default:sand_with_food_trail"})
					--============	
					--============	
					elseif n_ground == "default:grass_with_leaves_1" then
						minetest.set_node(p_groundpl, {name = "default:grass_with_leaves_2"})
					elseif n_ground == "default:grass_with_leaves_2" then
						minetest.set_node(p_groundpl, {name = "default:dirt_with_leaves_1"})
					elseif n_ground == "default:grass_short" then
						minetest.set_node(p_groundpl, {name = "default:grass_with_leaves_2"})
					elseif n_ground == "default:dirt_with_leaves_1" then
						minetest.set_node(p_groundpl, {name = "default:dirt"})
						
						--[[
					elseif n_ground == "default:junglegrass" then
						minetest.set_node(p_groundpl, {name = "default:grass_5"})
					elseif n_ground == "default:grass_5" then
						minetest.set_node(p_groundpl, {name = "default:grass_4"})
					elseif n_ground == "default:grass_4" then
						minetest.set_node(p_groundpl, {name = "default:grass_3"})
					elseif n_ground == "default:grass_3" then
						minetest.set_node(p_groundpl, {name = "default:grass_2"})
					elseif n_ground == "default:grass_2" then
						minetest.set_node(p_groundpl, {name = "default:grass_1"})
					elseif n_ground == "default:grass_1" then
						minetest.set_node(p_groundpl, {name = "default:dirt"})	
]]						
					--============	
					--============	
						
						
						
						
					elseif n_ground == "default:dirt_with_snow" then
						minetest.set_node(p_groundpl, {name = "default:dirt_with_snow_trail"})
					elseif n_ground == "default:dirt_trail" or
							n_ground == "default:dirt_with_grass_trail" or
							n_ground == "default:dirt_with_dry_grass_trail" then
						if math.random() <= TRACHA then
							minetest.set_node(p_groundpl, {name = "default:trail_trail"})
						end

					elseif n_ground == "default:sand" then
						minetest.set_node(p_groundpl, {name = "default:sand_trail"})
					elseif n_ground == "default:desert_sand" then
						minetest.set_node(p_groundpl, {name = "default:desert_sand_trail"})
					elseif n_ground == "default:silver_sand" then
						minetest.set_node(p_groundpl, {name = "default:silver_sand_trail"})

					elseif n_snow == "default:snow" then
						minetest.set_node(p_snowpl, {name = "default:snow_trail"})
					elseif n_ground == "default:snowblock" then
						minetest.set_node(p_groundpl, {name = "default:snowblock_trail"})
					elseif n_ground == "default:snowblock" then
						if math.random() <= ICECHA then
							minetest.set_node(p_groundpl, {name = "default:ice"})
						end

					elseif n_snow == "farming:wheat_5" or
							n_snow == "farming:wheat_6" or
							n_snow == "farming:wheat_7" or
							n_snow == "farming:wheat_8" then
						minetest.set_node(p_snowpl, {name = "default:wheat_trail",
							param2 = math.random(0, 1)})
					end
				end

				player_pos_previous[player:get_player_name()] = {
					x = player_pos[player:get_player_name()].x,
					y = player_pos[player:get_player_name()].y,
					z = player_pos[player:get_player_name()].z
				}
			end
		end
	end)
end

-- ABM

if EROSION then
	minetest.register_abm({
		nodenames = {
			"default:dirt_trail",
			"default:dirt_with_grass_trail",
			"default:fall_grass_trail",
			"default:dirt_with_dry_grass_trail",
			"default:dirt_with_rainforest_litter_trail",
			"default:dirt_with_coniferous_litter_trail",
			"default:dirt_with_snow_trail",
			"default:sand_trail",
			"default:sand_with_food_trail",
			"default:desert_sand_trail",
			"default:silver_sand_trail",
			"default:snow_trail",
			"default:snowblock_trail",
			"default:trail_trail"
		},
		interval = EROINT,
		chance = EROCHA,
		action = function(pos, node, _, _)
			local nodename = node.name

			if nodename == "default:dirt_trail" then
				minetest.set_node(pos, {name = "default:dirt"})
			elseif nodename == "default:dirt_with_grass_trail" then
				minetest.set_node(pos, {name = "default:dirt_with_grass"})
			elseif nodename == "default:fall_grass_trail" then
				minetest.set_node(pos, {name = "mymonths:fall_grass"})
			elseif nodename == "default:dirt_with_dry_grass_trail" then
				minetest.set_node(pos, {name = "default:dirt_with_dry_grass"})
			elseif nodename == "default:dirt_with_snow_trail" then
				minetest.set_node(pos, {name = "default:dirt_with_snow"})
			elseif nodename == "default:sand_trail" then
				minetest.set_node(pos, {name = "default:sand"})
			elseif nodename == "default:desert_sand_trail" then
				minetest.set_node(pos, {name = "default:desert_sand"})
			elseif nodename == "default:sand_with_food_trail" then
				minetest.set_node(pos, {name = "default:sand_with_food"})
			elseif nodename == "default:silver_sand_trail" then
				minetest.set_node(pos, {name = "default:silver_sand"})
			elseif nodename == "default:snow_trail" then
				minetest.set_node(pos, {name = "default:snow"})
			elseif nodename == "default:snowblock_trail" then
				minetest.set_node(pos, {name = "default:snowblock"})
			elseif nodename == "default:trail_trail" then
				minetest.set_node(pos, {name = "default:dirt"})
			end
		end
	})
end

--[[
License of source code
----------------------

The MIT License (MIT)
Copyright (C) 2013-2017 paramat

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

For more details:
https://opensource.org/licenses/MIT

License of media (textures)
---------------------------

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
Copyright (C) 2013-2017 paramat

You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

ShareAlike — If you remix, transform, or build upon the material, you must distribute
your contributions under the same license as the original.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/3.0/
]]