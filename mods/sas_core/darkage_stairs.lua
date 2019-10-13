
minetest.register_alias("default:slab_basalt_cobble", "stairs:slab_basalt_cobble")
minetest.register_alias("default:stair_basalt_cobble", "stairs:stair_basalt_cobble")
minetest.register_alias("default:stair_inner_basalt_cobble", "stairs:stair_inner_basalt_cobble")
minetest.register_alias("default:stair_outer_basalt_cobble", "stairs:stair_outer_basalt_cobble")
--[[
minetest.register_alias("default:slab_slate_tale", "stairs:slab_slate_tale")
minetest.register_alias("default:stair_slate_tale", "stairs:stair_slate_tale")
minetest.register_alias("default:stair_inner_slate_tale", "stairs:stair_inner_slate_tale")
minetest.register_alias("default:stair_outer_slate_tale", "stairs:stair_outer_slate_tale")
]]
minetest.register_alias("default:slab_slate_tale", "stairs:slab_slate_tile")
minetest.register_alias("default:stair_slate_tale", "stairs:stair_slate_tile")
minetest.register_alias("default:stair_inner_slate_tale", "stairs:stair_inner_slate_tile")
minetest.register_alias("default:stair_outer_slate_tale", "stairs:stair_outer_slate_tile")

minetest.register_alias("default:slab_straw", "stairs:slab_straw")
minetest.register_alias("default:stair_straw", "stairs:stair_straw")
minetest.register_alias("default:stair_inner_straw", "stairs:stair_inner_straw")
minetest.register_alias("default:stair_outer_straw", "stairs:stair_straw")

minetest.register_alias("default:slab_stone_brick", "stairs:slab_stone_brick")
minetest.register_alias("default:stair_stone_brick", "stairs:stair_stone_brick")
minetest.register_alias("default:stair_inner_stone_brick", "stairs:stair_inner_stone_brick")
minetest.register_alias("default:stair_outer_stone_brick", "stairs:stair_outer_stone_brick")

minetest.register_alias("default:slab_ors_cobble", "stairs:slab_ors_cobble")
minetest.register_alias("default:stair_ors_cobble", "stairs:stair_ors_cobble")
minetest.register_alias("default:stair_inner_ors_cobble", "stairs:stair_inner_ors_cobble")
minetest.register_alias("default:stair_outer_ors_cobble", "stairs:stair_outer_ors_cobble")

minetest.register_alias("default:slab_desert_stone_cobble", "stairs:slab_desert_stone_cobble")
minetest.register_alias("default:stair_desert_stone_cobble", "stairs:stair_desert_stone_cobble")
minetest.register_alias("default:stair_inner_desert_stone_cobble", "stairs:stair_inner_desert_stone_cobble")
minetest.register_alias("default:stair_outer_desert_stone_cobble", "stairs:stair_outer_desert_stone_cobble")



function sas_core.register_stairs(modname, item, groups, images, description)
  local recipeitem = modname..":"..item
  local itemname = modname..":stair_"..item
	minetest.register_node(itemname, {
		description = description.." stair",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
	})

	minetest.register_craft({
		output = itemname .. ' 4',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = itemname .. ' 4',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})

  itemname=modname..":slab_" .. item

	minetest.register_node(itemname, {
		description = description.." slab",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		is_ground_content = true,
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			-- If it's being placed on an another similar one, replace it with
			-- a full block
			local slabpos = nil
			local slabnode = nil
			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local n0 = minetest.env:get_node(p0)
			local n1 = minetest.env:get_node(p1)
			if n0.name == itemname then
				slabpos = p0
				slabnode = n0
			elseif n1.name == itemname then
				slabpos = p1
				slabnode = n1
			end
			if slabpos then
				-- Remove the slab at slabpos
				minetest.env:remove_node(slabpos)
				-- Make a fake stack of a single item and try to place it
				local fakestack = ItemStack(recipeitem)
				pointed_thing.above = slabpos
				fakestack = minetest.item_place(fakestack, placer, pointed_thing)
				-- If the item was taken from the fake stack, decrement original
				if not fakestack or fakestack:is_empty() then
					itemstack:take_item(1)
				-- Else put old node back
				else
					minetest.env:set_node(slabpos, slabnode)
				end
				return itemstack
			end
			
			-- Otherwise place regularly
			return minetest.item_place(itemstack, placer, pointed_thing)
		end,
	})

	minetest.register_craft({
		output = itemname .. ' 3',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

sas_core.register_stairs(":stairs","basalt_cobble",
	{cracky=3},
	{"darkage_basalt_cobble.png"},
	"Basalt Cobble"
)

sas_core.register_stairs(":stairs","slate_tile",
	{cracky=3},
	{"darkage_slate_tile.png"},
	"Slate Tile"
)

sas_core.register_stairs(":stairs","straw",
	 {snappy=3, flammable=2},
	{"darkage_straw.png"},
	"Straw"
)

sas_core.register_stairs(":stairs","stone_brick",
	{cracky=3},
	{"darkage_stone_brick.png"},
	"Stone Brick"
)

sas_core.register_stairs(":stairs","ors_cobble",
	{cracky=3},
	{"darkage_ors_cobble.png"},
	"Old Red Sandtone"
)

sas_core.register_stairs(":stairs","desert_stone_cobble",
	{cracky=3},
	{"darkage_desert_stone_cobble.png"},
	"Desert Stone Cobble"
)

