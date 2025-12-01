local node_short = {
	description = "Short Fence",
	drawtype = "nodebox",
	tiles = {
		"myfences_wood.png",
		"myfences_wood.png",
		"myfences_wood.png^[transformR90",
		"myfences_wood.png^[transformR90",
		"myfences_wood.png",
		"myfences_wood.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.125, 0.3125, 0.5, -0.0625, 0.4375},
			{-0.5, -0.375, 0.3125, 0.5, -0.3125, 0.4375},
			{-0.5, -0.5, 0.4375, -0.3125, 0.0625, 0.5},
			{-0.25, -0.5, 0.4375, -0.0625, 0.0625, 0.5},
			{0, -0.5, 0.4375, 0.1875, 0.0625, 0.5},
			{0.25, -0.5, 0.4375, 0.4375, 0.0625, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.3125,0.5,0.0625,0.5},
		}
	},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:short", node_short)
	
local node_short_corner = {
	description = "Short Fence Corner",
	drawtype = "nodebox",
	tiles = {
		"myfences_wood.png",
		"myfences_wood.png",
		"myfences_wood.png^[transformR90",
		"myfences_wood.png^[transformR90",
		"myfences_wood.png",
		"myfences_wood.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.125, -0.5, -0.3125, -0.0625, 0.3125},
			{-0.4375, -0.375, -0.5, -0.3125, -0.3125, 0.3125},
			{-0.5, -0.5, 0.4375, -0.3125, 0.0625, 0.5},
			{-0.25, -0.5, 0.4375, -0.0625, 0.0625, 0.5},
			{0, -0.5, 0.4375, 0.1875, 0.0625, 0.5},
			{0.25, -0.5, 0.4375, 0.4375, 0.0625, 0.5},
			{-0.5, -0.5, 0.3125, -0.4375, 0.0625, 0.4375},
			{-0.5, -0.5, 0, -0.4375, 0.0625, 0.1875},
			{-0.5, -0.5, -0.25, -0.4375, 0.0625, -0.0625},
			{-0.5, -0.5, -0.5, -0.4375, 0.0625, -0.3125},
			{-0.4375, -0.375, 0.3125, 0.5, -0.3125, 0.4375},
			{-0.4375, -0.125, 0.3125, 0.5, -0.0625, 0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.3125,0.5,0.0625,0.5},
			{-0.5,-0.5,-0.5,-0.3125,0.0625,0.5},
		}
	},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:short_corner", node_short_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
		"myfences_wood.png"..stain,
		"myfences_wood.png^[transformR90"..stain,
		"myfences_wood.png^[transformR90"..stain,
		"myfences_wood.png"..stain,
		"myfences_wood.png"..stain,
	}

	local node = table.copy(node_short)
	node.description = desc.." Short Fence"
	node.tiles = tiles
	node.drop = "myfences:short"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short_"..color, node)

	node = table.copy(node_short_corner)
	node.description = desc.." Short Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:short_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short_corner_"..color, node)
end
core.register_craft({
	output = "myfences:short",
	recipe = {
		{"","",""},
		{"myfences:board","","myfences:board"},
		{"group:wood","myfences:board","group:wood"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:short_corner",
	recipe = {"myfences:short","myfences:short"},
})

