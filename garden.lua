local fences = { -- name, desc, item, img
	{"wood",	     "Wood",               "group:wood",        ""},
	{"red_wood",	     "Wood w Red Stain",   "group:wood",        "^myfences_red.png"},
	{"white_wood",	     "Wood w White Stain", "group:wood",        "^myfences_white.png"},
	{"green_wood",	     "Wood w Green Stain", "group:wood",        "^myfences_green.png"},
}

for i in ipairs(fences) do
	local name = fences[i][1]
	local desc = fences[i][2]
	local item = fences[i][3]
	local stain = fences[i][4]


minetest.register_node("myfences:fence_garden_"..name, {
	description = desc.." Garden Fence",
	drawtype = "nodebox",
	tiles = {
		"myfences_wood.png"..stain,
		"myfences_wood.png"..stain,
		"myfences_wood.png^[transformR90"..stain,
		"myfences_wood.png^[transformR90"..stain,
		"myfences_wood.png"..stain,
		"myfences_wood.png"..stain,
		},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.1875, -0.375, 0.5, 0.4375}, -- NodeBox1
			{0.375, -0.5, 0.1875, 0.5, 0.5, 0.4375}, -- NodeBox8
			{-0.5, -0.4375, 0.4375, 0.5, -0.25, 0.5}, -- NodeBox9
			{-0.5, -0.1875, 0.4375, 0.5, 0, 0.5}, -- NodeBox10
			{-0.5, 0.0625, 0.4375, 0.5, 0.25, 0.5}, -- NodeBox11
			{-0.5, 0.3125, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox12
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
	})
end
