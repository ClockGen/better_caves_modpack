minetest.register_node("better_caves_jungle:jungle_tree", {
	description = "Mushroom Cap",
	tiles = {"bc_jungle_wood_02.png", "bc_jungle_wood_02.png", "bc_jungle_wood_01.png"},
	paramtype2 = "facedir",
	--light_source = 0,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_jungle:jungle_tree_ember", {
	description = "Mushroom Cap",
	tiles = {"bc_jungle_wood_04.png", "bc_jungle_wood_04.png", "bc_jungle_wood_01.png"},
	paramtype2 = "facedir",
	--light_source = 0,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_jungle:jungle_tree_ivy", {
	description = "Mushroom Cap",
	tiles = {"bc_jungle_wood_03.png", "bc_jungle_wood_03.png", "bc_jungle_wood_01.png"},
	paramtype2 = "facedir",
	--light_source = 0,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_jungle:jungle_mushroom_stem", {
	description = "Mushroom Cap",
	tiles = {"bc_jungle_mushroom_stem_02.png", "bc_jungle_mushroom_stem_02.png", "bc_jungle_mushroom_stem.png"},
	paramtype2 = "facedir",
	--light_source = 0,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_jungle:jungle_fern_stem", {
	description = "Mushroom Cap",
	tiles = {"bc_jungle_mushroom_stem_02.png", "bc_jungle_mushroom_stem_02.png", "bc_jungle_mushroom_stem.png"},
	paramtype2 = "facedir",
	--light_source = 0,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("better_caves_jungle:jungle_grass_01", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_jungle_grass_01.png"},
	inventory_image = "bc_jungle_grass_01.png",
	wield_image = "bc_jungle_grass_01.png",
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

minetest.register_node("better_caves_jungle:jungle_vine_01", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_jungle_vine_01.png"},
	inventory_image = "bc_jungle_vine_01.png",
	wield_image = "bc_jungle_vine_01.png",
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

minetest.register_node("better_caves_jungle:jungle_glow_plant", {
	description = "Mushroom Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.40,
	tiles = {"bc_mush_orb.png"},
	inventory_image = "bc_jungle_glow_plant.png",
	wield_image = "bc_jungle_glow_plant.png",
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

minetest.register_node("better_caves_jungle:jungle_wall", {
	description = "Dirt with Mycelium",
	tiles = {"bc_jungle_wall.png"},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})


minetest.register_node("better_caves_jungle:jungle_soil", {
	description = "Dirt with Mycelium",
	tiles = {"bc_jungle_soil.png"},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})
