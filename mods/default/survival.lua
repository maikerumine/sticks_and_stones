
minetest.register_alias("survival:machete_steel", "default:tool_machete_steel")
minetest.register_alias("survival:sleeping_bag", "default:bed_sleeping_bag")
minetest.register_alias("survival:leafy_bed", "default:bed_leafy_bed")
minetest.register_alias("survival:energy_bar", "default:food_energy_bar")
minetest.register_alias("survival:spigot", "default:spigot")
minetest.register_alias("survival:raw_kabob", "default:raw_kabob")
minetest.register_alias("survival:cooked_kabob", "default:food_cooked_kabob")
minetest.register_alias("survival:slug_cooked", "default:slug_cooked")
minetest.register_alias("survival:slug_raw", "default:slug_raw")
minetest.register_alias("survival:cricket_cooked", "default:food_cricket_cooked")
minetest.register_alias("survival:cricket_raw", "default:cricket_raw")
minetest.register_alias("survival:worm_cooked", "default:food_worm_cooked")
minetest.register_alias("survival:worm_raw", "default:worm_raw")
minetest.register_alias("survival:centipede_cooked", "default:food_centipede_cooked")
minetest.register_alias("survival:centipede_raw", "default:centipede_raw")
minetest.register_alias("survival:milipede_cooked", "default:food_milipede_cooked")
minetest.register_alias("survival:milipede_raw", "default:milipede_raw")
minetest.register_alias("survival:oyster_cooked", "default:food_oyster_cooked")
minetest.register_alias("survival:oyster_raw", "default:oyster_raw")
minetest.register_alias("survival:mussel_cooked", "default:food_mussel_cooked")
minetest.register_alias("survival:mussel_raw", "default:mussel_raw")
minetest.register_alias("survival:sugar", "default:sugar")
minetest.register_alias("bucket:bucket_sap", "bucket:bucket_sap")
minetest.register_alias("survival:raw_kabob", "default:raw_kabob")
minetest.register_alias("survival:shell", "default:shell")
minetest.register_alias("survival:nesting", "default:nesting")
minetest.register_alias("survival:sand_with_food", "default:sand_with_food")


minetest.register_abm({
   label = 'sand with food',
	nodenames = {"default:sand"},
	neighbors = {"group:water"},
	interval = 30,
	chance = 75,
	action = function(pos, node)
		local name = minetest.get_node(pos).name
		if name == "default:sand" then
			if minetest.find_node_near(pos, 3, {"group:water"}) == nil then
				return
			end
		minetest.set_node(pos, {name='default:sand_with_food'})
		end
	end,
})


minetest.register_craft({
		output = 'default:tool_machete_steel 1',
		recipe = {
			{'', 'default:cord', 'default:steel_ingot'},
			{'default:glue', 'default:steel_ingot', 'default:cord'},
			{'group:stick', 'default:glue', ''},
		}
})

minetest.register_craft({
		output = 'default:bed_sleeping_bag 1',
		recipe = {
		{'default:cord', 'default:cord', 'default:cord'},
		{'default:fabric', 'default:fabric', 'default:fabric'}
		},
})

minetest.register_craft({
		output = 'default:bed_leafy_bed 1',
		recipe = {
		{'default:leaves', '', 'default:leaves'},
		{'default:leaves', 'default:leaves', 'default:leaves'}
		}
})

minetest.register_craft({
		output = 'default:food_energy_bar 1',
		recipe = {
		{'default:apple', 'default:apple', 'default:apple'},
		{'default:sugar', 'mobs:honey', 'default:sugar'},
		{'farming:seed_wheat', 'farming:seed_wheat', 'farming:seed_wheat'},
		}
})

minetest.register_craft({
		output = 'default:spigot 1',
		recipe = {
		{'default:clay', '', ''},
		{'default:clay', 'group:stick', ''},
		{'default:clay', '', 'group:stick'}
		}
})

minetest.register_craft({
		output = 'default:raw_kabob 1',
		recipe = {
		{'default:mussel_raw', 'default:mussel_raw', 'default:mussel_raw'},
		{'default:oyster_raw', 'default:oyster_raw', 'default:oyster_raw'},
		{'group:stick', '', ''},
		}
})

minetest.register_craft({
		type = 'cooking',
		output = 'default:food_slug_cooked',
		recipe = 'default:slug_raw',
		cooktime = 1,
		})
		
minetest.register_craft({
		type = 'cooking',
		output = 'default:food_cricket_cooked',
		recipe = 'default:cricket_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'default:food_worm_cooked',
		recipe = 'default:worm_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'default:food_centipede_cooked',
		recipe = 'default:centipede_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'default:food_milipede_cooked',
		recipe = 'default:milipede_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'default:food_oyster_cooked',
		recipe = 'default:oyster_raw',
		cooktime = 3,
		replacements = {{'default:oyster_raw', 'default:shell'}},
})

minetest.register_craft({
		type = 'cooking',
		output = 'default:food_mussel_cooked',
		recipe = 'default:mussel_raw',
		cooktime = 3,
		replacements = {{'default:mussel_raw', 'default:shell'}},
})

minetest.register_craft({
		type = 'cooking',
		output = 'default:sugar 4',
		recipe = 'default:bucket_sap',
		cooktime = 30,
		replacements = {{'default:bucket_sap', 'bucket:bucket_empty'}},
})

minetest.register_craft({
		type = 'cooking',
		output = 'default:food_cooked_kabob',
		recipe = 'default:raw_kabob',
		cooktime = 7,
})


minetest.register_craftitem('default:shell', {
	description = 'old shell',
	inventory_image = 'survival_shell.png',
})

minetest.register_craftitem('default:bucket_sap', {
	description = 'bucket with sap',
	inventory_image = 'survival_bucket_sap.png',
	stack_max = 1,
})

minetest.register_craftitem('default:bucket_sap_cooked', {
	description = 'bucket with cooked sap',
	inventory_image = 'survival_bucket_sap.png^[colorize:brown:75',
	stack_max = 1,
})

minetest.register_craft({
	output = 'default:sugar 4',
	replacements = {{'default:bucket_sap_cooked', 'bucket:bucket_empty'}},
	recipe = {
		{'default:bucket_sap_cooked'},
	}
})
--[[
minetest.register_craft({
		type = 'cooking',
		output = 'default:sugar 4',
		recipe = 'default:bucket_sap',
		cooktime = 30,
		replacements = {{'default:bucket_sap', 'bucket:bucket_empty'}},
})
]]
minetest.register_craftitem('default:nesting', {
	description = 'Nesting materials',
	inventory_image = 'survival_nesting.png',
	groups = {kindling=1},
})



local food_table = { --craft, desc, invimg, health, hydration
{'food_slug_cooked', 'cooked slug', 'slug_cooked', .25, .1},
{'slug_raw', 'raw slug', 'slug_raw', .25, .1},
{'cricket_raw', 'cricket', 'cricket_raw', .25, .1},
{'food_cricket_cooked', 'cooked cricket', 'cricket_cooked', .125, .125},
{'worm_raw', 'worm', 'worm_raw', .25, .2},
{'food_worm_cooked', 'cooked worm', 'worm_cooked', .125, .1},
{'centipede_raw', 'centipede', 'centipede_raw', .25, .15},
{'food_centipede_cooked', 'cooked centipede', 'centipede_cooked', .25, .1},
{'milipede_raw', 'milipede', 'milipede_raw', -4, .1},
{'food_milipede_cooked', 'cooked milipede', 'milipede_cooked', -3, 0},
{'oyster_raw', 'raw oyster', 'oyster_raw', .5, .45},
{'food_oyster_cooked', 'cooked oyster', 'oyster_cooked', .6, .35},
{'mussel_raw', 'raw mussel', 'mussel_raw', -.7, .6},
{'food_mussel_cooked', 'cooked mussel', 'mussel_cooked', .6, .35},
{'sugar', 'sugar', 'sugar', .1, -1},
{'raw_kabob', 'uncooked seafood kabob', 'raw_kabob', 1, 1.5},
{'food_cooked_kabob', 'seafood kabob', 'cooked_kabob', 2.5, 1},
{'food_energy_bar', 'energy bar', 'energy_bar', 10, -4}
}


for i in ipairs (food_table) do
	local craft = food_table[i][1]
	local desc = food_table[i][2]
	local invimg = food_table[i][3]
	local health = food_table[i][4]
	local hydration = food_table[i][5]

minetest.register_craftitem('default:'..craft, {
	description = desc,
	inventory_image = 'survival_'..invimg..'.png',
	on_use = function(itemstack, user, pointed_thing)
		--thirsty.drink(user, hydration, 20)
		local eat_func = minetest.item_eat(health)
		return eat_func(itemstack, user, pointed_thing)
	end,
})
end


--[[  --bake into default nodes
minetest.override_item('default:dirt_with_grass',{
	drop = {
		max_items = 2,
		items = {
			{
			items = {'default:slug_raw'},
			rarity = 30,
			},
			{
			items = {'default:worm_raw'},
			rarity = 30,
			},
			{
			items = {'default:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
})
]]
--This will probably need to be a few nodes to show the states it can be in.
minetest.register_node('default:spigot', {
	description = 'spigot',
	drawtype = 'mesh',
	mesh = 'spigot.obj',
	tiles = {{name='default_wood.png'},{name='default_clay.png'}},
--	inventory_image = 'placeholder.png',
	groups = {choppy=2, dig_immediate=2,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-.35, -.2, 0, .35, .5, .5}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.35, -.2, 0, .35, .5, .5}, -- Right, Bottom, Back, Left, Top, Front
		},
    on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('sap', 1)
		meta:set_string('formspec',
			'size[8,9]'..
			'label[1,0;You need a bucket to collect sap.]' ..
               'list[current_name;sap;1,1.5;1,1]'..
               'list[current_player;main;0,5;8,4;]')
		meta:set_string('infotext', 'Sap Spigot')
	end,
	on_timer = function(pos, elapsed)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('sap', 'bucket:bucket_empty') then --make sure the bucket is still there
			inv:set_stack('sap', 1,'default:bucket_sap')
			meta:set_string('infotext', 'bucket filled with sap, please replace.')
			timer:stop()
			return
		end
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('sap', 'bucket:bucket_empty') then
			timer:start(240)
			meta:set_string('infotext', 'gathering sap.. this could take a while.')
		end
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local timer = minetest.get_node_timer(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string('infotext', 'You need a bucket to collect sap.')
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == 'sap' then
			if stack:get_name() == ('bucket:bucket_empty') then
				return 1
			else
				return 0
			end
		end
	end,
	after_place_node = function(pos, placer, itemstack)
		local n = minetest.get_node(pos) --get the location of the placed node
		if not n or not n.param2 then
			minetest.remove_node(pos)
			return true
		end
		local dir = minetest.facedir_to_dir(n.param2)
		local p1 = {x=pos.x+dir.x, y=pos.y, z=pos.z+dir.z} --node placed on
		local p2 = {x=pos.x+dir.x, y=pos.y+1, z=pos.z+dir.z} --node above previous
		local p3 = {x=pos.x+dir.x, y=pos.y-1, z=pos.z+dir.z} --node below first
		local n2 = minetest.get_node_or_nil(p1)
		local n3 = minetest.get_node_or_nil(p2)
		local n4 = minetest.get_node_or_nil(p3)
		
		--[[
			'default:tree'
			'default:jungletree' 
			'default:pine_tree' 
			'default:aspen_tree' 
			'default:acacia_tree'
			]]

			if n2.name and n3.name and n4.name ~= 'default:pine_tree' then
				minetest.remove_node(pos)
				return true
			end
			
			
			
			
			
			
	end,
})

minetest.register_node('default:bed_sleeping_bag', {
	description = 'sleeping bag',
	drawtype = 'mesh',
	mesh = 'survival_sleeping_bag.obj',
	tiles = {'beds_bed_top_bottom.png'},
	groups = {choppy=2, snappy=3,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5},
		},
	after_place_node = function(pos, placer, itemstack)
			local n = minetest.get_node_or_nil(pos) --get the location of the placed node
			if not n or not n.param2 then
				minetest.remove_node(pos) --???
				return true
			end
			local dir = minetest.facedir_to_dir(n.param2) --figure out what direction the node is facing
			local p = {x=pos.x+dir.x, y=pos.y, z=pos.z+dir.z}  --position
			local n2 = minetest.get_node_or_nil(p)  --what node is next in line after the node we placed?
			local def = minetest.registered_items[n2.name] or nil
			if not n2 or not def or not def.buildable_to then --remove the node if it shouldn't be placeable.
				minetest.remove_node(pos)
				return true
			end
		end,
	on_rightclick = function(pos, node, clicker)
			beds.on_rightclick(pos, clicker)
	end,
})

minetest.register_node('default:bed_leafy_bed', {
	description = 'bed of leaves',
	drawtype = 'mesh',
	mesh = 'survival_leafy_bed.obj',
	tiles = {'default_grass.png^default_jungleleaves.png'},
	groups = {choppy=2, snappy=3,},
	drop = {
		max_items = 4,
		items = {
			{
			items = {'default:slug_raw'},
			rarity = 60,
			},
			{
			items = {'default:stick 4'},
			rarity = 10,
			},
			{
			items = {'default:stick 3'},
			rarity = 10,
			},
			{
			items = {'default:leaves 3'},
			rarity = 10,
			},
			{
			items = {'default:leaves 1'},
			},
		},
	},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5}, -- Right, Bottom, Back, Left, Top, Front
		},
	after_place_node = function(pos, placer, itemstack)
			local n = minetest.get_node_or_nil(pos) --get the location of the placed node
			if not n or not n.param2 then
				minetest.remove_node(pos)
				return true
			end
			local dir = minetest.facedir_to_dir(n.param2) --figure out what direction the node is facing
			local p = {x=pos.x+dir.x, y=pos.y, z=pos.z+dir.z}
			local n2 = minetest.get_node_or_nil(p)
			local def = minetest.registered_items[n2.name] or nil
			if not n2 or not def or not def.buildable_to then --remove the node if it shouldn't be placeable.
				minetest.remove_node(pos)
				return true
			end
		end,
	on_rightclick = function(pos, node, clicker)
			beds.on_rightclick(pos, clicker)
	end,
})

minetest.register_node('default:sand_with_food', {
	description = 'Sand',
	tiles = {'default_desert_sand.png'},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, not_in_creative_inventory=1},
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

minetest.register_node('default:bird_nest', {
	description = 'Bird Nest',
	drawtype = 'mesh',
	mesh = 'survival_nest.obj',
	tiles = {'darkage_straw_bale.png'},
	groups = {flammable=1, snappy=1, crumbly=3},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'default:nesting 4'},
			},
			{
			items = {'default:gold_lump'},
			rarity = 15,
			},
			{
			items = {'default:mese_crystal'},
			rarity = 25,
			},
		},
	},
})


--==========================================
--==========================================
--==========================================
--==========================================
--L I C E N S E--
--==========================================
--==========================================
--==========================================
--==========================================
--[[

All the graphics and code in this mod are licensed under creative commons 0.
Code and graphics by Nathan.


# Mod Contributors
Nathan

# Survival
This is a Minetest mod that adds survival related items

## Forum Topic
https://forum.minetest.net/viewtopic.php?f=9&t=11517

## Licensing
CC0

## Dependencies
- farming
- default
- wool
- beds
- thirsty?


#
Items currently included:
Machete
Bugs/food
Sleeping bags
Leafy beds
barrels, like chests but barrel shapes

#
Planned:
Better integration with the Thirsty mod


5-11-15:
Removed the drinking parts of code, the thirsty mod does a great job, just use that if you want drinking.
Updated the readme and cleaned up stray print code from debugging.

4-29-15:
Kabobs are here, craft with three mussels, three oysters, and a stick, once crafted enjoy raw, or cook for more health.

4-25-15:
Wells added, they require a hole in the ground three nodes deep to be placed on top. Just click on the inside of the hole, in the top node. They need to be placed in dirt. Right click on a well top and put in a bucket or canteen to get some water. The bucket will act exactly as any other bucket with water, the canteen with water can be cooked to purify and then be drank. Drinking dirty water can result in a loss of health.

4-11-15:
Spigots are working!!! They can only be placed on tree trunks, and need a bucket to collect sap. Right now you just have the infotexts to give you statuses. Placing a bucket in the spigot will trigger a timer that will replace the empty bucket with a sap filled bucket. Cook the sap filled bucket to get sugar. Collection and cooking times will probably be tweaked yet. I want to add a graphic to the spigot that shows whether the bucket is placed and is empty or full, but I don't know if I can do that without creating three nodes. Updated the spigot model and texture.
Crafting recipe is 
c
cs
c s where c is clay and s is group stick

4-9-15:
Spigots now only place on tree trunks, though they have to be on the ground, not one node above the ground, not sure why...
added the bucket with sap and recipe for making sugar and the energy bar.

3-29-15:
Started working on the system for creating tree sap, and coding the options that only allow the spigot to be placed on a tree.

3-28-15:
Added an ABM that changes some sand near water to default:sand_with_food, which, as the name suggests, can contain some oysters or mussels. Added the oyster and mussels, along with their craft recipes. I'm debating over whether I should allow eating them raw in shell, or if they should have to be crafted out of the shell to eat raw, but left in shell to cook.

3-25-15:
Started work on the two new "beds". Added beds as a dependency and am using that code for the time being to handle sleeping.

3-18-15:
Added a couple more machetes. Created the forum topic. Added five bugs, some are poisonous, so be careful.

3-17-15:
Added a few machetes and start working on the drinking part of the mod.


3-11-15:
Added Barrels.

3-4-15:
Started mod, added cotton recipe. Uploaded to GitHub



]]




