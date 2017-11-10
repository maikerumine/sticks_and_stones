minetest.register_alias("default:orangehot_copper_slab", "stairs:slab_orangehot_steelblock")

--M E T A L C R A F T--
minetest.register_craftitem("default:copper_lump", {
	description = "Copper Lump  --Craft with charcoal to make smeltable copper bloom material",
	inventory_image = "default_copper_lump.png",
})
--[[
minetest.register_craftitem("default:copper_bloom_material", {
	description = "Copper bloom material  --Smelt in Bloomery to make copper bloom",
	inventory_image = "default_copper_bloom_material.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:copper_bloom", {
	description = "Copper BSloom  --Smelt in Bloomery to make copper ingot",
	inventory_image = "default_copper_bloom.png",
})
]]
minetest.register_craftitem("default:copper_nugget", {
	description = "Copper Nugget  --Use gravelsieve to get copper nuggets",
	inventory_image = "default_steel_nugget.png^[colorize:orange:75",
})

minetest.register_craftitem("default:copper_ingot", {
	description = "Copper Ingot  --Smelt copper lump in Bloomery to make copper ingots or break into nuggets",
	inventory_image = "default_copper_ingot.png",
})

minetest.register_craftitem("default:orangehot_copper_ingot", {
	description = "Orangehot Copper Ingot  --Smelt copper ingot in Bloomery to make orangehot copper ingot to use for making other copper shapes",
	inventory_image = "default_copper_ingot.png^[colorize:red:75",
})

--[[
minetest.register_craftitem("default:orangehot_copper_slab", {
	description = "Orangehot Copper Slab  --Smelt copper slab in Bloomery to make orangehot copper slab.",
	inventory_image = "default_copper_block.png^[colorize:red:75",
})
]]

minetest.register_craftitem("default:copper_bar", {
	description = "Copper Bar Stock  --Use to make items like special farming tools",
	inventory_image = "default_steel_bar.png^[colorize:orange:175",
})

minetest.register_craftitem("default:orangehot_copper_bar", {
	description = "Orangehot Copper Bar Stock  --Hot",
	inventory_image = "default_steel_bar.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("default:orangehot_copper_ribbon", {
	description = "Orangehot Copper Ribbon Stock  --Hot",
	inventory_image = "default_steel_ribbon.png^[makealpha:255,255,255^[colorize:red:75",
})

minetest.register_craftitem("default:orangehot_copper_plate", {
	description = "Orangehot Copper Flat Plate Stock  --Hot",
	inventory_image = "ores_copper_sheet.png^[colorize:red:75",
})

minetest.register_craftitem("default:copper_plate", {
	description = "Copper Flat Plate Stock  --Use to make metals like watering jar",
	inventory_image = "ores_copper_sheet.png^[colorize:grey:15",
})
--[[
minetest.register_craftitem("default:copper_hinge", {
	description = "Copper Hinge  --Craft orangehot copper with swage, anvil, and hammer to make 2 hinges",
	inventory_image = "default_wrought_component_hinge.png",
})

minetest.register_craftitem("default:copper_hardware", {
	description = "Copper Hardware  --Craft with orangehot bars to make a bunch of Nuts and Bolts",
	inventory_image = "default_hardware.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:copper_spring_heavy", {
	description = "Heavy Duty Spring  --For fabricating crossbows and other strong sprung contraptions",
	inventory_image = "default_spring_heavy.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:copper_spring_light", {
	description = "Small Spring  --For fabricating small mechanical apparati",
	inventory_image = "default_spring_light.png^[makealpha:255,255,255",
})

]]

--===================================
--===================================
--M E T A L  C R A F T I N G--
--===================================
--===================================
--[[
minetest.register_craft({
	output = 'default:copper_bloom_material',
	recipe = {
		{'default:copper_lump', 'default:charcoal'},
	}
})
]]


--[[
minetest.register_craft({
	output = 'default:copper_ingot',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"}},
	recipe = {
		{'default:copper_bloom', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:copper_ingot',
	replacements = {{"default:stonebrick", "default:stonebrick 2"}},
	recipe = {
		{'', 'default:stonebrick', ''},
		{'', 'default:copper_bloom', ''},
		{'default:stonebrick', 'default:copper_bloom', 'default:stonebrick'},
	}
})
]]


minetest.register_craft({
	output = 'default:copperblock',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'default:orangehot_copperblock',
	recipe = {
		{'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot'},
		{'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot'},
		{'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot'},
	}
})

minetest.register_craft({
	output = 'default:orangehot_copperslab',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"}},
	recipe = {
		{'', '', ''},
		{'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot', 'default:tool_anvil'},
		{'default:orangehot_copper_ingot', 'default:orangehot_copper_ingot', 'default:tool_gravel_sieve_hammer'},
	}
})
--[[
minetest.register_craft({
	output = 'default:copper_nugget 3',
	recipe = {
		{'default:copper_ingot'},
	}
})
]]

minetest.register_craft({
	output = 'default:copper_nugget 3',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"}},
	recipe = {
		{'default:copper_lump', 'default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:copper_lump',
	recipe = {
		{'default:copper_nugget 3'},
	}
})

minetest.register_craft({
	output = 'default:copper_ingot 9',
	recipe = {
		{'default:copperblock'},
	}
})



--S T E E L   B A R--
minetest.register_craft({
	output = 'default:copper_bar',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:swage_block", "default:swage_block"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'default:orangehot_copper_ingot','',''},
		{'default:orangehot_copper_ingot','',''},
		{'default:orangehot_copper_ingot','default:swage_block','default:tool_gravel_sieve_hammer'},
	}
})

--S T E E L   P L A T E--
minetest.register_craft({
	output = 'default:orangehot_copper_plate',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','',''},
		{'','','default:tool_steel_tongs'},
		{'default:orangehot_copper_ingot','default:tool_anvil','default:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:copper_plate',
	replacements = {{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','',''},
		{'','','default:tool_steel_tongs'},
		{'default:orangehot_copper_plate','',''},
	}
})

--S T E E L   R I B B O N--
minetest.register_craft({
	output = "default:orangehot_copper_ribbon",
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"default:tool_steel_tongs", "default:tool_steel_tongs"},{"default:tool_steel_mandrel", "default:tool_steel_mandrel"}},
	recipe = {
		{'', 'default:orangehot_copper_bar', ''},
		{'','default:tool_steel_mandrel', 'default:tool_steel_tongs'},
		{'', 'default:tool_anvil', 'default:tool_gravel_sieve_hammer'},
	},
})


--S T E E L   H A R D W A R E--
minetest.register_craft({
	output = 'default:copper_hardware 9',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:swage_block", "default:swage_block"}},
	recipe = {
		{'','',''},
		{'','',''},
		{'default:orangehot_copper_bar','default:swage_block','default:tool_gravel_sieve_hammer'},
	}
})


--[[

--S T E E L   S P R I N G S--

--heavy spring

minetest.register_craft({
	output = 'default:copper_spring_heavy 1',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','','default:tool_steel_tongs'},
		{'default:orangehot_copper_bar','bucket:bucket_water','default:orangehot_copper_bar'},
		{'default:tool_anvil','default:redhot_copper_bar','default:tool_gravel_sieve_hammer'},
	}
})


--light spring

minetest.register_craft({
	output = 'default:copper_spring_light 3',
	replacements = {{"default:tool_gravel_sieve_hammer", "default:tool_gravel_sieve_hammer"},{"default:tool_anvil", "default:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"},{"default:tool_steel_tongs", "default:tool_steel_tongs"}},
	recipe = {
		{'','','default:tool_steel_tongs'},
		{'','bucket:bucket_water',''},
		{'default:orangehot_copper_bar','default:tool_anvil','default:tool_gravel_sieve_hammer'},
	}
})
]]

--H E A T T R E A T--


minetest.register_craft({
	type = 'cooking',
	recipe = 'stairs:slab_copperblock',
	output = 'stairs:slab_orangehot_steelblock',
	cooktime = 200,
})

