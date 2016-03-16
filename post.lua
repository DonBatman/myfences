local fences = { -- name, desc, item, img
	{"wood",	     "Wood",              "group:wood",        ""},
	{"red_wood",	     "Wood w Red Stain",  "group:wood",        "^myfences_red.png"},
	{"white_wood",	     "Wood w White Stain", "group:wood",        "^myfences_white.png"},
	{"green_wood",	     "Wood w Green Stain", "group:wood",        "^myfences_green.png"},
}

for i in ipairs(fences) do
	local name = fences[i][1]
	local desc = fences[i][2]
	local item = fences[i][3]
	local stain = fences[i][4]


minetest.register_node("myfences:coorner_post_"..name, {
	description = desc.." Post",
	drawtype = "nodebox",
	tiles = {
		"myfences_wood.png"..stain,
		"myfences_wood.png"..stain,
		"myfences_wood.png^[transformR90"..stain,
		"myfences_wood.png^[transformR90"..stain,
		"myfences_wood.png^[transformR90"..stain,
		"myfences_wood.png^[transformR90"..stain,
		},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{0.1875, -0.5, 0.1875, 0.5, 0.5, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0.1875, -0.5, 0.1875, 0.5, 0.5, 0.5},
			}
		},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
	})

end
