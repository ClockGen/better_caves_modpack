minetest.register_ore({
		ore_type        = "blob",
		ore             = "better_caves:ancient_web",
		wherein         = {"default:stone"},
		clust_scarcity  = 40 * 40 * 40,
		clust_size      = 5,
		y_min           = -256,
		y_max           = 0,
		--noise_params    = {
			--offset = 0.0,
			--scale = 2,
			--spread = {x = 75, y = 75, z = 75},
			--seed = 3489,
			--octaves = 1,
			--persist = 0.0
		--},
})
minetest.register_ore({
		ore_type        = "blob",
		ore             = "better_caves:hanging_roots",
		wherein         = {"default:stone"},
		clust_scarcity  = 32 * 32 * 32,
		clust_size      = 4,
		y_max           = 0,
		y_min           = -512,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
})
minetest.register_ore({
		ore_type        = "blob",
		ore             = "better_caves:roots_node_moss",
		wherein         = {"default:stone"},
		clust_scarcity  = 32 * 32 * 32,
		clust_size      = 4,
		y_max           = 0,
		y_min           = -512,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
})
minetest.register_ore({
		ore_type        = "blob",
		ore             = "better_caves:roots_node",
		wherein         = {"default:stone"},
		clust_scarcity  = 32 * 32 * 32,
		clust_size      = 4,
		y_max           = 0,
		y_min           = -512,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
})

