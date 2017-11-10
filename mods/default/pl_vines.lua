
--[[
vines = {
  name = 'vines',
  recipes = {}
}

dofile( minetest.get_modpath( default.name ) .. "/functions.lua" )
dofile( minetest.get_modpath( default.name ) .. "/aliases.lua" )
dofile( minetest.get_modpath( default.name ) .. "/recipes.lua" )
dofile( minetest.get_modpath( default.name ) .. "/crafts.lua" )
dofile( minetest.get_modpath( default.name ) .. "/nodes.lua" )
dofile( minetest.get_modpath( default.name ) .. "/default.lua" )
dofile( minetest.get_modpath( default.name ) .. "/shear.lua" )
]]


print("[Vines] Loaded!")
-- used to remove the old vine nodes. This gives room for the new nodes
minetest.register_alias( 'default:root', 'air' )
minetest.register_alias( 'default:root_rotten', 'air' )
minetest.register_alias( 'default:vine', 'air' )
minetest.register_alias( 'default:vine_rotten', 'air' )
minetest.register_alias( 'default:side', 'air' )
minetest.register_alias( 'default:side_rotten', 'air' )
minetest.register_alias( 'default:jungle', 'air' )
minetest.register_alias( 'default:jungle_rotten', 'air' )
minetest.register_alias( 'default:willow', 'air' )
minetest.register_alias( 'default:willow_rotten', 'air' )




default.register_vine = function( name, defs, biome )
  local biome = biome
  local groups = { vines=1, snappy=3, flammable=2 }

  local vine_name_end = 'default:'..name..'_end'
  local vine_name_middle = 'default:'..name..'_middle'

  local vine_image_end = "vines_"..name.."_end.png"
  local vine_image_middle = "vines_"..name.."_middle.png"

  local drop_node = vine_name_end

  biome.spawn_plants = { vine_name_end }

  local vine_group = 'group:'..name..'_vines'
  biome.spawn_surfaces[ #biome.spawn_surfaces + 1 ] = vine_group

  local selection_box = { type = "wallmounted", }
  local drawtype = 'signlike'
  if ( not biome.spawn_on_side ) then
    --different properties for bottom and side default.
    selection_box = { type = "fixed", fixed = { -0.4, -1/2, -0.4, 0.4, 1/2, 0.4 }, }
    drawtype = 'plantlike'
  end

  minetest.register_node( vine_name_end, {
    description = defs.description,
    walkable = false,
    climbable = true,
    wield_image = vine_image_end,
    drop = "",
    sunlight_propagates = true,
    paramtype = "light",
    paramtype2 = "wallmounted",
    buildable_to = true,
    tiles = { vine_image_end },
    drawtype = drawtype,
    inventory_image = vine_image_end,
    groups = groups,
    sounds = default.node_sound_leaves_defaults(),
    selection_box = selection_box,
    on_construct = function( pos )
      local timer = minetest.get_node_timer( pos )
      timer:start( math.random(5, 10) )
    end,
    on_timer = function( pos )
      local node = minetest.get_node( pos )
      local bottom = {x=pos.x, y=pos.y-1, z=pos.z}
      local bottom_node = minetest.get_node( bottom )
      if bottom_node.name == "air" then
        if not ( math.random( defs.average_length ) == 1 ) then
          minetest.set_node( pos, { name = vine_name_middle, param2 = node.param2 } )
          minetest.set_node( bottom, { name = node.name, param2 = node.param2 } )
          local timer = minetest.get_node_timer( bottom_node )
          timer:start( math.random(5, 10) )
        end
      end
    end,
    after_dig_node = function(pos, node, oldmetadata, user)
      default.dig_vine( pos, drop_node, user )
    end
  })


  minetest.register_node( vine_name_middle, {
    description = "Matured "..defs.description,
    walkable = false,
    climbable = true,
    drop = "",
    sunlight_propagates = true,
    paramtype = "light",
    paramtype2 = "wallmounted",
    buildable_to = true,
    tiles = { vine_image_middle },
    wield_image = vine_image_middle,
    drawtype = drawtype,
    inventory_image = vine_image_middle,
    groups = groups,
    sounds = default.node_sound_leaves_defaults(),
    selection_box = selection_box,
    on_destruct = function( pos )
      local node = minetest.get_node( pos )
      local bottom = {x=pos.x, y=pos.y-1, z=pos.z}
      local bottom_node = minetest.get_node( bottom )
      if minetest.get_item_group( bottom_node.name, "vines") then
        minetest.remove_node( bottom )
      end
    end,
    after_dig_node = function( pos, node, oldmetadata, user )
      default.dig_vine( pos, drop_node, user )
    end
  })

  default:spawn_on_surfaces( biome )

  local override_nodes = function( nodes, defs )
    local function override( index, registered )
      local node = nodes[ index ]
      if index > #nodes then return registered end
      if minetest.registered_nodes[node] then
        minetest.override_item( node, defs )
        registered[#registered+1] = node
      end
      override( index+1, registered )
    end
    override( 1, {} )
  end

  override_nodes( biome.spawn_surfaces,{
    after_destruct = function( pos )
      local pos_min = { x = pos.x -1, y = pos.y - 1, z = pos.z - 1 }
      local pos_max = { x = pos.x +1, y = pos.y + 1, z = pos.z + 1 }
      local positions = minetest.find_nodes_in_area( pos_min, pos_max, "group:vines" )
      for index, position in pairs(positions) do
        minetest.remove_node( position )
      end
    end
  })

end

default.dig_vine = function( pos, node_name, user )
  --only dig give the vine if shears are used
  if not user then return false end
  local wielded = user:get_wielded_item()
  if 'mobs:shears' == wielded:get_name() then
    local inv = user:get_inventory()
    if inv then
      inv:add_item("main", ItemStack( node_name ))
    end
  end
end


minetest.register_node("default:rope_block", {
  description = "Rope",
  sunlight_propagates = true,
  paramtype = "light",
  tiles = {
    "default_wood.png^vines_rope.png",
    "default_wood.png^vines_rope.png",
    "default_wood.png",
    "default_wood.png",
    "default_wood.png^vines_rope.png",
    "default_wood.png^vines_rope.png",
  },
  groups = { flammable=2, choppy=2, oddly_breakable_by_hand=1 },
  after_place_node = function(pos)
    local p = {x=pos.x, y=pos.y-1, z=pos.z}
    local n = minetest.get_node(p)
    if n.name == "air" then
      minetest.add_node(p, {name="default:rope_end"})
    end
  end,
  after_dig_node = function(pos, node, digger)
    local p = {x=pos.x, y=pos.y-1, z=pos.z}
    local n = minetest.get_node(p)
    while ( n.name == 'default:rope' or n.name == 'default:rope_end' ) do
      minetest.remove_node(p)
      p = {x=p.x, y=p.y-1, z=p.z}
      n = minetest.get_node(p)
    end
  end
})

minetest.register_node("default:rope", {
  description = "Rope",
  walkable = false,
  climbable = true,
  sunlight_propagates = true,
  paramtype = "light",
  drop = "",
  tiles = { "vines_rope.png" },
  drawtype = "plantlike",
  groups = {flammable=2, not_in_creative_inventory=1},
  sounds =  default.node_sound_leaves_defaults(),
  selection_box = {
    type = "fixed",
    fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
  },
})

minetest.register_node("default:rope_end", {
  description = "Rope",
  walkable = false,
  climbable = true,
  sunlight_propagates = true,
  paramtype = "light",
  drop = "",
  tiles = { "vines_rope_end.png" },
  drawtype = "plantlike",
  groups = {flammable=2, not_in_creative_inventory=1},
  sounds =  default.node_sound_leaves_defaults(),
  after_place_node = function(pos)
    yesh  = {x = pos.x, y= pos.y-1, z=pos.z}
    minetest.add_node(yesh, {name="default:rope"})
  end,
  selection_box = {
	  type = "fixed",
	  fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
  },
  on_construct = function( pos )
    local timer = minetest.get_node_timer( pos )
    timer:start( 1 )
  end,
  on_timer = function( pos, elapsed )
    local p = {x=pos.x, y=pos.y-1, z=pos.z}
    local n = minetest.get_node(p)
    if  n.name == "air" then
      minetest.set_node(pos, {name="default:rope"})
      minetest.add_node(p, {name="default:rope_end"})
    else
      local timer = minetest.get_node_timer( pos )
      timer:start( 1 )
    end
  end
})


default.register_vine( 'root', {
  description = "Roots",
  average_length = 9,
},{
  choose_random_wall = true,
  avoid_nodes = {"default:root_middle"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 10,
  spawn_surfaces = {
    "default:dirt_with_grass",
    "default:dirt"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.6,
  humidity_min = 0.4,
})

default.register_vine( 'vine', {
  description = "Vines",
  average_length = 5,
},{
  choose_random_wall = true,
  avoid_nodes = {"group:vines"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "default:jungleleaves",
    "moretrees:jungletree_leaves_red",
    "moretrees:jungletree_leaves_yellow",
    "moretrees:jungletree_leaves_green"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.9,
  humidity_min = 0.7,
})

default.register_vine( 'side', {
  description = "Vines",
  average_length = 6,
},{
  choose_random_wall = true,
  avoid_nodes = {"group:vines", "default:apple"},
  choose_random_wall = true,
  avoid_radius = 3,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "default:jungleleaves",
    "moretrees:jungletree_leaves_red",
    "moretrees:jungletree_leaves_yellow",
    "moretrees:jungletree_leaves_green"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
  humidity_min = 0.4,
})

default.register_vine( "jungle", {
  description = "Jungle Vines",
  average_length = 7,
},{
  choose_random_wall = true,
  neighbors = {
    "default:jungleleaves",
    "moretrees:jungletree_leaves_red",
    "moretrees:jungletree_leaves_yellow",
    "moretrees:jungletree_leaves_green"
  },
  avoid_nodes = {
    "default:jungle_middle",
    "default:jungle_end",
  },
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "default:jungletree",
    "moretrees:jungletree_trunk"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
  humidity_min = 0.2,
})

default.register_vine( 'willow', {
  description = "Willow Vines",
  average_length = 9,
},{
  choose_random_wall = true,
  avoid_nodes = { "default:willow_middle" },
  avoid_radius = 5,
  near_nodes = { 'default:water_source' },
  near_nodes_size = 1,
  near_nodes_count = 1,
  near_nodes_vertical = 7,
  plantlife_limit = -0.8,
  spawn_chance = 10,
  spawn_delay = 500,
  spawn_on_side = true,
  spawn_surfaces = {"moretrees:willow_leaves"},
  humidity_min = 0.5
})




default.recipes['rope_block'] = {
  {'', 'default:wood', ''},
  {'', 'group:vines', ''},
  {'', 'group:vines', ''}
}

default.recipes['tool_shears'] = {
  {'', 'default:steel_plate', ''},
  {'default:handle_medium', 'default:iron_hardware', 'default:steel_plate'},
  {'', 'default:handle_medium', ''}
}



minetest.register_tool("default:tool_shears", {
  description = "Shears",
  inventory_image = "vines_shears.png",
  wield_image = "vines_shears.png",
  stack_max = 1,
  max_drop_level=3,
tool_capabilities = {
    full_punch_interval = 1.0,
    max_drop_level=0,
    groupcaps={
      snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
      wool={times={[3]=2.5, [2]=1.20, [3]=0.35}, uses=12, maxlevel=2}
    }
  },
--[[
--TODO:  MAKE LEAVES AVLE TO SHEAR
  	on_rightclick = function(node, clicker)
		local item = clicker:get_wielded_item()


		if item:get_name() == default.shears then
			
			local pos = node:getpos()
			minetest.sound_play("shears", {pos = pos})
			pos.y = pos.y + 0.5

			minetest.add_item(pos, ItemStack("default:leaves"))

			if not minetest.settings:get_bool("creative_mode") then
				item:add_wear(default.shears_wear)
				clicker:get_inventory():set_stack("main", clicker:get_wield_index(), item)
			end

			return
		end

	end,
	
	]]
})
  
  
 minetest.register_craft({
  output = 'default:rope_block',
  recipe = default.recipes['rope_block']
})

minetest.register_craft({
  output = 'default:tool_shears',
  recipe = default.recipes['tool_shears']
})

minetest.register_craftitem("default:vines", {
  description = "Vines",
  groups = {plant_fiber = 1},
  inventory_image = "vines_item.png",
})
 

--[[


 __   __  ___   __    _  _______  _______ 
|  | |  ||   | |  |  | ||       ||       |
|  |_|  ||   | |   |_| ||    ___||  _____|
|       ||   | |       ||   |___ | |_____ 
|       ||   | |  _    ||    ___||_____  |
 |     | |   | | | |   ||   |___  _____| |
  |___|  |___| |_|  |__||_______||_______|

BY:             bas080
DESCRIPTION:    Vines and ropebox
VERSION:        2.2.1
LICENCE:        WTFPL
FORUM:          http://forum.minetest.net/viewtopic.php?id=2344

Changelog
---------
2.2.1
* Also spawn on leaves that are near jungletree
* Uses default wood texture
* Drops actual vines
* Changed craft

2.2
* Spawns on all leaves that are near water

2.1
* Removed rope(end) from creative inventory

2.0
* Root vines texture and node (no spawn)
* Side vines spawn on leaves
* Willow vines spawns on moretrees willow leaves
* Ropebox after_dig_node re-defined

1.5
* Added side vines
* Uses plant_lib api
* Original vines do not spawn anymore but are still there.

1.0
* Vines spawn beneath leave nodes
* Has rotten and non rotten vines
* Ropebox with craft

# Vines

## Features
- Rope block for spawning rope that slowly drops into the deep.
- Vines are climbable and slowly grow downward.
- Shears that allow the collecting of vines.
- Spawns vines on jungletree leaves.
- Roots on the bottom of dirt and dirt with grass nodes.
- Spawns vines on trees located in swampy area.
- Jungle vines that spawn on the side of jungletrees

## API
The API is very minimal. It allows the registering of vines and the spawning of
existing vines on nodes of your own.

If you want vines to spawn on a certain node then you can choose which vine by
adding to the node groups the unique group of that vine. This is determined by
the name of the vine ( see vines.lua ) appended with '_vines'.
An example would be.

"willow_vines" or "jungle_vines"

There are two types of vines. One that spawns at the bottom of nodes and uses the
plantlike drawtype, and vines that spawn on the side that use signlike
drawtype. The type is determined by the spawn_on_side property in the biome
table.

### Example
*taken from mod*

```lua

  vines.register_vine( name, definitions, biome )

  --e.g.

  vines.register_vine( 'vine', {
    description = "Vines",
    average_length = 9
  }, biome )

```

### definitions
|key|           type|  description|
|---|           ---|   ---|
|description|   string|The vine's tooltip description|
|average_length|int|   The average length of vines|

For biome definitions please see the [plants_lib API documentation](https://github.com/VanessaE/plantlife_modpack/blob/master/API.txt)

## Notice
Vines use after_destruct on registered leave nodes to remove vines from which
the leaves are removed. This is done by using the override function.
Malfunctions may occur if other mods override the after_destruct of these nodes
also.


License
=======
- Code	WTFPL
- Texture	CC



]]
  
  



