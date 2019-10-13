-- Nature Classic mod
-- Originally by neko259

-- Nature is slowly capturing the world!

local current_mod_name = minetest.get_current_modname()

--default = {}
sas_core.blossomqueue = {}
sas_core.blossomqueue_max = 1000

sas_core.blossom_node = "sas_core:blossom"
sas_core.blossom_leaves = "default:leaves"
sas_core.blossom_textures = { "default_leaves.png^nature_blossom.png" }

if minetest.get_modpath("moretrees") then
	sas_core.blossom_node = "moretrees:apple_blossoms"
	sas_core.blossom_leaves = "moretrees:apple_tree_leaves"
	sas_core.blossom_textures = { "moretrees_apple_tree_leaves.png^nature_blossom.png" }
	minetest.register_alias("sas_core:blossom", "sas_core:leaves")
end

sas_core.leaves_blossom_chance = 15
sas_core.blossom_leaves_chance = 5
sas_core.blossom_delay = 3600
sas_core.apple_chance = 10
sas_core.apple_spread = 2

sas_core.meta_blossom_time = "blossom_time"
sas_core.blossom_duration = sas_core.blossom_delay

function dumppos(pos)
	return "("..pos.x..","..pos.y..","..pos.z..")"
end

dofile(minetest.get_modpath(current_mod_name) .. "/config.lua")
--dofile(minetest.get_modpath(current_mod_name) .. "/global_function.lua")
--dofile(minetest.get_modpath(current_mod_name) .. "/blossom.lua")

minetest.log("info", "[Nature Classic] loaded!")



-- Blossoms and such

local function spawn_apple_under(pos)
    local below = {
		x = pos.x,
		y = pos.y - 1,
		z = pos.z,
	}
    if minetest.get_node(below).name == "air" then
		minetest.set_node(below, { name = "default:apple" })
    end
end

minetest.register_node(":"..sas_core.blossom_node, {
    description = "Apple blossoms",
    drawtype = "allfaces_optional",
    tiles = sas_core.blossom_textures,
    paramtype = "light",
    groups = { snappy = 3, leafdecay = 3, flammable = 2 ,falling_node = 1, dig_by_water = 1},
    sounds = default.node_sound_leaves_defaults(),
	waving = 1
})

minetest.register_craft({
    type = "fuel",
    recipe = sas_core.blossom_node,
    burntime = 2,
})

-- these ABMs can get heavy, so just enqueue the nodes

-- Adding Blossoms
-- Limit mass changes after block has not been loaded for some time:
-- Run ABM with higher frequency, but don't enqueue all blocks
minetest.register_abm({
    nodenames = { sas_core.blossom_leaves },
    interval = sas_core.blossom_delay / sas_core.leaves_blossom_chance,
    chance = sas_core.leaves_blossom_chance,

    action = function(pos, node, active_object_count, active_object_count_wider)
			if math.random(sas_core.leaves_blossom_chance) == 1 then
				sas_core.enqueue_node(pos, node, sas_core.blossom_node)
			end
    end
})

-- Removing blossoms
-- Limit mass changes after block has not been loaded for some time:
-- Run ABM with higher frequency, but don't enqueue all blocks
minetest.register_abm({
    nodenames = { sas_core.blossom_node },
    interval = sas_core.blossom_delay / sas_core.blossom_leaves_chance,
    chance = sas_core.blossom_leaves_chance,

    action = function(pos, node, active_object_count, active_object_count_wider)
			if math.random(sas_core.blossom_leaves_chance) == 1 then
				sas_core.enqueue_node(pos, node, sas_core.blossom_leaves)
			end
    end
})

-- Spawning apples
-- Limit mass changes after block has not been loaded for some time:
-- spawn apples with 10% chance, but with 10 times higher frequency
minetest.register_abm({
    nodenames = { sas_core.blossom_node },
    interval = sas_core.blossom_delay / 10,
    chance = sas_core.apple_chance,

    action = function(pos, node, active_object_count, active_object_count_wider)
		if math.random(10) == 0 and sas_core.dtime < 0.2 and not minetest.find_node_near(pos, sas_core.apple_spread, { "default:apple" }) then
			spawn_apple_under(pos)
		end
    end
})


-- helper functions

local function process_blossom_queue_item()
	local pos  = sas_core.blossomqueue[1][1]
	local node = sas_core.blossomqueue[1][2]
	local replace = sas_core.blossomqueue[1][3]
	if (sas_core.blossomqueue[1][3] == sas_core.blossom_node and not sas_core:is_near_water(pos)) then
		table.remove(sas_core.blossomqueue, 1) -- don't grow if it's not near water, pop from queue.
		return
	end
	sas_core:grow_node(pos, replace) -- now actually grow it.
	table.remove(sas_core.blossomqueue, 1)
end

minetest.register_globalstep(function(dtime)
	sas_core.dtime = dtime
	if #sas_core.blossomqueue > 0 and dtime < 0.2 then
		local i = 1
		if dtime < 0.1 then
			i = i + 4
		end
		if dtime < 0.05 then
			i = i + 10
		end
		while #sas_core.blossomqueue > 0 and i > 0 do
			process_blossom_queue_item()
			i = i - 1
		end
	end
end)

function sas_core.enqueue_node(pos, node, replace)
	local idx = #sas_core.blossomqueue
	if idx < sas_core.blossomqueue_max then
		local enqueue_prob = 0
		if idx < sas_core.blossomqueue_max * 0.8 then
			enqueue_prob = 1
		else
			-- Reduce queue growth as it gets closer to its max.
			enqueue_prob = 1 - (idx - sas_core.blossomqueue_max * 0.8) / (sas_core.blossomqueue_max * 0.2)
		end
		if enqueue_prob == 1 or math.random(100) <= 100 * enqueue_prob then
			sas_core.blossomqueue[idx+1] = {}
			sas_core.blossomqueue[idx+1][1] = pos
			sas_core.blossomqueue[idx+1][2] = node
			sas_core.blossomqueue[idx+1][3] = replace
		end
	end
end

local function set_young_node(pos)
    local meta = minetest.get_meta(pos)

    meta:set_int(sas_core.meta_blossom_time, minetest.get_gametime())
end

local function is_not_young(pos)
    local meta = minetest.get_meta(pos)

    local blossom_time = meta:get_int(sas_core.meta_blossom_time)
    return not (blossom_time and minetest.get_gametime() - blossom_time < sas_core.blossom_duration)
end

function sas_core:grow_node(pos, nodename)
    if pos ~= nil then
        local light_enough = (minetest.get_node_light(pos, nil) or 0)
                >= sas_core.minimum_growth_light 

        if is_not_young(pos) and light_enough then
            minetest.set_node(pos, { name = nodename })
            set_young_node(pos)

            minetest.log("info", nodename .. " has grown at " .. pos.x .. ","
                .. pos.y .. "," .. pos.z)
        end
    end
end

function sas_core:is_near_water(pos)
    return sas_core.distance_from_water == -1 or minetest.find_node_near(pos, sas_core.distance_from_water,
            { "default:water_source" }) ~= nil
end


