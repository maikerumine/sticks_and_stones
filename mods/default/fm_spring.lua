
core.register_node("default:defaultwater",{
    description = "Water spring",
    tiles = {"default_water.png"},
})

core.register_abm({
    nodenames = {"default:defaultwater"},
    interval = 2,
    chance = 2,
    action = function(pos,node)
        core.set_node(pos,{name = "default:water_source", param2=128})
    end
})

core.register_node("default:defaultwater_compressed",{
    description = "Water spring compressed",
    tiles = {"default_water.png"},
})

core.register_abm({
    nodenames = {"default:defaultwater_compressed"},
    interval = 2,
    chance = 2,
    action = function(pos,node)
        core.set_node(pos,{name = "default:water_source", param2=128+31})
    end
})

core.register_node("default:defaultlava",{
    description = "Lava spring",
    tiles = {"default_lava.png"},
})

core.register_abm({
    nodenames = {"default:defaultlava"},
    interval = 2,
    chance = 2,
    action = function(pos,node)
        core.set_node(pos,{name = "default:lava_source", param2=128})
    end
})

core.register_node("default:defaultdirt",{
    description = "Dirt spring",
    tiles = {"default_dirt.png"},
})

core.register_abm({
    nodenames = {"default:defaultdirt"},
    interval = 2,
    chance = 2,
    action = function(pos,node)
        core.set_node(pos,{name = "default:dirt", param2=128})
    end
})

core.register_node("default:defaultdirt_compressed",{
    description = "Dirt spring compressed",
    tiles = {"default_dirt.png"},
})

core.register_abm({
    nodenames = {"default:defaultdirt_compressed"},
    interval = 2,
    chance = 2,
    action = function(pos,node)
        core.set_node(pos,{name = "default:dirt", param2=128+31})
    end
})

core.register_node("default:defaultsand",{
    description = "Sand spring",
    tiles = {"default_sand.png"},
})

core.register_abm({
    nodenames = {"default:defaultsand"},
    interval = 2,
    chance = 2,
    action = function(pos,node)
        core.set_node(pos,{name = "default:sand", param2=128})
    end
})
