
minetest.register_alias("default:rotten_wood", "sas_core:rotten_wood")
minetest.register_alias("stairs:stair_rotten_wood", "stairs:stair_rotten_wood")
minetest.register_alias("stairs:slab_rotten_wood", "stairs:slab_rotten_wood")



--rotten wood
minetest.register_node("sas_core:rotten_wood", {
	description = "Rotten Wood",
	tiles = {"rotten_wood.png"},
	is_ground_content = false,
	groups = {crumbly=3, not_in_creative_inventory = 1},
})



--===================================
--wood 				--> rotten
minetest.register_abm({
	nodenames = {"sas_core:wood"},
	neighbors = {"sas_core:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","sas_core:water_source", "sas_core:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="sas_core:rotten_wood"})
	end,
})
--wood stair		--> rotten
minetest.register_abm({
	nodenames = {"stairs:stair_wood"},
	neighbors = {"sas_core:water_source", "sas_core:water_flowing"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:stair_rotten_wood"})
	end,
})
--wood slab			--> rotten
minetest.register_abm({
	nodenames = {"stairs:slab_wood"},
	neighbors = {"sas_core:water_source", "sas_core:water_flowing"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:slab_rotten_wood"})
	end,
})
--===================================
--wood				--> dirt
minetest.register_abm({
	nodenames = {"sas_core:rotten_wood"},
	neighbors = {"sas_core:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","sas_core:water_source", "sas_core:water_flowing", "mymonths:puddle"},
	interval = 120.0,
	chance = 10,
	action = function(pos)
		minetest.env:add_node(pos, {name="sas_core:dirt"})
	end,
})
--wood stair		--> dirt
minetest.register_abm({
	nodenames = {"stairs:stair_rotten_wood"},
	neighbors = {"sas_core:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","sas_core:water_source", "sas_core:water_flowing", "mymonths:puddle"},
	interval = 120.0,
	chance = 10,
	action = function(pos)
		minetest.env:add_node(pos, {name="sas_core:dirt"})
	end,
})
--wood slab			--> dirt
minetest.register_abm({
	nodenames = {"stairs:slab_rotten_wood"},
	neighbors = {"sas_core:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","sas_core:water_source", "sas_core:water_flowing", "mymonths:puddle"},
	interval = 120.0,
	chance = 10,
	action = function(pos)
		minetest.env:add_node(pos, {name="sas_core:dirt"})
	end,
})



--junglewood
--wood 				--> rotten
minetest.register_abm({
	nodenames = {"sas_core:junglewood"},
	neighbors = {"sas_core:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","sas_core:water_source", "sas_core:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="sas_core:rotten_wood"})
	end,
})
--wood stair		--> rotten
minetest.register_abm({
	nodenames = {"stairs:stair_junglewood"},
	neighbors = {"sas_core:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","sas_core:water_source", "sas_core:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:stair_rotten_wood"})
	end,
})
--wood slab			--> rotten
minetest.register_abm({
	nodenames = {"stairs:slab_junglewood"},
	neighbors = {"sas_core:rotten_wood", "stairs:stair_rotten_wood", "stairs:slab_rotten_wood","sas_core:water_source", "sas_core:water_flowing", "mymonths:puddle"},
	interval = 10.0,
	chance = 30,
	action = function(pos)
		minetest.env:add_node(pos, {name="stairs:slab_rotten_wood"})
	end,
})
