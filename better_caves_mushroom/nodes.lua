minetest.register_node("better_caves_mushroom:mush_cap", {
	description = "Mushroom Cap",
	tiles = {"bc_mush_cap.png"},
	paramtype2 = "facedir",
	light_source = 4,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_mushroom:mush_shaft", {
	description = "Mushroom Cap",
	tiles = {"bc_mush_shaft_top.png", "bc_mush_shaft_top.png", "bc_mush_shaft_side.png"},
	paramtype2 = "facedir",
	light_source = 1,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_mushroom:mush_stalk_shaft", {
	description = "Mushroom Cap",
	tiles = {"bc_mush_stalk_top.png", "bc_mush_stalk_top.png", "bc_mush_stalk_side.png"},
	paramtype2 = "facedir",
	light_source = 1,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_mushroom:mush_stalk_orb", {
	description = "Mushroom Cap",
	tiles = {"bc_mush_glownode.png"},
	paramtype2 = "facedir",
	light_source = 14,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_mushroom:mush_gills", {
	description = "Mushroom Gills",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.20,
	tiles = {"bc_mush_gills.png"},
	inventory_image = "bc_mush_gills.png",
	wield_image = "bc_mush_gills.png",
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("better_caves_mushroom:mush_gills_glow", {
	description = "Mushroom Gills",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.20,
	tiles = {"bc_mush_gills_glow.png"},
	inventory_image = "bc_mush_gills_glow.png",
	wield_image = "bc_mush_gills_glow.png",
	paramtype = "light",
	light_source = 11,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("better_caves_mushroom:mush_grass_01", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_mush_grass_01.png"},
	inventory_image = "bc_mush_grass_01.png",
	wield_image = "bc_mush_grass_01.png",
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("better_caves_mushroom:mush_grass_02", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_mush_grass_02.png"},
	inventory_image = "bc_mush_grass_02.png",
	wield_image = "bc_mush_grass_02.png",
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("better_caves_mushroom:mush_stalks", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_mush_stalks.png"},
	inventory_image = "bc_mush_stalks.png",
	wield_image = "bc_mush_stalks.png",
	paramtype = "light",
	light_source = 10,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("better_caves_mushroom:mush_pods", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_mush_pods.png"},
	inventory_image = "bc_mush_pods.png",
	wield_image = "bc_mush_pods.png",
	paramtype = "light",
	light_source = 13,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("better_caves_mushroom:mush_orb", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_mush_orb.png"},
	inventory_image = "bc_mush_orb.png",
	wield_image = "bc_mush_orb.png",
	paramtype = "light",
	light_source = 12,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("better_caves_mushroom:mush_orb_vert", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_mush_orb_vert.png"},
	inventory_image = "bc_mush_orb_vert.png",
	wield_image = "bc_mush_orb_vert.png",
	paramtype = "light",
	light_source = 10,
	sunlight_propagates = true,
	walkable = false,
	--buildable_to = true,
	groups = {snappy = 3, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})


minetest.register_node("better_caves_mushroom:mush_soil", {
	description = "Dirt with Mycelium",
	tiles = {"bc_mush_soil.png"},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})
