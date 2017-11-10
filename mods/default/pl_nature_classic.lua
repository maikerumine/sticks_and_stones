-- Nature Classic mod
-- Originally by neko259

-- Nature is slowly capturing the world!

local current_mod_name = minetest.get_current_modname()

--default = {}
default.blossomqueue = {}
default.blossomqueue_max = 1000

default.blossom_node = "default:blossom"
default.blossom_leaves = "default:leaves"
default.blossom_textures = { "default_leaves.png^nature_blossom.png" }

if minetest.get_modpath("moretrees") then
	default.blossom_node = "moretrees:apple_blossoms"
	default.blossom_leaves = "moretrees:apple_tree_leaves"
	default.blossom_textures = { "moretrees_apple_tree_leaves.png^nature_blossom.png" }
	minetest.register_alias("default:blossom", "default:leaves")
end

default.leaves_blossom_chance = 15
default.blossom_leaves_chance = 5
default.blossom_delay = 3600
default.apple_chance = 10
default.apple_spread = 2

default.meta_blossom_time = "blossom_time"
default.blossom_duration = default.blossom_delay

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

minetest.register_node(":"..default.blossom_node, {
    description = "Apple blossoms",
    drawtype = "allfaces_optional",
    tiles = default.blossom_textures,
    paramtype = "light",
    groups = { snappy = 3, leafdecay = 3, flammable = 2 ,falling_node = 1, dig_by_water = 1},
    sounds = default.node_sound_leaves_defaults(),
	waving = 1
})

minetest.register_craft({
    type = "fuel",
    recipe = default.blossom_node,
    burntime = 2,
})

-- these ABMs can get heavy, so just enqueue the nodes

-- Adding Blossoms
-- Limit mass changes after block has not been loaded for some time:
-- Run ABM with higher frequency, but don't enqueue all blocks
minetest.register_abm({
    nodenames = { default.blossom_leaves },
    interval = default.blossom_delay / default.leaves_blossom_chance,
    chance = default.leaves_blossom_chance,

    action = function(pos, node, active_object_count, active_object_count_wider)
			if math.random(default.leaves_blossom_chance) == 1 then
				default.enqueue_node(pos, node, default.blossom_node)
			end
    end
})

-- Removing blossoms
-- Limit mass changes after block has not been loaded for some time:
-- Run ABM with higher frequency, but don't enqueue all blocks
minetest.register_abm({
    nodenames = { default.blossom_node },
    interval = default.blossom_delay / default.blossom_leaves_chance,
    chance = default.blossom_leaves_chance,

    action = function(pos, node, active_object_count, active_object_count_wider)
			if math.random(default.blossom_leaves_chance) == 1 then
				default.enqueue_node(pos, node, default.blossom_leaves)
			end
    end
})

-- Spawning apples
-- Limit mass changes after block has not been loaded for some time:
-- spawn apples with 10% chance, but with 10 times higher frequency
minetest.register_abm({
    nodenames = { default.blossom_node },
    interval = default.blossom_delay / 10,
    chance = default.apple_chance,

    action = function(pos, node, active_object_count, active_object_count_wider)
		if math.random(10) == 0 and default.dtime < 0.2 and not minetest.find_node_near(pos, default.apple_spread, { "default:apple" }) then
			spawn_apple_under(pos)
		end
    end
})


-- helper functions

local function process_blossom_queue_item()
	local pos  = default.blossomqueue[1][1]
	local node = default.blossomqueue[1][2]
	local replace = default.blossomqueue[1][3]
	if (default.blossomqueue[1][3] == default.blossom_node and not default:is_near_water(pos)) then
		table.remove(default.blossomqueue, 1) -- don't grow if it's not near water, pop from queue.
		return
	end
	default:grow_node(pos, replace) -- now actually grow it.
	table.remove(default.blossomqueue, 1)
end

minetest.register_globalstep(function(dtime)
	default.dtime = dtime
	if #default.blossomqueue > 0 and dtime < 0.2 then
		local i = 1
		if dtime < 0.1 then
			i = i + 4
		end
		if dtime < 0.05 then
			i = i + 10
		end
		while #default.blossomqueue > 0 and i > 0 do
			process_blossom_queue_item()
			i = i - 1
		end
	end
end)

function default.enqueue_node(pos, node, replace)
	local idx = #default.blossomqueue
	if idx < default.blossomqueue_max then
		local enqueue_prob = 0
		if idx < default.blossomqueue_max * 0.8 then
			enqueue_prob = 1
		else
			-- Reduce queue growth as it gets closer to its max.
			enqueue_prob = 1 - (idx - default.blossomqueue_max * 0.8) / (default.blossomqueue_max * 0.2)
		end
		if enqueue_prob == 1 or math.random(100) <= 100 * enqueue_prob then
			default.blossomqueue[idx+1] = {}
			default.blossomqueue[idx+1][1] = pos
			default.blossomqueue[idx+1][2] = node
			default.blossomqueue[idx+1][3] = replace
		end
	end
end

local function set_young_node(pos)
    local meta = minetest.get_meta(pos)

    meta:set_int(default.meta_blossom_time, minetest.get_gametime())
end

local function is_not_young(pos)
    local meta = minetest.get_meta(pos)

    local blossom_time = meta:get_int(default.meta_blossom_time)
    return not (blossom_time and minetest.get_gametime() - blossom_time < default.blossom_duration)
end

function default:grow_node(pos, nodename)
    if pos ~= nil then
        local light_enough = (minetest.get_node_light(pos, nil) or 0)
                >= default.minimum_growth_light 

        if is_not_young(pos) and light_enough then
            minetest.set_node(pos, { name = nodename })
            set_young_node(pos)

            minetest.log("info", nodename .. " has grown at " .. pos.x .. ","
                .. pos.y .. "," .. pos.z)
        end
    end
end

function default:is_near_water(pos)
    return default.distance_from_water == -1 or minetest.find_node_near(pos, default.distance_from_water,
            { "default:water_source" }) ~= nil
end


