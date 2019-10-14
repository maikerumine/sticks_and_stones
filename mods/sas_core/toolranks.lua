if minetest.get_modpath("toolranks") then

  minetest.override_item("sas_core:tool_hand_axe", {
    original_description = "Small Rocks Hand Axe",
    description = toolranks.create_description("Small Rocks Hand Axe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_hammer", {
    original_description = "Steel hammer for repairing tools on the anvil",
    description = toolranks.create_description("Steel hammer for repairing tools on the anvil", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_climbing_pick", {
    original_description = "Climbing Pick",
    description = toolranks.create_description("Climbing Pick", 0, 1),
    after_use = toolranks.new_afteruse})
--[[
  minetest.override_item("sas_core:tool_tree_pruning_shears", {
    original_description = "Pruning Shears -Used for quick collecting of leaves-",
    description = toolranks.create_description("Pruning Shears -Used for quick collecting of leaves-", 0, 1),
    after_use = toolranks.new_afteruse})
]]
  minetest.override_item("sas_core:tool_battleaxe", {
    original_description = "Battleaxe",
    description = toolranks.create_description("Battleaxe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_gravel_sieve_hammer", {
    original_description = "Hammer converts Cobblestone into Gravel",
    description = toolranks.create_description("Hammer converts Cobblestone into Gravel", 0, 1),
    after_use = toolranks.new_afteruse})





--sas tools pick
  minetest.override_item("sas_core:tool_pick_stone", {
    original_description = "Stone Pickaxe",
    description = toolranks.create_description("Stone Pickaxe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_pick_steel", {
    original_description = "Steel Pickaxe",
    description = toolranks.create_description("Steel Pickaxe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_pick_iron", {
    original_description = "Wrought Iron Pickaxe",
    description = toolranks.create_description("Wrought Iron Pickaxe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_pick_redhot_iron", {
    original_description = "Redhot Steel Pickaxe",
    description = toolranks.create_description("Redhot Steel Pickaxe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_pick_hardened_steel", {
    original_description = "Hardened Steel Pickaxe",
    description = toolranks.create_description("Hardened Steel Pickaxe", 0, 1),
    after_use = toolranks.new_afteruse})

--tools shovel
  minetest.override_item("sas_core:tool_shovel_stone", {
    original_description = "Stone Shovel",
    description = toolranks.create_description("Stone Shovel", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_shovel_steel", {
    original_description = "Steel Shovel",
    description = toolranks.create_description("Steel Shovel", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_shovel_iron", {
    original_description = "Wrought Iron Shovel",
    description = toolranks.create_description("Wrought Iron Shovel", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_shovel_redhot_iron", {
    original_description = "Redhot Steel Shovel",
    description = toolranks.create_description("Redhot Steel Shovel", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_shovel_hardened_steel", {
    original_description = "Hardened Steel Shovel",
    description = toolranks.create_description("Hardened Steel Shovel", 0, 1),
    after_use = toolranks.new_afteruse})


--tools axe
  minetest.override_item("sas_core:tool_axe_stone", {
    original_description = "Stone Axe",
    description = toolranks.create_description("Stone Axe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_axe_steel", {
    original_description = "Steel Axe",
    description = toolranks.create_description("Steel Axe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_axe_iron", {
    original_description = "Wrought Iron Axe",
    description = toolranks.create_description("Wrought Iron Axe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_axe_redhot_iron", {
    original_description = "Redhot Steel Axe",
    description = toolranks.create_description("Redhot Steel Axe", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_axe_hardened_steel", {
    original_description = "Hardened Steel Axe",
    description = toolranks.create_description("Hardened Steel Axe", 0, 1),
    after_use = toolranks.new_afteruse})


--tools axe
  minetest.override_item("sas_core:tool_sword_stone", {
    original_description = "Stone Sword",
    description = toolranks.create_description("Stone Sword", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_sword_steel", {
    original_description = "Steel Sword",
    description = toolranks.create_description("Steel Sword", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_sword_iron", {
    original_description = "Wrought Iron Sword",
    description = toolranks.create_description("Wrought Iron Sword", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_sword_redhot_iron", {
    original_description = "Redhot Steel Sword",
    description = toolranks.create_description("Redhot Steel Sword", 0, 1),
    after_use = toolranks.new_afteruse})

  minetest.override_item("sas_core:tool_sword_hardened_steel", {
    original_description = "Hardened Steel Sword",
    description = toolranks.create_description("Hardened Steel Sword", 0, 1),
    after_use = toolranks.new_afteruse})


end
