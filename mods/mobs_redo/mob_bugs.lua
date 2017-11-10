
-- Bugs by KrupnoPavel

if mobs.mod and mobs.mod == "redo" then

mobs:register_mob("mobs:bug", {
	type = "animal",
	hp_min = 1, hp_max = 1, armor = 200,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "bug.x",
	textures = {
		{"bug1.png"},
		{"bug2.png"},
		{"bug3.png"},
		{"bug4.png"},
		{"bug5.png"},
		{"bug6.png"},
		{"bug7.png"},
		{"bug8.png"},
	},
	makes_footstep_sound = false,
	walk_velocity = 1,
	drops = {},
	drawtype = "front",
	water_damage = 2,
	lava_damage = 1,
	light_damage = 0,
	fall_damage = 0,
	on_rightclick = function(self, clicker)
		if clicker:is_player() and clicker:get_inventory() then
			clicker:get_inventory():add_item("main", "mobs:bug")
			self.object:remove()
		end
	end,
})

mobs:register_spawn("mobs:bug", {"default:dirt_with_grass", "default:stone"}, 20, -1, 5000, 1, 31000)

mobs:register_egg("mobs:bug", "Bug", "inv_bug.png", 0)

end


-- raw meat
minetest.register_craftitem("mobs:bug", {
	description = "Live Bug",
	inventory_image = "inv_bug.png",
	on_use = minetest.item_eat(3),
})

-- cooked meat
minetest.register_craftitem("mobs:bug_cooked", {
	description = "Bug Meat",
	inventory_image = "inv_bug.png^[colorize:brown:175",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:bug_cooked",
	recipe = "mobs:bug",
	cooktime = 2,
})