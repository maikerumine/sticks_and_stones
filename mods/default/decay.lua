
--rotten wood
minetest.register_node("default:rotten_wood", {
	description = "Rotten Wood",
	tiles = {"rotten_wood.png"},
	is_ground_content = false,
	groups = {crumbly=3, not_in_creative_inventory = 1},
})



--===================================
--wood 				--> rotten
minetest.register_abm({
	nodenames = {"default:wood"},
	neighbors = {"default:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="default:rotten_wood"})
	end,
})
--wood stair		--> rotten
minetest.register_abm({
	nodenames = {"stairs:stair_wood"},
	neighbors = {"default:water_source", "default:water_flowing"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:stair_rotten_wood"})
	end,
})
--wood slab			--> rotten
minetest.register_abm({
	nodenames = {"stairs:slab_wood"},
	neighbors = {"default:water_source", "default:water_flowing"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:slab_rotten_wood"})
	end,
})
--===================================
--wood				--> dirt
minetest.register_abm({
	nodenames = {"default:rotten_wood"},
	neighbors = {"default:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 120.0,
	chance = 10,
	action = function(pos)
		minetest.env:add_node(pos, {name="default:dirt"})
	end,
})
--wood stair		--> dirt
minetest.register_abm({
	nodenames = {"stairs:stair_rotten_wood"},
	neighbors = {"default:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 120.0,
	chance = 10,
	action = function(pos)
		minetest.env:add_node(pos, {name="default:dirt"})
	end,
})
--wood slab			--> dirt
minetest.register_abm({
	nodenames = {"stairs:slab_rotten_wood"},
	neighbors = {"default:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 120.0,
	chance = 10,
	action = function(pos)
		minetest.env:add_node(pos, {name="default:dirt"})
	end,
})



--junglewood
--wood 				--> rotten
minetest.register_abm({
	nodenames = {"default:junglewood"},
	neighbors = {"default:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="default:rotten_wood"})
	end,
})
--wood stair		--> rotten
minetest.register_abm({
	nodenames = {"stairs:stair_junglewood"},
	neighbors = {"default:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:stair_rotten_wood"})
	end,
})
--wood slab			--> rotten
minetest.register_abm({
	nodenames = {"stairs:slab_junglewood"},
	neighbors = {"default:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","default:water_source", "default:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:slab_rotten_wood"})
	end,
})
