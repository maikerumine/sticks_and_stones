

minetest.register_alias("default:copper_nugget", "sas_core:copper_nugget")
minetest.register_alias("default:orangehot_copper_ingot", "sas_core:orangehot_copper_ingot")
minetest.register_alias("default:copper_bar", "sas_core:copper_bar")
minetest.register_alias("default:orangehot_copper_bar", "sas_core:orangehot_copper_ingot")
minetest.register_alias("default:orangehot_copper_ribbon", "sas_core:orangehot_copper_ribbon")
minetest.register_alias("default:orangehot_copper_plate", "sas_core:orangehot_copper_plate")
minetest.register_alias("default:copper_plate", "sas_core:copper_plate")
minetest.register_alias("default:copper_hardware", "sas_core:copper_hardware")


--[[
--M E T A L C R A F T--
minetest.register_craftitem("default:copper_lump", {
	description = "Copper Lump  --Craft with charcoal to make smeltable copper bloom material",
	inventory_image = "default_copper_lump.png",
})


minetest.register_craftitem("default:copper_bloom_material", {
	description = "Copper bloom material  --Smelt in Bloomery to make copper bloom",
	inventory_image = "default_copper_bloom_material.png^[makealpha:255,255,255",
})

minetest.register_craftitem("default:copper_bloom", {
	description = "Copper Bloom  --Smelt in Bloomery to make copper ingot",
	inventory_image = "default_copper_bloom.png",
})
]]
minetest.register_craftitem("sas_core:copper_nugget", {
	description = "Copper Nugget  --Use gravelsieve to get copper nuggets",
	inventory_image = "default_steel_nugget.png^[colorize:orange:75",
})
--[[
minetest.register_craftitem("default:copper_ingot", {
	description = "Copper Ingot  --Smelt copper lump in Bloomery to make copper ingots or break into nuggets",
	inventory_image = "default_copper_ingot.png",
})
]]
minetest.register_craftitem("sas_core:orangehot_copper_ingot", {
	description = "Orangehot Copper Ingot  --Smelt copper ingot in Bloomery to make orangehot copper ingot to use for making other copper shapes",
	inventory_image = "default_copper_ingot.png^[colorize:red:75",
})

--[[
minetest.register_craftitem("sas_core:orangehot_copper_slab", {
	description = "Orangehot Copper Slab  --Smelt copper slab in Bloomery to make orangehot copper slab.",
	inventory_image = "default_copper_block.png^[colorize:red:75",
})
]]

minetest.register_craftitem("sas_core:copper_bar", {
	description = "Copper Bar Stock  --Use to make items like special farming tools",
	inventory_image = "default_steel_bar.png^[colorize:orange:175",
})

minetest.register_craftitem("sas_core:orangehot_copper_bar", {
	description = "Orangehot Copper Bar Stock  --Hot",
	inventory_image = "default_steel_bar.png^[makealpha:255,255,255^[colorize:red:175",
})

minetest.register_craftitem("sas_core:orangehot_copper_ribbon", {
	description = "Orangehot Copper Ribbon Stock  --Hot",
	inventory_image = "default_steel_ribbon.png^[makealpha:255,255,255^[colorize:red:75",
})

minetest.register_craftitem("sas_core:orangehot_copper_plate", {
	description = "Orangehot Copper Flat Plate Stock  --Hot",
	inventory_image = "ores_copper_sheet.png^[colorize:red:75",
})

minetest.register_craftitem("sas_core:copper_plate", {
	description = "Copper Flat Plate Stock  --Use to make metals like watering jar",
	inventory_image = "ores_copper_sheet.png^[colorize:grey:15",
})
--[[
minetest.register_craftitem("sas_core:copper_hinge", {
	description = "Copper Hinge  --Craft orangehot copper with swage, anvil, and hammer to make 2 hinges",
	inventory_image = "default_wrought_component_hinge.png",
})

minetest.register_craftitem("sas_core:copper_hardware", {
	description = "Copper Hardware  --Craft with orangehot bars to make a bunch of Nuts and Bolts",
	inventory_image = "default_hardware.png^[makealpha:255,255,255",
})

minetest.register_craftitem("sas_core:copper_spring_heavy", {
	description = "Heavy Duty Spring  --For fabricating crossbows and other strong sprung contraptions",
	inventory_image = "default_spring_heavy.png^[makealpha:255,255,255",
})

minetest.register_craftitem("sas_core:copper_spring_light", {
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
	output = 'sas_core:copper_bloom',
	recipe = {
		{'sas_core:copper_nugget', 'sas_core:copper_nugget', 'sas_core:copper_nugget'},
	}
})
]]


--[[
minetest.register_craft({
	output = 'default:copper_ingot',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"}},
	recipe = {
		{'default:copper_ingot', 'sas_core:tool_anvil', 'sas_core:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:copper_ingot',
	replacements = {{"sas_core:stonebrick", "sas_core:stonebrick 2"}},
	recipe = {
		{'', 'default:stonebrick', ''},
		{'', 'sas_core:copper_bloom', ''},
		{'default:stonebrick', 'sas_core:copper_bloom', 'default:stonebrick'},
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
	output = 'sas_core:orangehot_copperblock',
	recipe = {
		{'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot'},
		{'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot'},
		{'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot'},
	}
})

minetest.register_craft({
	output = 'sas_core:orangehot_copper_slab',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"}},
	recipe = {
		{'', '', ''},
		{'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot', 'sas_core:tool_anvil'},
		{'sas_core:orangehot_copper_ingot', 'sas_core:orangehot_copper_ingot', 'sas_core:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'sas_core:copper_nugget 3',
	recipe = {
		{'default:copper_ingot'},
	}
})


minetest.register_craft({
	output = 'sas_core:copper_nugget 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"}},
	recipe = {
		{'default:copper_lump', 'sas_core:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'default:copper_lump',
	recipe = {
		{'sas_core:copper_nugget 3'},
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
	output = 'sas_core:copper_bar',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:swage_block", "sas_core:swage_block"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"}},
	recipe = {
		{'sas_core:orangehot_copper_ingot','',''},
		{'sas_core:orangehot_copper_ingot','',''},
		{'sas_core:orangehot_copper_ingot','sas_core:swage_block','sas_core:tool_gravel_sieve_hammer'},
	}
})

--S T E E L   P L A T E--
minetest.register_craft({
	output = 'sas_core:orangehot_copper_plate',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"}},
	recipe = {
		{'','',''},
		{'','','sas_core:tool_steel_tongs'},
		{'sas_core:orangehot_copper_ingot','sas_core:tool_anvil','sas_core:tool_gravel_sieve_hammer'},
	}
})

minetest.register_craft({
	output = 'sas_core:copper_plate',
	replacements = {{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"}},
	recipe = {
		{'','',''},
		{'','','sas_core:tool_steel_tongs'},
		{'sas_core:orangehot_copper_plate','',''},
	}
})

--S T E E L   R I B B O N--
minetest.register_craft({
	output = "sas_core:orangehot_copper_ribbon",
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"},{"sas_core:tool_steel_mandrel", "sas_core:tool_steel_mandrel"}},
	recipe = {
		{'', 'sas_core:orangehot_copper_bar', ''},
		{'','sas_core:tool_steel_mandrel', 'sas_core:tool_steel_tongs'},
		{'', 'sas_core:tool_anvil', 'sas_core:tool_gravel_sieve_hammer'},
	},
})


--S T E E L   H A R D W A R E--
minetest.register_craft({
	output = 'sas_core:copper_hardware 9',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:swage_block", "sas_core:swage_block"}},
	recipe = {
		{'','',''},
		{'','',''},
		{'sas_core:orangehot_copper_bar','sas_core:swage_block','sas_core:tool_gravel_sieve_hammer'},
	}
})


--[[

--S T E E L   S P R I N G S--

--heavy spring

minetest.register_craft({
	output = 'sas_core:copper_spring_heavy 1',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"}},
	recipe = {
		{'','','sas_core:tool_steel_tongs'},
		{'sas_core:orangehot_copper_bar','bucket:bucket_water','sas_core:orangehot_copper_bar'},
		{'sas_core:tool_anvil','sas_core:redhot_copper_bar','sas_core:tool_gravel_sieve_hammer'},
	}
})


--light spring

minetest.register_craft({
	output = 'sas_core:copper_spring_light 3',
	replacements = {{"sas_core:tool_gravel_sieve_hammer", "sas_core:tool_gravel_sieve_hammer"},{"sas_core:tool_anvil", "sas_core:tool_anvil"},{"bucket:bucket_water", "bucket:bucket_empty"},{"sas_core:tool_steel_tongs", "sas_core:tool_steel_tongs"}},
	recipe = {
		{'','','sas_core:tool_steel_tongs'},
		{'','bucket:bucket_water',''},
		{'sas_core:orangehot_copper_bar','sas_core:tool_anvil','sas_core:tool_gravel_sieve_hammer'},
	}
})
]]

--H E A T T R E A T--


minetest.register_craft({
	type = 'cooking',
	recipe = 'stairs:slab_copperblock',
	output = 'stairs:slab_orangehot_copperblock',
	cooktime = 200,
})

