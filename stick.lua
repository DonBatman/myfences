local node_stick = {
	description = "Stick Fence",
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
			{-0.125, -0.5, 0.4375, -0.0625, 0.5, 0.5},
			{-0.25, -0.5, 0.4375, -0.1875, 0.5, 0.5},
			{-0.375, -0.5, 0.4375, -0.3125, 0.5, 0.5},
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5},
			{0, -0.5, 0.4375, 0.0625, 0.5, 0.5},
			{0.125, -0.5, 0.4375, 0.1875, 0.5, 0.5},
			{0.25, -0.5, 0.4375, 0.3125, 0.5, 0.5},
			{0.375, -0.5, 0.4375, 0.4375, 0.5, 0.5},
			{-0.5, 0.25, 0.3125, 0.5, 0.3125, 0.4375},
			{-0.5, -0.375, 0.3125, 0.5, -0.3125, 0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
		}
	},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:stick", node_stick)
	
local node_stick_corner = {
	description = "Stick Fence Corner",
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
			{-0.125, -0.5, 0.4375, -0.0625, 0.5, 0.5},
			{-0.25, -0.5, 0.4375, -0.1875, 0.5, 0.5},
			{-0.375, -0.5, 0.4375, -0.3125, 0.5, 0.5},
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5},
			{0, -0.5, 0.4375, 0.0625, 0.5, 0.5},
			{0.125, -0.5, 0.4375, 0.1875, 0.5, 0.5},
			{0.25, -0.5, 0.4375, 0.3125, 0.5, 0.5},
			{0.375, -0.5, 0.4375, 0.4375, 0.5, 0.5},
			{-0.4375, 0.25, 0.3125, 0.5, 0.3125, 0.4375},
			{-0.4375, -0.375, 0.3125, 0.5, -0.3125, 0.4375},
			{-0.5, -0.5, 0.3125, -0.4375, 0.5, 0.375},
			{-0.5, -0.5, 0.1875, -0.4375, 0.5, 0.25},
			{-0.5, -0.5, 0.0625, -0.4375, 0.5, 0.125},
			{-0.5, -0.5, -0.0625, -0.4375, 0.5, 0},
			{-0.5, -0.5, -0.1875, -0.4375, 0.5, -0.125},
			{-0.5, -0.5, -0.3125, -0.4375, 0.5, -0.25},
			{-0.5, -0.5, -0.4375, -0.4375, 0.5, -0.375},
			{-0.4375, 0.25, -0.5, -0.3125, 0.3125, 0.3125},
			{-0.4375, -0.375, -0.5, -0.3125, -0.3125, 0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
			{-0.5,-0.5,-0.5,-0.25,0.5,0.5},
		}
	},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:stick_corner", node_stick_corner)

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

	local node = table.copy(node_stick)
	node.description = desc.." Stick Fence"
	node.tiles = tiles
	node.drop = "myfences:stick"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:stick_"..color, node)

	node = table.copy(node_stick_corner)
	node.description = desc.." Stick Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:stick_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:stick_corner_"..color, node)
end
core.register_craft({
	output = "myfences:stick",
	recipe = {
		{"","",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"default:stick","myfences:board","default:stick"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:stick_corner",
	recipe = {"myfences:stick","myfences:stick"},
})

