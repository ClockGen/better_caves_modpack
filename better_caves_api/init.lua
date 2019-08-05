better_caves = {}
better_caves.schematics = {}
better_caves.biomes = {}
better_caves.settings = {}

dofile(minetest.get_modpath("better_caves_api") .. "/settings.lua")

--API functions
better_caves.register_biome = function(biomedef)
    table.insert(better_caves.biomes, biomedef)
end

better_caves.register_node_id = function(name, id)
    better_caves[name] = minetest.get_content_id(id)
end

better_caves.register_schematic = function(pathname, schpath, schname)
    local building = minetest.get_modpath(pathname) .. schpath
    local str = minetest.serialize_schematic(building, "lua", {lua_use_comments = false, lua_num_indent_spaces = 0}) .. " return(schematic)"
    better_caves.schematics[schname] = loadstring(str)()
end

--Defining perlin noise parameters for biome distribution
local np_terrain = {
    offset = better_caves.settings.offset,
    scale = better_caves.settings.scale,
    spread = {x = 512 * better_caves.settings.spread_x, y = 512 * better_caves.settings.spread_y, z = 512 * better_caves.settings.spread_z},
    seed = better_caves.settings.seed,
    octaves = 1,
    persist = 0.7,
    lacunarity = 2.0,
}

local nobj_terrain = nil
local nvals_terrain = {}
local data = {}

--Reserved values needed for generation
better_caves.c_stone = minetest.get_content_id("default:stone")
better_caves.c_air = minetest.get_content_id("air")

--Main function that's called on every chunk generation
minetest.register_on_generated(function(minp, maxp, seed)

    --Return if outside of global limits or biomes table is empty
    if minp.y <= better_caves.settings.lowlimit or maxp.y >= better_caves.settings.highlimit or next(better_caves.biomes) == nil then return end

    --Debug variables
    local t0 = os.clock()
    local highval = 0
    local lowval = 0
    
    local sidelen = maxp.x - minp.x + 1
    local permapdims3d = {x = sidelen, y = sidelen, z = sidelen}
    nobj_terrain = nobj_terrain or minetest.get_perlin_map(np_terrain, permapdims3d)
    nobj_terrain:get3dMap_flat(minp, nvals_terrain)

    local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
    local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
    vm:get_data(data)
    
    local cache = {}
    local biome = {}
    local ni = 1
    local nv = 0
    local tempnode = 0 
    local biome_n = #better_caves.biomes

    --Iterating over nodes in vm
    for z = minp.z, maxp.z do
        for y = minp.y, maxp.y do
            local vi = area:index(minp.x, y, z)
            for x = minp.x, maxp.x do

                nv = nvals_terrain[ni]
                
                --Generating only on noise values of 0-1
                if not (nv <= 0) then
                    
                    if nv > 1 then nv = 1 end
                    
                
                    --Determining a biome, biomes are mapped to the range of perlin values of 0 < x < 1
                    for k = 0, biome_n do 
                        if k/biome_n >= nv then
                            -- Blending biomes towards biome threshold values
                            local grad = k/biome_n - nv
                            if grad <= better_caves.settings.blend_threshold and math.random(1 + (math.floor(300 * grad) ^ (0.5/3)) ) == 1 and k ~= biome_n then
                                biome = better_caves.biomes[k + 1]
                            else
                                biome = better_caves.biomes[k]
                            end
                            break
                        end
                    end
                    
                    -- Biome specific height check
                    if minp.y <= biome.lowlimit or maxp.y >= biome.highlimit then return end

                    -- Floor nodes population
                    if data[vi] == better_caves.c_stone and data[vi + area.ystride] == better_caves.c_air and math.random(biome.floor_node_chance) == 1 then
                        -- Checking for additional n nodes below specified in a biome definition
                        for v = 0, biome.floor_depth - 1 do
                            if data[vi - v * area.ystride] == better_caves.c_stone then
                                data[vi - v * area.ystride] = biome.floor_node
                            end
                        end
                        --Floor decoration population
                        if math.random(biome.floor_decoration_chance) == 1 then
                            if math.random(biome.floor_rare_decoration_chance) == 1 then
                                --Assigning current decoration node to a temp var to check for that node when spawning a schematic
                                tempnode = biome.floor_rare_decoration[math.random(#biome.floor_rare_decoration)]
                                data[vi + area.ystride] = tempnode
                            else
                                --Assigning current decoration node to a temp var to check for that node when spawning a schematic
                                tempnode = biome.floor_decoration[math.random(#biome.floor_decoration)]
                                data[vi + area.ystride] = tempnode
                            end
                        end
                    end

                    -- Ceiling nodes population
                    if data[vi] == better_caves.c_stone and data[vi - area.ystride] == better_caves.c_air and math.random(biome.ceiling_node_chance) == 1 then
                        for v = 0, biome.ceiling_depth - 1 do
                            if data[vi + v * area.ystride] == better_caves.c_stone then
                                data[vi + v * area.ystride] = biome.ceiling_node
                            end
                        end
                        --Ceiling decoration population
                        if math.random(biome.ceiling_decoration_chance) == 1 then
                            if math.random(biome.ceiling_rare_decoration_chance) == 1 then
                                --Assigning current decoration node to a temp var to check for that node when spawning a schematic
                                tempnode = biome.ceiling_rare_decoration[math.random(#biome.ceiling_rare_decoration)]
                                data[vi - area.ystride] = tempnode
                            else
                                --Assigning current decoration node to a temp var to check for that node when spawning a schematic
                                tempnode = biome.ceiling_decoration[math.random(#biome.ceiling_decoration)]
                                data[vi - area.ystride] = tempnode
                            end
                        end
                    end
                    
                    --Wall nodes population
                    if data[vi] == better_caves.c_stone and (data[vi + area.zstride] == better_caves.c_air or data[vi - area.zstride] == better_caves.c_air or
                    data[vi + 1] == better_caves.c_air or data[vi - 1] == better_caves.c_air) then
                        data[vi] = biome.wall_node
                    end

                    --Floor schematics
                    if data[vi] == biome.floor_node and (data[vi + area.ystride] == better_caves.c_air or data[vi + area.ystride] == tempnode) and math.random(biome.floor_schematic_chance) == 1 then
                        --Selecting either normal or rare schematic
                        local schemkey = 0
                        if math.random(biome.floor_rare_schematic_chance) == 1 then
                            schemkey = biome.floor_rare_schematics[math.random(#biome.floor_rare_schematics)]
                        else
                            schemkey = biome.floor_schematics[math.random(#biome.floor_schematics)]
                        end
                        --Loading the schematic
                        local schematic = better_caves.schematics[schemkey]
                        --Checking if the schematic fits in height
                        local air_count = 0
                        for h = 0, schematic.size.y do
                            if data[vi + h * area.ystride] == better_caves.c_air then
                                air_count = air_count + 1
                            end
                        end
                        --Checking if the node below is a decoration, changing it to air and increasing air count to allow schematic to fit
                         if data[vi + area.ystride] == tempnode and air_count + 1 == schematic.size.y then
                             data[vi + area.ystride] = better_caves.c_air
                             air_count = air_count + 1
                         end
                        --Adding schematic to the cache if it fits
                        if air_count == schematic.size.y then
                            table.insert(cache, {x=x, y=y + 1, z=z, schematic=schemkey, overwrite=false})
                        end
                    end

                    --Ceiling schematics
                    if data[vi] == biome.floor_node and (data[vi - area.ystride] == better_caves.c_air or data[vi - area.ystride] == tempnode) and math.random(biome.ceiling_schematic_chance) == 1 then
                        --Selecting either normal or rare schematic
                        local schemkey = 0
                        if math.random(biome.ceiling_rare_schematic_chance) == 1 then
                            schemkey = biome.ceiling_rare_schematics[math.random(#biome.ceiling_rare_schematics)]
                        else
                            schemkey = biome.ceiling_schematics[math.random(#biome.ceiling_schematics)]
                        end
                        --Loading the schematic
                        local schematic = better_caves.schematics[schemkey]
                        --Checking if the schematic fits in height
                        local air_count = 0
                        for h = 0, schematic.size.y do
                            if data[vi - h * area.ystride] == better_caves.c_air then
                                air_count = air_count + 1
                            end
                        end
                        --Checking if the node below is a decoration, changing it to air and increasing air count to allow schematic to fit
                         if data[vi - area.ystride] == tempnode and air_count + 1 == schematic.size.y then
                             data[vi - area.ystride] = better_caves.c_air
                             air_count = air_count + 1
                         end
                        -- Adding schematic to the cache if it fits
                        if air_count == schematic.size.y then
                            table.insert(cache, {x=x, y=y - schematic.size.y, z=z, schematic=schemkey, overwrite=false})
                        end
                    end

                end
                
                --Recording lowest and highest perlin values in this chunk
                if better_caves.settings.debug then
                    if nv > highval then
                        highval = nv
                    elseif nv < lowval then
                        lowval = nv
                    end
                end

                --Increase noise and node indexes
                ni = ni + 1
                vi = vi + 1
            end
        end
    end

    vm:set_data(data)

    --Placing schematics from a cache created before
    for k,v in pairs(cache) do
        local schem = better_caves.schematics[v.schematic]
        local schem_offset = {x=math.floor(schem.size.x/2), y=0, z=math.floor(schem.size.z/2)}
        minetest.place_schematic_on_vmanip(vm, { x = v.x - schem_offset.x, y = v.y, z = v.z - schem_offset.z}, schem, "random", nil, v.overwrite)
    end

    vm:calc_lighting()
    vm:write_to_map()
    vm:update_liquids()

    --Print debug info
    if better_caves.settings.debug then
        local chugent = math.ceil((os.clock() - t0) * 1000)
        print ("[better_caves_api] chunk gen time:" .. chugent .. " ms. Noise high val:" .. highval .. " Low val:" .. lowval)
    end
end
)

