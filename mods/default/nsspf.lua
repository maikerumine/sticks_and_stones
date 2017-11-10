--local path = minetest.get_modpath("nsspf")

--dofile(path.."/spawn.lua")
--dofile(path.."/mushrooms.lua")

function place_spore(itemstack, placer, pointed_thing, name, topoint, soilblock)

	local pt = pointed_thing

	-- check if pointing at a node
	if not pt or pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local uu = {x=pt.under.x, y=pt.under.y-1, z=pt.under.z}

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end

	-- if not protected then add node and remove 1 item from the itemstack
	if not minetest.is_protected(pt.under, placer:get_player_name()) then
		if (under.name == topoint) and (minetest.get_node(uu).name == soilblock) then
			minetest.set_node(uu, {name = name})
			minetest.sound_play("default_place_node", {pos = uu, gain = 1.0})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end
end

function nsspf_register_mycorrhizalmycelium (name, descr, tree, int, ch, spread)

	minetest.register_node("default:"..name.."_mycelium", {
		description = descr,
		tiles = {"mycorrhizalmycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	minetest.register_craftitem("default:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointed_thing)
			return place_spore(itemstack, placer, pointed_thing, "default:"..name.."_mycelium",tree, "default:dirt")
		end,
	})

	minetest.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {tree},
		interval = 30*int,
		chance = 200*ch,
		action = function(pos, node)
			local flag = 0
				for dx = -2,2 do
					for dy = -2,1 do
						for dz = -2,2 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = 1
								return
							end
						end
					end
				end
			--if no other mycelium have been found:
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "default:"..name.."_mycelium"})
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"air","default:water_source"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			minetest.set_node(pos, {name="default:"..name.."_fungusdirt"})
			minetest.get_node_timer(pos):start(300)
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_snow"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			minetest.set_node(pos, {name="default:dirt"})
		end
	})

	minetest.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"default:"..name.."_mycelium"},
		interval = 12*int,
		chance = 10*ch,
		action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "default:"..name.."_mycelium"})
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_grass"},
		interval = 5*int,
		chance = 1*ch,
		action = function(pos, node)
			local pos1 = {x=pos.x, y=pos.y+2, z=pos.z}
			local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
			local n = minetest.get_node(pos1).name
			local nn = minetest.get_node(pos2).name
			if (n== "air" or n=="group:flora") and nn== "default:dirt_with_grass" then
				minetest.set_node(pos1, {name = "default:"..name})
				minetest.get_node_timer(pos1):start(300)
			end
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"default:"..name.."_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = minetest.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									minetest.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "default:"..name.."_fungusdirt"})
									minetest.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})

end


nsspf_register_mycorrhizalmycelium ('amanita_muscaria','Amanita muscaria Mycelium', "default:pine_tree", 10, 10, 8)
nsspf_register_mycorrhizalmycelium ('amanita_phalloides','Amanita phalloides Mycelium', "default:pine_tree", 16, 12, 8)
nsspf_register_mycorrhizalmycelium ('boletus_edulis','Boletus edulis Mycelium', "default:tree", 10, 10, 8)
nsspf_register_mycorrhizalmycelium ('boletus_satanas','Boletus satanas Mycelium', "default:tree", 12, 12, 8)
nsspf_register_mycorrhizalmycelium ('boletus_pinophilus','Boletus pinophilus Mycelium', "default:pine_tree", 12, 12, 8)
nsspf_register_mycorrhizalmycelium ('suillus_grevillei','Suillus grevillei Mycelium','default:pine_tree', 8, 8, 12)
nsspf_register_mycorrhizalmycelium ('russula_xerampelina','Russula xerampelina Mycelium', "default:pine_tree", 9, 9, 12)
nsspf_register_mycorrhizalmycelium ('cantharellus_cibarius','Cantherellus cibarius Mycelium', "default:pine_tree", 8, 8, 14)
nsspf_register_mycorrhizalmycelium ('morchella_conica','Morchella conica Mycelium', "default:aspen_tree", 10, 10, 8)


--tuber
function nsspf_register_tuber (name, descr, tree, int, ch, gnam, spread)

	minetest.register_node("default:"..name.."_tuber_mycelium", {
		description = descr,
		tiles = {"tuber_mycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	minetest.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {tree},
		interval = 30*int,
		chance = 300*ch,
		action = function(pos, node)
			local flag = 0
				for dx = -2,2 do
					for dy = -2,1 do
						for dz = -2,2 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = 1
								return
							end
						end
					end
				end
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "default:"..name.."_tuber_mycelium"})
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_tuber_mycelium"},
		neighbors = {"air","default:water_source"},
		interval = 1,
		chance = 1,
		action =
		function(pos, node)
			minetest.set_node(pos, {name="default:"..name.."_fungusdirt"})
			minetest.get_node_timer(pos):start(300)
		end
	})

	minetest.register_node("default:"..name.."_fruit", {
		description = descr.." Truffle",
		tiles = {"default_dirt.png"},
		drop = "default:"..name,
		groups = {crumbly = 3, not_in_creative_inventory =1},
	})

	minetest.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"default:"..name.."_tuber_mycelium"},
		interval = 12*int,
		chance = 6*ch,
		action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "default:"..name.."_tuber_mycelium"})
		end
	})

	minetest.register_craftitem("default:"..name, {
		description = descr,
		on_use = minetest.item_eat(gnam),
		image = name..".png",
	})

	minetest.register_craftitem("default:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointed_thing)
			return place_spore(itemstack, placer, pointed_thing, "default:"..name.."_tuber_mycelium",tree, "default:dirt")
		end,
	})

	minetest.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"default:"..name.."_tuber_mycelium"},
		interval = 12*int,
		chance = 8*ch,
		action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "default:"..name.."_fruit"})
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_tuber_mycelium"},
		neighbors = {"default:"..name.."_tuber_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = minetest.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									minetest.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "default:"..name.."_fungusdirt"})
									minetest.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})


end

nsspf_register_tuber ("tuber_magnatum_pico","Tuber magnatum pico","default:tree", 14, 14, 20, 20)
nsspf_register_tuber ("tuber_melanosporum","Tuber melanosporum","default:tree", 12, 12, 16, 20)
nsspf_register_tuber ("tuber_borchii","Tuber borchii","default:aspen_tree", 10, 10, 12, 20)
nsspf_register_tuber ("terfezia_arenaria","Terfezia arenaria","default:acacia_tree", 11, 11, 12, 20)

function nssbf_register_saprotrophicontrees (name, descr, tree, int, ch)

minetest.register_abm({
	nodenames = {tree},
	neighbors = {"air"},
	interval = 20*int,
	chance = 40*ch,
	action = function(pos, node)
		local pos1 = {x=pos.x, y=pos.y, z=pos.z-1}
		local n = minetest.get_node(pos1).name
		if n == 'air' then
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z-1}, {name = "default:"..name})
			minetest.get_node_timer(pos):start(300)
		end
	end
})


end

nssbf_register_saprotrophicontrees ('armillaria_mellea', 'Armillaria mellea', 'default:tree', 16, 24)
nssbf_register_saprotrophicontrees ('panellus_pusillus', 'Panellus pusillus', 'default:tree', 25, 52)
nssbf_register_saprotrophicontrees ('fomes_fomentarius', 'Fomes fomentarius', 'default:aspen_tree', 13, 18)
nssbf_register_saprotrophicontrees ('fistulina_hepatica', 'Fistulina hepatica', 'default:pine_tree', 16, 24)
nssbf_register_saprotrophicontrees ('mycena_chlorophos', 'Mycena clorophos', 'default:dirt', 30, 50)
nssbf_register_saprotrophicontrees ('clitocybula_azurea', 'Clitocybula azurea', 'default:jungletree', 12, 28)
nssbf_register_saprotrophicontrees ('ganoderma_lucidum', 'Ganoderma lucidum', 'default:jungletree', 14, 28)


local OPEN_TIME_START = 0.2
local OPEN_TIME_END = 0.8
local OPEN_CHECK = 10

set_fluo = function (pos)
	if (minetest.get_node_light(pos, nil) < 10) and ((minetest.get_timeofday() < 19500) or (minetest.get_timeofday() > 5000)) then
		minetest.add_node(pos, { name = "default:mycena_chlorophos_light" })
	else
		minetest.add_node(pos, { name = "default:mycena_chlorophos" })
	end
end

minetest.register_abm({
	nodenames = { "default:mycena_chlorophos", "default:mycena_chlorophos_light"},
	interval = OPEN_CHECK,
	chance = 1,

	action = function(pos, node, active_object_count, active_object_count_wider)
		set_fluo(pos)
	end
})

set_fluor = function (pos)
	if (minetest.get_node_light(pos, nil) < 10) and ((minetest.get_timeofday() < 19500) or (minetest.get_timeofday() > 5000)) then
		minetest.env:add_node(pos, { name = "default:panellus_pusillus_light" })
	else
		minetest.env:add_node(pos, { name = "default:panellus_pusillus" })
	end
end

minetest.register_abm({
	nodenames = { "default:panellus_pusillus", "default:panellus_pusillus_light" },
	interval = OPEN_CHECK,
	chance = 1,

	action = function(pos, node, active_object_count, active_object_count_wider)
		set_fluor(pos)
	end
})


--Saprotrophic fungi that grow on the ground

function nsspf_register_saprotrophicground (name, descr, int, ch, spread)

	minetest.register_node("default:"..name.."_mycelium", {
		description = descr,
		tiles = {"saprotrophic_mycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	minetest.register_craftitem("default:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointed_thing)
			return place_spore(itemstack, placer, pointed_thing, "default:"..name.."_mycelium","default:dirt_with_grass", "default:dirt")
		end,
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_grass"},
		interval = 3*int,
		chance = 1*ch,
		action = function(pos, node)
			local pos1 = {x=pos.x, y=pos.y+2, z=pos.z}
			local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
			local n = minetest.get_node(pos1).name
			local nn = minetest.get_node(pos2).name
			if (n== "air" or n=="group:flora") and nn== "default:dirt_with_grass" then
				minetest.set_node(pos1, {name = "default:"..name})
				minetest.get_node_timer(pos1):start(300)
			end
		end
	})

	minetest.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"default:"..name.."_mycelium"},
		interval = 6*int,
		chance = 7+ch,
		action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "default:"..name.."_mycelium"})
		end
	})

	minetest.register_abm({
		nodenames = {"default:dirt_with_grass"},
		neighbors = {"air"},
		interval = 18*int,
		chance = 4500*ch,
		action = function(pos, node)
			local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
			local n = minetest.get_node(pos3).name
			if n== "default:dirt" then
				minetest.set_node(pos3, {name = "default:"..name.."_mycelium"})
			end
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"air","default:water_source"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			minetest.set_node(pos, {name="default:"..name.."_fungusdirt"})
			minetest.get_node_timer(pos):start(300)
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"default:"..name.."_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = minetest.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									minetest.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "default:"..name.."_fungusdirt"})
									minetest.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})
end

nsspf_register_saprotrophicground ('macrolepiota_procera','Macrolepiota procera', 10, 12, 10)
nsspf_register_saprotrophicground ('coprinus_atramentarius','Coprinus atramentarius', 16, 16, 6)
nsspf_register_saprotrophicground ('lycoperdon_pyriforme','Lycoperdon piriforme',10, 10, 8)
nsspf_register_saprotrophicground ('psilocybe_cubensis','Psilocybe cubensis', 20, 16, 12)
nsspf_register_saprotrophicground ('gyromitra_esculenta','Gyromitra esculenta', 12, 14, 8)

--jungle fungi

minetest.register_abm({
	nodenames = {"default:jungletree"},
	neighbors = {"air"},
	interval = 180.0,
	chance = 600,
	action = function(pos, node)
		local pos1 = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = minetest.env:get_node(pos1).name
		if n == 'air' then
			minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "default:marasmius_haematocephalus"})
			minetest.get_node_timer(pos):start(300)
		end
	end
})


minetest.register_abm({
	nodenames = {"default:jungletree"},
	neighbors = {"air"},
	interval = 180.0,
	chance = 450,
	action = function(pos, node)
		local pos1 = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = minetest.env:get_node(pos1).name
		if n == 'air' then
			minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "default:lentinus_strigosus"})
			minetest.get_node_timer(pos):start(300)
		end
	end
})

--snowbank fungi

function nsspf_register_snowbankfungi (name, descr, int, ch, spread)

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"air"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			minetest.set_node(pos, {name="default:"..name.."_fungusdirt"})
			minetest.get_node_timer(pos):start(300)
		end
	})

	minetest.register_node("default:"..name.."_mycelium", {
		description = descr,
		tiles = {"snowbank_mycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	minetest.register_craftitem("default:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointed_thing)
			return place_spore(itemstack, placer, pointed_thing, "default:"..name.."_mycelium","default:dirt_with_snow", "default:dirt")
		end,
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_snow"},
		interval = 2*int,
		chance = 3*ch,
		action = function(pos, node)
			local pos1 = {x=pos.x, y=pos.y+2, z=pos.z}
			local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
			local n = minetest.get_node(pos1).name
			local nn = minetest.get_node(pos2).name
			if (n== "air" or n== "default:snow") and nn== "default:dirt_with_snow" then
				minetest.set_node(pos1, {name = "default:"..name})
				minetest.get_node_timer(pos1):start(300)
			end
		end
	})

	minetest.register_abm({
		nodenames = {"default:dirt_with_snow"},
		neighbors = {"air", "default:snow"},
		interval = 18*int,
		chance = 5500*ch,
		action = function(pos, node)
			local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
			local n = minetest.get_node(pos3).name
			if n== "default:dirt" then
				minetest.set_node(pos3, {name = "default:"..name.."_mycelium"})
			end
		end
	})

	minetest.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"default:"..name.."_mycelium"},
		interval = 12*int,
		chance = 10*ch,
		action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "default:"..name.."_mycelium"})
		end
	})

	minetest.register_abm({
		nodenames = {"default:"..name.."_mycelium"},
		neighbors = {"default:"..name.."_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = minetest.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									minetest.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "default:"..name.."_fungusdirt"})
									minetest.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})

end

nsspf_register_snowbankfungi ('plectania_nannfeldtii','Plectania nannfeldtii', 18, 10, 8)
nsspf_register_snowbankfungi ('hygrophorus_goetzii','Hygrophorus goetzii', 16, 10, 6)
nsspf_register_snowbankfungi ('clitocybe_glacialis','Clitocybe glacialis', 15, 10, 6)

	minetest.register_abm({
		nodenames = {"flowers:mushroom_red"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"})
		end
	})

	minetest.register_abm({
		nodenames = {"flowers:mushroom_brown"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"})
		end
	})

	
	
	
	minetest.register_node("default:boletus_edulis", {
	description = "Boletus edulis",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"boletus_edulis.png"},
	groups = {snappy=3},
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	on_use = minetest.item_eat(2),
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
    collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_boletus_edulis", {
	description = "Cooked Boletus edulis",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_boletus_edulis.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(16),
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
	on_place = function(itemstack, placer, pointed_thing)
  		return
  	end,
    collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:boletus_edulis_fungusdirt", {
	description = "Boletus edulis Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:boletus_edulis_spores" 1'},
                 rarity = 16
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:cantharellus_cibarius", {
	description = "Cantharellus cibarius",
	drawtype = "mesh",
	mesh = "cantharellus_cibarius.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	tiles = {"cantharellus_cibarius.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(1),
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, -0.26, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, -0.26, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_cantharellus_cibarius", {
	description = "Cooked Cantharellus cibarius",
	drawtype = "mesh",
	mesh = "cantharellus_cibarius.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_cantharellus_cibarius.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(8),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, -0.26, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, -0.26, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cantharellus_cibarius_fungusdirt", {
	description = "Cantharellus cibarius Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:cantharellus_cibarius_spores" 1'},
                 rarity = 12
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:suillus_grevillei", {
	description = "Suillus grevillei",
	drawtype = "mesh",
	mesh = "suillus_grevillei.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"suillus_grevillei.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(1),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
    collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_suillus_grevillei", {
	description = "Cooked Suillus grevillei",
	drawtype = "mesh",
	mesh = "suillus_grevillei.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_suillus_grevillei.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(10),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
    collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:suillus_grevillei_fungusdirt", {
	description = "Suillus grevillei Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:suillus_grevillei_spores" 1'},
                 rarity = 8
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:morchella_conica", {
	description = "Morchella conica",
	drawtype = "mesh",
	mesh = "morchella_conica.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"morchella_conica.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.15, -0.49, -0.15, 0.15, 0.06, 0.15}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.15, -0.49, -0.15, 0.15, 0.06, 0.15}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_morchella_conica", {
	description = "Cooked Morchella conica",
	drawtype = "mesh",
	mesh = "morchella_conica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_morchella_conica.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(8),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.15, -0.49, -0.15, 0.15, 0.06, 0.15}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.15, -0.49, -0.15, 0.15, 0.06, 0.15}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:morchella_conica_fungusdirt", {
	description = "Morchella conica Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:morchella_conica_spores" 1'},
                 rarity = 12
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:russula_xerampelina", {
	description = "Russula xerampelina",
	drawtype = "mesh",
	mesh = "russula.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"russula_xerampelina.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-8),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_russula_xerampelina", {
	description = "Cooked Russula xerampelina",
	drawtype = "mesh",
	mesh = "russula.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_russula_xerampelina.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(6),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:russula_xerampelina_fungusdirt", {
	description = "Russula xerampelina Dirt",
	tiles = {"default_dirt.png"},
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:russula_xerampelina_spores" 1'},
                 rarity = 12
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:boletus_pinophilus", {
	description = "Boletus pinophilus",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"boletus_pinophilus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_boletus_pinophilus", {
	description = "Cooked Boletus pinophilus",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"cooked_boletus_pinophilus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(16),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:boletus_pinophilus_fungusdirt", {
	description = "Boletus pinophilus Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:boletus_pinophilus_spores" 1'},
                 rarity = 16
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:boletus_satanas", {
	description = "Boletus satanas",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"boletus_satanas.png"},
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	groups = {snappy=3},
	on_use = minetest.item_eat(-20),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_boletus_satanas", {
	description = "Cooked Boletus satanas",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_boletus_satanas.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-16),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:boletus_satanas_fungusdirt", {
	description = "Boletus satanas Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:boletus_satanas_spores" 1'},
                 rarity = 18
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:amanita_phalloides", {
	description = "Amanita phalloides",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"amanita_phalloides.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-20),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_amanita_phalloides", {
	description = "Cooked Amanita phalloides",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_amanita_phalloides.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-20),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:amanita_muscaria_fungusdirt", {
	description = "Amanita muscaria Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:amanita_muscaria_spores" 1'},
                 rarity = 16
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:amanita_muscaria", {
	description = "Amanita muscaria",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"amanita_muscaria.png"},
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	groups = {snappy=3},
	on_use = minetest.item_eat(-20),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_amanita_muscaria", {
	description = "Cooked Amanita muscaria",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_amanita_muscaria.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-18),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:amanita_phalloides_fungusdirt", {
	description = "Amanita phalloides Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:amanita_phalloides_spores" 1'},
                 rarity = 18
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:tuber_melanosporum_fungusdirt", {
	description = "Tuber melanosporum Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:tuber_melanosporum_spores" 1'},
                 rarity = 16
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:tuber_magnatum_pico_fungusdirt", {
	description = "Tuber magnatum pico Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:tuber_magnatum_pico_spores" 1'},
                 rarity = 30
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:tuber_borchii_fungusdirt", {
	description = "Tuber borchii Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:tuber_borchii_spores" 1'},
                 rarity = 12
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:terfezia_arenaria_fungusdirt", {
	description = "Terfezia arenaria Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:terfezia_arenaria_spores" 1'},
                 rarity = 8
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

--Saprotrophic fungi that live on trees

minetest.register_node("default:fistulina_hepatica", {
	description = "Fistulina hepatica",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"fistulina_hepatica.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(4),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_fistulina_hepatica", {
	description = "Cooked Fistulina hepatica",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_fistulina_hepatica.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(14),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:armillaria_mellea", {
	description = "Armillaria mellea",
	drawtype = "mesh",
	mesh = "armillaria_mellea.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"armillaria_mellea.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, 0, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, 0, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:fomes_fomentarius", {
	description = "Fomes fomentarius",
	drawtype = "mesh",
	mesh = "fomes_fomentarius.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"fomes_fomentarius.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-1),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, 0, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, 0, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_armillaria_mellea", {
	description = "Cooked Armillaria mellea",
	drawtype = "mesh",
	mesh = "armillaria_mellea.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_armillaria_mellea.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(12),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, 0, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, 0, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:mycena_chlorophos", {
	description = "Mycena chlorophos",
	drawtype = "mesh",
	mesh = "mycena_chlorophos.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"mycena_chlorophos.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_mycena_chlorophos", {
	description = "Cooked Mycena chlorophos",
	drawtype = "mesh",
	mesh = "mycena_chlorophos.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_mycena_chlorophos.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-4),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:mycena_chlorophos_light", {
	description = "Nocturn Mycena chlorophos",
	drawtype = "mesh",
	mesh = "mycena_chlorophos.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"mycena_chlorophos_light.png"},
	groups = {snappy=3},
	light_source = 8,
	on_use = minetest.item_eat(-2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:panellus_pusillus", {
	description = "Panellus pusillus",
	drawtype = "mesh",
	mesh = "panellus_pusillus.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"panellus_pusillus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_panellus_pusillus", {
	description = "Cooked Panellus pusillus",
	drawtype = "mesh",
	mesh = "panellus_pusillus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_panellus_pusillus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-4),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
    collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:panellus_pusillus_light", {
	description = "Nocturn Panellus pusillus",
	drawtype = "mesh",
	mesh = "panellus_pusillus.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"panellus_pusillus_light.png"},
	groups = {snappy=3},
	light_source = 8,
	on_use = minetest.item_eat(-2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

--Saprotrophic fungi that grow on the ground

minetest.register_node("default:macrolepiota_procera", {
	description = "Macrolepiota procera",
	drawtype = "mesh",
	mesh = "macrolepiota_procera.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"macrolepiota_procera.png"},
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	groups = {snappy=3},
	on_use = minetest.item_eat(3),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_macrolepiota_procera", {
	description = "Cooked Macrolepiota procera",
	drawtype = "mesh",
	mesh = "macrolepiota_procera.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_macrolepiota_procera.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(16),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:macrolepiota_procera_fungusdirt", {
	description = "Macrolepiota procera Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:macrolepiota_procera_spores" 1'},
                 rarity = 12
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:psilocybe_cubensis", {
	description = "Psilocybe cubensis",
	drawtype = "mesh",
	mesh = "psilocybe_cubensis.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"psilocybe_cubensis.png"},
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	groups = {snappy=3},
	on_use = minetest.item_eat(-7),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_psilocybe_cubensis", {
	description = "Cooked Psilocybe cubensis",
	drawtype = "mesh",
	mesh = "psilocybe_cubensis.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_psilocybe_cubensis.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:psilocybe_cubensis_fungusdirt", {
	description = "Psilocybe cubensis Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:psilocybe_cubensis_spores" 1'},
                 rarity = 16
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:lycoperdon_pyriforme", {
	description = "Lycoperdon pyriforme",
	drawtype = "mesh",
	mesh = "lycoperdon_pyriforme.b3d",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"lycoperdon_pyriforme.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(8),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_lycoperdon_pyriforme", {
	description = "Cooked Lycoperdon pyriforme",
	drawtype = "mesh",
	mesh = "lycoperdon_pyriforme.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_lycoperdon_pyriforme.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(12),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:lycoperdon_pyriforme_fungusdirt", {
	description = "Lycoperdon pyriforme Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:lycoperdon_pyriforme_spores" 1'},
                 rarity = 4
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:gyromitra_esculenta", {
	description = "Gyromitra esculenta",
	drawtype = "mesh",
	mesh = "gyromitra_esculenta.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"gyromitra_esculenta.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-20),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, -0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, -0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_gyromitra_esculenta", {
	description = "Cooked Gyromitra esculenta",
	drawtype = "mesh",
	mesh = "gyromitra_esculenta.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_gyromitra_esculenta.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-16),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, -0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, -0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:gyromitra_esculenta_fungusdirt", {
	description = "Gyromitra esculenta Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:gyromitra_esculenta_spores" 1'},
                 rarity = 18
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:coprinus_atramentarius", {
	description = "Coprinus atramentarius",
	drawtype = "mesh",
	mesh = "coprinus_atramentarius.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"coprinus_atramentarius.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-13),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_coprinus_atramentarius", {
	description = "Cooked Coprinus atramentarius",
	drawtype = "mesh",
	mesh = "coprinus_atramentarius.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_coprinus_atramentarius.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(6),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:coprinus_atramentarius_fungusdirt", {
	description = "Coprinus atramentarius Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:coprinus_atramentarius_spores" 1'},
                 rarity = 20
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

--jungle fungi

minetest.register_node("default:lentinus_strigosus", {
	description = "Lentinus strigosus",
	drawtype = "mesh",
	mesh = "lentinus_strigosus.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"lentinus_strigosus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(1),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_lentinus_strigosus", {
	description = "Cooked Lentinus strigosus",
	drawtype = "mesh",
	mesh = "lentinus_strigosus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_lentinus_strigosus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(16),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:ganoderma_lucidum", {
	description = "Ganoderma lucidum",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"ganoderma_lucidum.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(14),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_ganoderma_lucidum", {
	description = "Cooked Ganoderma lucidum",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_ganoderma_lucidum.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(4),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:marasmius_haematocephalus", {
	description = "Marasmius haematocephalus",
	drawtype = "mesh",
	mesh = "marasmius_haematocephalus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"marasmius_haematocephalus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-1),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_marasmius_haematocephalus", {
	description = "Cooked Marasmius haematocephalus",
	drawtype = "mesh",
	mesh = "marasmius_haematocephalus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_marasmius_haematocephalus.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-19),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.1, -0.49, -0.1, 0.1, -0.1, 0.1}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:clitocybula_azurea", {
	description = "Clitocybula_azurea",
	drawtype = "mesh",
	mesh = "clitocybula_azurea.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
	tiles = {"clitocybula_azurea.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-6),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_clitocybula_azurea", {
	description = "Cooked Clitocybula_azurea",
	drawtype = "mesh",
	mesh = "clitocybula_azurea.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_clitocybula_azurea.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(10),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.2, -0.4, 0.2, 0.2, 0.4, 0.5}, -- Right, Bottom, Back, Left, Top, Front
      },
})

--snowbank fungus

minetest.register_node("default:clitocybe_glacialis", {
	description = "Clitocybe glacialis",
	drawtype = "mesh",
	mesh = "clitocybe_glacialis.b3d",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"clitocybe_glacialis.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(1),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_clitocybe_glacialis", {
	description = "Cooked Clitocybe glacialis",
	drawtype = "mesh",
	mesh = "clitocybe_glacialis.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_clitocybe_glacialis.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(10),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:clitocybe_glacialis_fungusdirt", {
	description = "Clitocybe glacialis Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:clitocybe_glacialis_spores" 1'},
                 rarity = 16
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:hygrophorus_goetzii", {
	description = "Hygrophorus goetzii",
	drawtype = "mesh",
	mesh = "hygrophorus_goetzii.b3d",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"hygrophorus_goetzii.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-4),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_hygrophorus_goetzii", {
	description = "Cooked Hygrophorus goetzii",
	drawtype = "mesh",
	mesh = "hygrophorus_goetzii.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_hygrophorus_goetzii.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(8),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:hygrophorus_goetzii_fungusdirt", {
	description = "Hygrophorus goetzii Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:hygrophorus_goetzii_spores" 1'},
                 rarity = 14
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

minetest.register_node("default:plectania_nannfeldtii", {
	description = "Plectania nannfeldtii",
	drawtype = "mesh",
	mesh = "plectania_nannfeldtii.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"plectania_nannfeldtii.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-20),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:cooked_plectania_nannfeldtii", {
	description = "Cooked Plectania nannfeldtii",
	drawtype = "mesh",
	mesh = "plectania_nannfeldtii.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_plectania_nannfeldtii.png"},
	groups = {snappy=3},
	on_use = minetest.item_eat(-20),
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
	selection_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.3, -0.49, -0.3, 0.3, -0.3, 0.3}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("default:plectania_nannfeldtii_fungusdirt", {
	description = "Plectania nannfeldtii Dirt",
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "default:plectania_nannfeldtii_spores" 1'},
                 rarity = 20
             },
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

function nsspf_register_recipes (name)

minetest.register_craft({
	type = "cooking",
	output = "default:cooked_"..name,
	recipe = "default:"..name,
	cooktime = 10,
})

end

nsspf_register_recipes ('boletus_edulis')
nsspf_register_recipes ('boletus_pinophilus')
nsspf_register_recipes ('boletus_satanas')
nsspf_register_recipes ('suillus_grevillei')
nsspf_register_recipes ('morchella_conica')
nsspf_register_recipes ('amanita_phalloides')
nsspf_register_recipes ('amanita_muscaria')
nsspf_register_recipes ('cantharellus_cibarius')
nsspf_register_recipes ('russula_xerampelina')
nsspf_register_recipes ('fistulina_hepatica')
nsspf_register_recipes ('armillaria_mellea')
nsspf_register_recipes ('mycena_chlorophos')
nsspf_register_recipes ('panellus_pusillus')
nsspf_register_recipes ('macrolepiota_procera')
nsspf_register_recipes ('psilocybe_cubensis')
nsspf_register_recipes ('lycoperdon_pyriforme')
nsspf_register_recipes ('coprinus_atramentarius')
nsspf_register_recipes ('gyromitra_esculenta')
nsspf_register_recipes ('clitocybe_glacialis')
nsspf_register_recipes ('plectania_nannfeldtii')
nsspf_register_recipes ('hygrophorus_goetzii')
nsspf_register_recipes ('lentinus_strigosus')
nsspf_register_recipes ('ganoderma_lucidum')
nsspf_register_recipes ('marasmius_haematocephalus')
nsspf_register_recipes ('clitocybula_azurea')


	minetest.register_craft({
		output = 'default:amadou',
		type = "shapeless",
		recipe = {'default:fomes_fomentarius'},
	})

minetest.register_craftitem("default:amadou", {
	description = descr,
	image = "amadou.png",
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:amadou",
	burntime = 120,
})

if minetest.get_modpath("nssm") then

	minetest.register_craftitem("default:long_lasting_amadou", {
		description = 'Long Lasting Amadou',
		image = "long_lasting_amadou.png",
	})

	minetest.register_craft({
		output = 'default:long_lasting_amadou',
		type = "shapeless",
		recipe = {'nssm:black_powder', 'default:amadou'},
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "default:long_lasting_amadou",
		burntime = 400,
	})

end

if minetest.get_modpath("tnt") then

	minetest.register_craftitem("default:lasting_amadou", {
		description = 'Lasting amadou',
		image = "lasting_amadou.png",
	})

	minetest.register_craft({
		output = 'default:lasting_amadou',
		type = "shapeless",
		recipe = {'tnt:gunpowder', 'default:amadou'},
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "default:lasting_amadou",
		burntime = 300,
	})

end



--[[

License for the code: LGPL
License for all the models, textures and sound: CC BY-SA 4.0

]]