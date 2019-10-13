minetest.register_alias("default:head_1", "sas_core:head_1")
minetest.register_alias("default:head_2", "sas_core:head_1")
minetest.register_alias("default:head_3", "sas_core:head_1")
minetest.register_alias("default:head_4", "sas_core:head_1")
minetest.register_alias("default:head_5", "sas_core:head_1")
minetest.register_alias("default:head_6", "sas_core:head_1")
minetest.register_alias("default:head_7", "sas_core:head_1")
minetest.register_alias("default:head_8", "sas_core:head_1")
minetest.register_alias("default:head_9", "sas_core:head_1")
minetest.register_alias("default:head_10", "sas_core:head_1")
minetest.register_alias("default:head_11", "sas_core:head_1")
minetest.register_alias("default:head_12", "sas_core:head_1")
minetest.register_alias("default:head_13", "sas_core:head_1")
minetest.register_alias("default:head_14", "sas_core:head_1")
minetest.register_alias("default:head_15", "sas_core:head_1")
minetest.register_alias("default:head_16", "sas_core:head_1")
minetest.register_alias("default:head_17", "sas_core:head_1")
minetest.register_alias("default:head_18", "sas_core:head_1")
minetest.register_alias("default:head_19", "sas_core:head_1")
minetest.register_alias("default:head_20", "sas_core:head_1")
minetest.register_alias("default:head_21", "sas_core:head_1")
minetest.register_alias("default:head_22", "sas_core:head_1")
minetest.register_alias("default:head_23", "sas_core:head_1")
minetest.register_alias("default:head_24", "sas_core:head_1")
minetest.register_alias("default:head_25", "sas_core:head_1")
minetest.register_alias("default:head_26", "sas_core:head_1")
minetest.register_alias("default:head_27", "sas_core:head_1")
minetest.register_alias("default:head_28", "sas_core:head_1")
minetest.register_alias("default:head_29", "sas_core:head_1")
minetest.register_alias("default:head_30", "sas_core:head_1")


-- if you add new heads, you should change headnumber value accordingly

headnumber = 30

-- register head nodes

for i = 1, headnumber do

	local x = i + 1
	local y = i - 1
	if x > headnumber then x = 1 end
	if y < 1 then y = headnumber end

	minetest.register_node("sas_core:head_"..i, {
		description = "Head Number "..i,
		drawtype = "nodebox",
		tiles = {
			"heads_"..i.."_top.png",
			"heads_"..i.."_bottom.png",
			"heads_"..i.."_left.png",
			"heads_"..i.."_right.png",
			"heads_"..i.."_back.png",
			"heads_"..i.."_face.png",
		},
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.25, -0.5, -0.25, 0.25, 0, 0.25, },
			},
		},
		sunlight_propagates = true,
		walkable = true,
		selection_box = {
			type = "fixed",
			fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25, },
		},
		groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3},
		drop = "sas_core:head_"..i,
		on_rightclick = function(pos, node, clicker)
			node.name = "sas_core:head_"..x
			minetest.set_node(pos, node)
			if math.random(1, 3) == 1 then
				--minetest.sound_play("heads_ow", {pos = pos})
			end
		end,
		on_punch = function(pos, node, puncher)
			node.name = "sas_core:head_"..y
			minetest.set_node(pos, node)
			if math.random(1, 3) == 1 then
				--minetest.sound_play("heads_ow", {pos = pos})
			end
		end,
	})

end

-- register head craft
--[[
minetest.register_craft({
	output = "sas_core:head_1",
	recipe = {
		{"sas_core:bones"}
	}
})
]]

--[[
Bring Me The Head Mod

by thefamilygrog66

Description:
Craft and place an assortment of character heads, using textures from Zeg9's Skins Mod. Once placed, their textures can be changed by right-clicking or left-clicking on them.

Recipe:

    +-------+-------+-------+
    |       |       |       |
    +-------+-------+-------+
    |       | bones |       |
    +-------+-------+-------+
    |       |       |       |
    +-------+-------+-------+

Mod dependencies: bones

License:
Sourcecode: WTFPL
Graphics: 	Jordach (CC BY-SA 3.0):
				head_1
			Zeg9 (CC BY-SA 3.0):
				head_2
			jmf (WTFPL):
				head_3
				head_4
				head_5
				head_6
				head_7
				head_8
				head_9
				head_10
				head_11
			Chinchow (WTFPL):
				head_12
				head_13
				head_14
			HybridDog (CC BY-SA 3.0):
				head_15
				head_16
				head_17
				head_18
			Jordach (CC BY-NC-SA):
				head_19
				head_20
				head_21
				head_22
				head_23
				head_24
				head_25
				head_26
			Stuart Jones (WTFPL):
				head_27
			prof_turbo (WTFPL):
				head_28
				head_29
			jojoa1997 (CC BY-SA 3.0):
				head_30

				]]
