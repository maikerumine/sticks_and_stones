-- Bucket od sap

minetest.register_craftitem(":bucket:bucket_sap", {
	description = "bucket with sap",
	inventory_image = "survival_bucket_sap.png",
	stack_max = 1,
})

minetest.register_craftitem(":bucket:bucket_sap_cooked", {
	description = "bucket with cooked sap",
	inventory_image = "survival_bucket_sap.png^[colorize:brown:75",
	stack_max = 1,
})



-- bucket of molten metal

minetest.register_craftitem(":bucket:bucket_metal_nuggets", {
	description = "Bucket of Metal Nuggets",
	inventory_image = "bucket.png^[colorize:white:75",
	stack_max = 1,
})


minetest.register_craftitem(":bucket:bucket_metal_molten", {
	description = "Bucket of Molten Metal",
	inventory_image = "bucket_molten_iron.png^[colorize:red:75",
	stack_max = 1,
	--kinda difficult
	
	on_place = function(itemstack, user, pointed_thing)
	
				-- Must be pointing to node
				if pointed_thing.type ~= "node" then
					return
				end

				local node = minetest.get_node_or_nil(pointed_thing.under)
				local ndef = node and minetest.registered_nodes[node.name]

				-- Check if pointing to a buildable node
				--if ndef and ndef.buildable_to then
				
				if ndef and pointed_thing.type == "sas_core:mold_hinge" then
					minetest.set_node(pos, {name="sas_core:redhot_mold_hinge"})
					return ItemStack("bucket:bucket_empty")
				end

				if ndef and pointed_thing.type == "sas_core:mold_pick_head" then
					minetest.set_node(pos, {name="sas_core:redhot_mold_pick_head"})
					return ItemStack("bucket:bucket_empty")
				end
				if ndef and pointed_thing.type == "sas_core:mold_axe_head" then
					minetest.set_node(pos, {name="sas_core:redhot_mold_axe_head"})
					return ItemStack("bucket:bucket_empty")
				end
				if ndef and pointed_thing.type == "sas_core:mold_shovel_head" then
					minetest.set_node(pos, {name="sas_core:redhot_mold_shovel_head"})
					return ItemStack("bucket:bucket_empty")
				end
				if ndef and pointed_thing.type == "sas_core:mold_sword_head" then
					minetest.set_node(pos, {name="sas_core:redhot_mold_sword_head"})	
					return ItemStack("bucket:bucket_empty")
				end
	
					
					--if not below_ndef  then
						-- do not remove the bucket with the liquid
					--	return itemstack
					--end
		
	end,
	
	--[[
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			local node_def = minetest.registered_nodes[node.name]
			minetest.swap_node(pos, {name = node_def.gate, param2 = node.param2})
			minetest.sound_play(node_def.sound, {pos = pos, gain = 0.3,
				max_hear_distance = 8})
			return itemstack
		end,
		]]
		
		
})

--Crafts
minetest.register_craft({
	output = 'bucket:bucket_metal_nuggets',
	recipe = {
		{'', 'sas_core:iron_bloom', ''},
		{'sas_core:iron_bloom', 'bucket:bucket_empty', 'sas_core:iron_bloom'},
		{'sas_core:steel_nugget', 'sas_core:steel_nugget', 'sas_core:steel_nugget'},
	}
})

minetest.register_craft({
	output = 'sas_core:metal_molten_source',
	replacements = {{"bucket:bucket_metal_molten", "bucket:bucket_empty"}},
	recipe ={
		{ '','bucket:bucket_metal_molten',''},
		}

})


