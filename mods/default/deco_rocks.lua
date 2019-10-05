----------------------
-- Decorative Rocks --
----------------------

-- I'm feeling a bit zen...

-- Place a small nodebox.
local function small_cube(grid, pos, diameters)
	local rock = {}

	rock[1] = pos.x
	rock[2] = pos.y
	rock[3] = pos.z
	rock[4] = pos.x + diameters.x
	rock[5] = pos.y + diameters.y
	rock[6] = pos.z + diameters.z
	grid[#grid+1] = rock
end


-- Create some tiles of small rocks that can be picked up.
local default_grid
--local tiles = {"default_stone.png", "default_desert_stone.png", "default_sandstone.png"}
local tiles = {"default_stone.png"}

for grid_count = 1,6 do
	local grid = {}
	for rock_count = 2, math.random(1,4) + 1 do
		local diameter = math.random(5,15)/100
		local x = math.random(1,80)/100 - 0.5
		local z = math.random(1,80)/100 - 0.5
		--step_sphere(grid, {x=x,y=-0.5,z=z}, {x=diameter, y=diameter, z=diameter})
		small_cube(grid, {x=x,y=-0.5,z=z}, {x=diameter, y=diameter, z=diameter})
	end

	--local stone = tiles[math.random(1,#tiles)]
	local stone = tiles[(grid_count % #tiles) + 1]

	minetest.register_node("default:small_rocks"..grid_count, {
		description = "Small Rocks",
		tiles = {stone},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		buildable_to = true,
		node_box = { type = "fixed", 
								 fixed = grid },
		selection_box = { type = "fixed", 
											fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
										},
		groups = {stone=1, oddly_breakable_by_hand=3, falling_node = 1},
		drop = "default:small_rocks",
		on_place = minetest.rotate_node,
		sounds = default.node_sound_stone_defaults(),
	})

	default_grid = grid
end

-- This is the inventory item, so we don't have six different stacks.
minetest.register_node("default:small_rocks", {
	description = "Small Rocks",
	tiles = {"default_stone.png"},
	inventory_image = "vmg_small_rocks.png",
	is_ground_content = true,
	walkable = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", 
							 fixed = default_grid },
	selection_box = { type = "fixed", 
										fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
									},
	groups = {stone=1, oddly_breakable_by_hand=3, falling_node = 1},
	sounds = default.node_sound_stone_defaults(),
})

--[[  removed op
-- Small rocks can be used to create cobblestone, if you like.
minetest.register_craft({
	output = "default:cobble",
	recipe = {
		{"", "", ""},
		{"default:small_rocks", "default:small_rocks", ""},
		{"default:small_rocks", "default:small_rocks", ""},
	},
})
]]

--Map Generation Stuff

minetest.register_on_generated(function(minp, maxp, seed)
	if maxp.y >= 2 and minp.y <= 0 then
		-- Generate small_rocks
		local perlin1 = minetest.get_perlin(329, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0,divs-1 do
		for divz=0,divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine small_rocks amount from perlin noise
			local pebble_amount = math.floor(perlin1:get2d({x=x0, y=z0}) ^ 2 * 2)
			-- Find random positions for small_rocks based on this random
			local pr = PseudoRandom(seed+1)
			for i=0,pebble_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				for y=30,0,-1 do
					if minetest.get_node({x=x,y=y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end
				
				if ground_y then
					local p = {x=x,y=ground_y+1,z=z}
					local nn = minetest.get_node(p).name
					-- Check if the node can be replaced
					if minetest.registered_nodes[nn] and
						minetest.registered_nodes[nn].buildable_to then
						nn = minetest.get_node({x=x,y=ground_y,z=z}).name
						-- If desert sand, add dry shrub
						if nn == "default:dirt_with_grass" then
							minetest.set_node(p,{name="default:small_rocks"..pr:next(1,2,3,4), param2=math.random(0,5)})
						elseif nn == "default:desert_sand" then
							minetest.set_node(p,{name="default:small_rocks"..pr:next(1,2,3,4), param2=math.random(0,5)})
						elseif nn == "default:silver_sand" then
							minetest.set_node(p,{name="default:small_rocks"..pr:next(1,2,3,4), param2=math.random(0,5)})
					    end
					end
				end
				
			end
		end
		end
	end
end)


