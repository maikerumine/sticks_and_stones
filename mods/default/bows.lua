local gravity = -9.81
if minetest.settings:get("movement_gravity") then
	gravity = minetest.settings:get("movement_gravity")*-1
end
local charge_speed = 1
if minetest.settings:get("bow_full_charge_time") then
	charge_speed = tonumber(minetest.settings:get("bow_full_charge_time"))/3
end
local arrow_lifetime = 260
if minetest.settings:get("bow_lifetime_arrow") then
	arrow_lifetime = tonumber(minetest.settings:get("bow_lifetime_arrow"))
end

minetest.register_alias("bow:bow", "default:tool_bow")
minetest.register_alias("bow:bow_1", "default:tool_bow_1")
minetest.register_alias("bow:bow_2", "default:tool_bow_2")
minetest.register_alias("bow:bow_3", "default:tool_bow_3")
minetest.register_alias("bow:bow_dropped", "default:tool_bow_dropped")
minetest.register_alias("bow:arrow", "default:tool_arrow")
minetest.register_alias("bow:arrow_ent", "default:tool_arrow_ent")


	

minetest.register_tool("default:tool_bow", {
	description = "Bow",
	inventory_image = "bow_inv.png",
	wield_scale = {x=2, y=2, z=1},
	on_drop = function(itemstack, dropper, pos)
		itemstack:set_name("default:tool_bow_dropped")
		minetest.item_drop(itemstack, dropper, pos)
		return ""
	end,
	range = 0
})

minetest.register_tool("default:tool_bow_1", {
	description = "Bow",
	inventory_image = "bow_1.png",
	wield_scale = {x=2, y=2, z=1},
	groups = {not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		itemstack:set_name("default:tool_bow_dropped")
		minetest.item_drop(itemstack, dropper, pos)
		return ""
	end,
	range = 0
})

minetest.register_tool("default:tool_bow_2", {
	description = "Bow",
	inventory_image = "bow_2.png",
	wield_scale = {x=2, y=2, z=1},
	groups = {not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		itemstack:set_name("default:tool_bow_dropped")
		minetest.item_drop(itemstack, dropper, pos)
		return ""
	end,
	range = 0
})

minetest.register_tool("default:tool_bow_3", {
	description = "Bow",
	inventory_image = "bow_3.png",
	wield_scale = {x=2, y=2, z=1},
	groups = {not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		itemstack:set_name("default:tool_bow_dropped")
		minetest.item_drop(itemstack, dropper, pos)
		return ""
	end,
	range = 0
})

minetest.register_tool("default:tool_bow_dropped", {
	description = "Bow",
	inventory_image = "bow_inv.png",
	groups = {not_in_creative_inventory=1},
	range = 0
})

minetest.register_craftitem("default:tool_arrow", {
	description = "Arrow",
	inventory_image = "bow_arrow.png"
})

minetest.register_entity("default:tool_arrow_ent", {
	physical = false,
	visual = "mesh",
	mesh = "arrow.obj",
	visual_size = {x=1, y=1},
    collisionbox = {-0.1,-0.1,-0.1, 0.1,0.1,0.1},
	textures = {"bow_arrow_uv.png"},
	on_step = function(self, dtime)
		if not self.start_timer then self.object:remove() return end
		if not self.charge then self.object:remove() return end
		local pos = self.object:getpos()
		if minetest.registered_nodes[minetest.get_node(pos).name] and minetest.registered_nodes[minetest.get_node(pos).name].walkable and minetest.registered_nodes[minetest.get_node(pos).name].drawtype~="nodebox" and self.charge>0 then
			self.object:setvelocity({x=0, y=0, z=0})
			self.object:setacceleration({x=0, y=0, z=0})
			self.charge = 0
			self.timer = 0
		end
		if self.charge==0 and self.timer>=arrow_lifetime then
			self.object:remove()
		elseif self.charge==0 then
			self.timer = self.timer+dtime
			local objects = minetest.get_objects_inside_radius(pos, 3)
			for _,obj in ipairs(objects) do
				if obj:is_player() then
					local inv = minetest.get_inventory({type="player", name=obj:get_player_name()})
					inv:add_item("main", "default:tool_arrow")
					self.object:remove()
				end
			end
		end
		if self.start_timer<=0.1 then
			self.start_timer=self.start_timer+dtime
		end
		if self.charge>0 and self.start_timer>=0.1 then
			local objects = minetest.get_objects_inside_radius(pos, 2)
			for _,obj in ipairs(objects) do
				if obj:is_player() or (obj:get_luaentity() and obj:get_luaentity().name ~= "default:tool_arrow_ent") then
					--obj:punch(self.player, nil, {damage_groups={fleshy=self.charge*2}}, self.object:getvelocity())
					obj:punch(self.player, nil, {damage_groups={fleshy=self.charge*6}}, self.object:getvelocity())
					self.object:remove()
				end
			end
		end
	end
})
local timer = 0
local bow_load={}

minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local wielditem = player:get_wielded_item()
		if wielditem:get_name()=="default:tool_bow_dropped" then
			wielditem:set_name("default:tool_bow")
			player:set_wielded_item(wielditem)
		end
		local controls = player:get_player_control()
		timer = timer+dtime
		local inv = minetest.get_inventory({type="player", name=player:get_player_name()})
		if (wielditem:get_name()=="default:tool_bow_1" or wielditem:get_name()=="default:tool_bow_2" or wielditem:get_name()=="default:tool_bow_3") and not controls.RMB then
			local yaw = player:get_look_yaw()
			local dir = player:get_look_dir()
			local pos = vector.add(player:getpos(),{x=dir.x*2, y=dir.y*2+1.5, z=dir.z*2})
			local obj = minetest.add_entity(pos, "default:tool_arrow_ent")
			obj:setyaw(yaw + math.pi)
			local charge = 1
			if wielditem:get_name()=="default:tool_bow_1" then
				charge = 1
			elseif wielditem:get_name()=="default:tool_bow_2" then
				charge = 2
			elseif wielditem:get_name()=="default:tool_bow_3" then
				charge = 3
			end
			obj:setvelocity({x=dir.x*charge*18,055566667, y=dir.y*charge*18,055566667, z=dir.z*charge*18,055566667})
			obj:setacceleration({x=0, y=gravity, z=0})
			obj:get_luaentity().charge = charge
			obj:get_luaentity().player = player
			obj:get_luaentity().start_timer = 0
			player:set_physics_override({jump=1, gravity=1, speed=1})
			wielditem:set_name("default:tool_bow")
			wielditem:add_wear(charge*100)
			player:set_wielded_item(wielditem)
			inv:remove_item("main", "default:tool_arrow 1")
			bow_load[player:get_player_name()]=false
		end
		if bow_load[player:get_player_name()]==true and (wielditem:get_name()~="default:tool_bow_1" and wielditem:get_name()~="default:tool_bow_2" and wielditem:get_name()~="default:tool_bow_3") then
			local list = inv:get_list("main")
			for place, stack in pairs(list) do
				if stack:get_name()=="default:tool_bow_1" or stack:get_name()=="default:tool_bow_2" or stack:get_name()=="default:tool_bow_3" then
					stack:set_name("default:tool_bow")
					list[place]=stack
					break
				end
			end
			inv:set_list("main", list)
			player:set_physics_override({jump=1, gravity=1, speed=1})
			bow_load[player:get_player_name()]=false
		end 
		if timer>=charge_speed then
			wielditem = player:get_wielded_item()
			timer=0
			if wielditem:get_name()=="default:tool_bow" and controls.RMB and inv:contains_item("main", "default:tool_arrow") then
				player:set_physics_override({jump=0.5, gravity=0.25, speed=0.25})
				wielditem:set_name("default:tool_bow_1")
				bow_load[player:get_player_name()]=true
			elseif wielditem:get_name()=="default:tool_bow_1" and controls.RMB then
				wielditem:set_name("default:tool_bow_2")
			elseif wielditem:get_name()=="default:tool_bow_2" and controls.RMB then
				wielditem:set_name("default:tool_bow_3")
			end
			player:set_wielded_item(wielditem)
		end
	end
end)

minetest.register_craft({
	output = "default:tool_bow",
	recipe = {
		{"", "default:stick", "default:cord"},
		{"default:stick", "", "default:cord"},
		{"", "default:stick", "default:cord"},
	}
})

minetest.register_craft({
	output = "default:tool_arrow 5",
	recipe = {
		{"default:glue", "default:flint", "default:cord"},
		{"", "default:stick", ""},
		{"default:glue", "default:paper", "default:cord"},
	}
})


--[[
                   GNU LESSER GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.


  This version of the GNU Lesser General Public License incorporates
the terms and conditions of version 3 of the GNU General Public
License, supplemented by the additional permissions listed below.

  0. Additional Definitions.

  As used herein, "this License" refers to version 3 of the GNU Lesser
General Public License, and the "GNU GPL" refers to version 3 of the GNU
General Public License.

  "The Library" refers to a covered work governed by this License,
other than an Application or a Combined Work as defined below.

  An "Application" is any work that makes use of an interface provided
by the Library, but which is not otherwise based on the Library.
Defining a subclass of a class defined by the Library is deemed a mode
of using an interface provided by the Library.

  A "Combined Work" is a work produced by combining or linking an
Application with the Library.  The particular version of the Library
with which the Combined Work was made is also called the "Linked
Version".

  The "Minimal Corresponding Source" for a Combined Work means the
Corresponding Source for the Combined Work, excluding any source code
for portions of the Combined Work that, considered in isolation, are
based on the Application, and not on the Linked Version.

  The "Corresponding Application Code" for a Combined Work means the
object code and/or source code for the Application, including any data
and utility programs needed for reproducing the Combined Work from the
Application, but excluding the System Libraries of the Combined Work.

  1. Exception to Section 3 of the GNU GPL.

  You may convey a covered work under sections 3 and 4 of this License
without being bound by section 3 of the GNU GPL.

  2. Conveying Modified Versions.

  If you modify a copy of the Library, and, in your modifications, a
facility refers to a function or data to be supplied by an Application
that uses the facility (other than as an argument passed when the
facility is invoked), then you may convey a copy of the modified
version:

   a) under this License, provided that you make a good faith effort to
   ensure that, in the event an Application does not supply the
   function or data, the facility still operates, and performs
   whatever part of its purpose remains meaningful, or

   b) under the GNU GPL, with none of the additional permissions of
   this License applicable to that copy.

  3. Object Code Incorporating Material from Library Header Files.

  The object code form of an Application may incorporate material from
a header file that is part of the Library.  You may convey such object
code under terms of your choice, provided that, if the incorporated
material is not limited to numerical parameters, data structure
layouts and accessors, or small macros, inline functions and templates
(ten or fewer lines in length), you do both of the following:

   a) Give prominent notice with each copy of the object code that the
   Library is used in it and that the Library and its use are
   covered by this License.

   b) Accompany the object code with a copy of the GNU GPL and this license
   document.

  4. Combined Works.

  You may convey a Combined Work under terms of your choice that,
taken together, effectively do not restrict modification of the
portions of the Library contained in the Combined Work and reverse
engineering for debugging such modifications, if you also do each of
the following:

   a) Give prominent notice with each copy of the Combined Work that
   the Library is used in it and that the Library and its use are
   covered by this License.

   b) Accompany the Combined Work with a copy of the GNU GPL and this license
   document.

   c) For a Combined Work that displays copyright notices during
   execution, include the copyright notice for the Library among
   these notices, as well as a reference directing the user to the
   copies of the GNU GPL and this license document.

   d) Do one of the following:

       0) Convey the Minimal Corresponding Source under the terms of this
       License, and the Corresponding Application Code in a form
       suitable for, and under terms that permit, the user to
       recombine or relink the Application with a modified version of
       the Linked Version to produce a modified Combined Work, in the
       manner specified by section 6 of the GNU GPL for conveying
       Corresponding Source.

       1) Use a suitable shared library mechanism for linking with the
       Library.  A suitable mechanism is one that (a) uses at run time
       a copy of the Library already present on the user's computer
       system, and (b) will operate properly with a modified version
       of the Library that is interface-compatible with the Linked
       Version.

   e) Provide Installation Information, but only if you would otherwise
   be required to provide such information under section 6 of the
   GNU GPL, and only to the extent that such information is
   necessary to install and execute a modified version of the
   Combined Work produced by recombining or relinking the
   Application with a modified version of the Linked Version. (If
   you use option 4d0, the Installation Information must accompany
   the Minimal Corresponding Source and Corresponding Application
   Code. If you use option 4d1, you must provide the Installation
   Information in the manner specified by section 6 of the GNU GPL
   for conveying Corresponding Source.)

  5. Combined Libraries.

  You may place library facilities that are a work based on the
Library side by side in a single library together with other library
facilities that are not Applications and are not covered by this
License, and convey such a combined library under terms of your
choice, if you do both of the following:

   a) Accompany the combined library with a copy of the same work based
   on the Library, uncombined with any other library facilities,
   conveyed under the terms of this License.

   b) Give prominent notice with the combined library that part of it
   is a work based on the Library, and explaining where to find the
   accompanying uncombined form of the same work.

  6. Revised Versions of the GNU Lesser General Public License.

  The Free Software Foundation may publish revised and/or new versions
of the GNU Lesser General Public License from time to time. Such new
versions will be similar in spirit to the present version, but may
differ in detail to address new problems or concerns.

  Each version is given a distinguishing version number. If the
Library as you received it specifies that a certain numbered version
of the GNU Lesser General Public License "or any later version"
applies to it, you have the option of following the terms and
conditions either of that published version or of any later version
published by the Free Software Foundation. If the Library as you
received it does not specify a version number of the GNU Lesser
General Public License, you may choose any version of the GNU Lesser
General Public License ever published by the Free Software Foundation.

  If the Library as you received it specifies that a proxy can decide
whether future versions of the GNU Lesser General Public License shall
apply, that proxy's public statement of acceptance of any version is
permanent authorization for you to choose that version for the
Library.



]]