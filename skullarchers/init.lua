-- SOUNDS LINK :
-- Bones : https://freesound.org/people/spookymodem/sounds/202091/
-- Arrow hit : retirado do mod x-Bows
-- Arrow texture : retirado do x-Bows

local skullnods = {
	--"default:dirt",
	--"default:dirt_with_rainforest_litter",
	--"default:dirt_with_grass",
	--"default:dirt_with_dry_grass",
	--"default:dry_dirt_with_dry_grass",
	--"default:dirt_with_coniferous_litter",
	--"default:stone",
	--"default:ice",
	--"default:snowblock",
	--"default:dirt_with_snow",
	--"default:sand",
	--"default:desert_sand",
	--"default:desert_stone",
	--"default:stone",
	--"default:desert_stone",
	"default:cobble",
	"default:mossycobble",
	"default:chest",
	--"default:ice",

}



mobs:register_mob("skullarchers:sarchers", {
	--nametag = "skull archers" ,
	type = "monster",
	passive = false,
	attack_type = "shoot",
	arrow = "skullarchers:sarchers_arrow",
	shoot_interval = 2.0,
	shoot_offset = 1.5,
	pathfinding = true,
	reach = 20,
	damage = math.random(3, 5),
	hp_min = 15,
	hp_max = 15,
	armor = 100,
	collisionbox = { -0.4, -1.0, -0.4, 0.4, 0.9, 0.4 },
	visual = "mesh",
	mesh = "skull_archers.b3d",
	rotate = 180,
	textures = {
		{ "archers.png" },
	},
	--glow = 4,
	blood_texture = "bonex.png",
	makes_footstep_sound = true,
	sounds = {

		death = "falling_bones",
	},
	walk_velocity = 2,
	run_velocity = 5,
	jump_height = 2,
	stepheight = 1.1,
	floats = 0,
	view_range = 20,
	drops = {
		{ name = "skullkingsitems:bone", chance = 2, min = 1, max = 1, },
		{ name = "x_bows:arrow_stone",   chance = 3, min = 1, max = 1 },
		{ name = "x_bows:bow_wood",      chance = 5, min = 1, max = 1 },
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 0,
		walk_start = 15,
		walk_end = 33,
		run_start = 35,
		run_end = 53,
		shoot_start = 55,
		shoot_end = 55,
	},
})


-- spawn 1
if not mobs.custom_spawn_monster then
	mobs:spawn({
		name = "skullarchers:sarchers",
		nodes = skullnods,
		min_light = 0,
		max_light = 14,
		chance = 7000,
		min_height = -11000,
		max_height = -510,
	})
end


-- ARROW ================================================================================================
minetest.register_craftitem("skullarchers:skull_arrow", {
	description = "Skull Archers Arrow",
	inventory_image = "arrow_stone.png",
	groups = { not_in_creative_inventory = 1 }
})

mobs:register_arrow("skullarchers:sarchers_arrow", {
	--arrow

	visual = "wielditem",
	visual_size = { x = 0.3, y = 0.3 },
	velocity = 12,
	textures = { "skullarchers:skull_arrow" }, -- posso criar um bloco, ou flecha 3d
	--tail = 1,
	--tail_texture = "particules_arrow.png",
	--tail_size = 2.0,
	rotate = 180,
	damage = 2,
	hit_player = function(self, player)
		local pos = self.object:get_pos()
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = { fleshy = 3 },
			minetest.sound_play("x_bows_arrow_hit_1", {
				pos = pos,
				gain = 1.0,
				max_hear_distance = 5,
			})
		}, nil)
	end,
	hit_mob = function(self, player)
		local pos = self.object:get_pos()
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = { fleshy = 3 },
			minetest.sound_play("arrow_hit_1", {
				pos = pos,
				gain = 1.0,
				max_hear_distance = 5,
			})
		}, nil)
	end,
	hit_node = function(self, pos, node)
	end
})



mobs:register_egg("skullarchers:sarchers", "skull Archers", "eggsarc.png", 1)
core.register_alias("skullarchers:sarchers", "spawneggs:sarchers")
