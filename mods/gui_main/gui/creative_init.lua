--creative = {}

minetest.register_privilege("creative", {
	description = "Allow player to use creative inventory",
	give_to_singleplayer = false
})

local creative_mode_cache = minetest.settings:get_bool("creative_mode")

function gui.is_enabled_for(name)
	return creative_mode_cache or
		minetest.check_player_privs(name, {creative = true})
end

dofile(minetest.get_modpath("gui") .. "/creative_inventory.lua")

if creative_mode_cache then
	-- Dig time is modified according to difference (leveldiff) between tool
	-- 'maxlevel' and node 'level'. Digtime is divided by the larger of
	-- leveldiff and 1.
	-- To speed up digging in creative, hand 'maxlevel' and 'digtime' have been
	-- increased such that nodes of differing levels have an insignificant
	-- effect on digtime.
	local digtime = 42
	local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

	minetest.register_item(":", {
		type = "none",
		wield_image = "wieldhand.png",
		wield_scale = {x = 1, y = 1, z = 2.5},
		range = 10,
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = caps,
				cracky  = caps,
				snappy  = caps,
				choppy  = caps,
				oddly_breakable_by_hand = caps,
			},
			damage_groups = {fleshy = 10},
		}
	})
end

-- Unlimited node placement
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
	return gui.is_enabled_for(placer:get_player_name())
end)

-- Don't pick up if the item is already in the inventory
local old_handle_node_drops = minetest.handle_node_drops
function minetest.handle_node_drops(pos, drops, digger)
	if not digger or not digger:is_player() then
		return
	end
	if not gui.is_enabled_for(digger:get_player_name()) then
		return old_handle_node_drops(pos, drops, digger)
	end
	local inv = digger:get_inventory()
	if inv then
		for _, item in ipairs(drops) do
			if not inv:contains_item("main", item, true) then
				inv:add_item("main", item)
			end
		end
	end
end


--[[
Minetest Game mod: creative
===========================
See license.txt for license information.

Authors of source code
----------------------
Originally by Perttu Ahola (celeron55) <celeron55@gmail.com> (MIT)
Jean-Patrick G. (kilbith) <jeanpatrick.guerrero@gmail.com> (MIT)

Author of media (textures)
--------------------------
Jean-Patrick G. (kilbith) <jeanpatrick.guerrero@gmail.com> (CC BY-SA 3.0)






License of source code
----------------------

The MIT License (MIT)
Copyright (C) 2012-2016 Perttu Ahola (celeron55) <celeron55@gmail.com>
Copyright (C) 2015-2016 Jean-Patrick G. (kilbith) <jeanpatrick.guerrero@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

For more details:
https://opensource.org/licenses/MIT


Licenses of media (textures)
----------------------------

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
Copyright (C) 2016 Jean-Patrick G. (kilbith) <jeanpatrick.guerrero@gmail.com>

You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

ShareAlike — If you remix, transform, or build upon the material, you must distribute
your contributions under the same license as the original.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/3.0/


]]

