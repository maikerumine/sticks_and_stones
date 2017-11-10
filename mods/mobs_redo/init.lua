
local path = minetest.get_modpath("mobs")

-- Mob API
dofile(path .. "/api.lua")

-- Rideable Mobs
dofile(path .. "/mount.lua")

-- Mob Items
dofile(path .. "/crafts.lua")

-- Mob Spawner
--dofile(path .. "/spawner.lua")

-- Lucky Blocks
--dofile(path .. "/lucky_block.lua")


-- Mob types
dofile(path .. "/mob_bat.lua")
dofile(path .. "/mob_bee.lua")
dofile(path .. "/mob_birds.lua")
dofile(path .. "/mob_bugs.lua")
dofile(path .. "/mob_butterfly.lua")
dofile(path .. "/mob_croc.lua")
--dofile(path .. "/mob_desert_stone_monster.lua")
dofile(path .. "/mob_fish.lua")
dofile(path .. "/mob_jack.lua")
dofile(path .. "/mob_jellyfish.lua")

--for v4  --DISCONTINUED DO NOT USE
--dofile(path .. "/mob_just_test_griefer.lua")
--dofile(path .. "/mob_griefer_ghost.lua")
--for v5
dofile(path .. "/mob_just_test_griefer_v5.lua")
dofile(path .. "/mob_griefer_ghost_v5.lua")

dofile(path .. "/mob_shark.lua")
--dofile(path .. "/mob_stone_monster.lua")
dofile(path .. "/mob_turtle.lua")

--mobs:alias_mob("castle_weapons:crossbow_bolt_entity", "default:tool_crossbow_bolt_entity")
minetest.log("action", "[MOD] Maikerumine Mobs Redo loaded")
