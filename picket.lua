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


minetest.register_node("myfences:fence_picketb_"..name, {
	description = desc.." Picket Fence",
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
			{-0.5, -0.5, 0.25, -0.4375, 0.1875, 0.4375}, -- NodeBox1
			{0.4375, -0.5, 0.25, 0.5, 0.1875, 0.4375}, -- NodeBox8
			{-0.2187, -0.5, 0.4375, -0.0313, 0.375, 0.5}, -- NodeBox9
			{0.0312, -0.5, 0.4375, 0.2187, 0.375, 0.5}, -- NodeBox10
			{0.2812, -0.5, 0.4375, 0.4687, 0.375, 0.5}, -- NodeBox11
			{-0.4687, -0.5, 0.4375, -0.2812, 0.375, 0.5}, -- NodeBox12
--			{-0.5, 0.125, 0.25, 0.5, 0.1875, 0.4375}, -- NodeBox13
--			{-0.5, -0.375, 0.25, 0.5, -0.3125, 0.4375}, -- NodeBox14
--			{-0.4375, 0.375, 0.4375, -0.3125, 0.4375, 0.5}, -- NodeBox15
--			{-0.1875, 0.375, 0.4375, -0.0625, 0.4375, 0.5}, -- NodeBox16
--			{0.0625, 0.375, 0.4375, 0.1875, 0.4375, 0.5}, -- NodeBox17
--			{0.3125, 0.375, 0.4375, 0.4375, 0.4375, 0.5}, -- NodeBox18
--			{-0.4087, 0.4375, 0.4375, -0.3437, 0.5, 0.5}, -- NodeBox19
--			{-0.1562, 0.4375, 0.4375, -0.0937, 0.5, 0.5}, -- NodeBox20
--			{0.0948, 0.4375, 0.4375, 0.1563, 0.5, 0.5}, -- NodeBox21
--			{0.3448, 0.4375, 0.4375, 0.4063, 0.5, 0.5}, -- NodeBox22
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
			}
		},			

	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	})

minetest.register_node("myfences:fence_picket_"..name, {
	description = desc.." Picket Fence",
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
			{-0.5, -0.5, 0.25, -0.4375, 0.1875, 0.4375}, -- NodeBox1
			{0.4375, -0.5, 0.25, 0.5, 0.1875, 0.4375}, -- NodeBox8
			{-0.2187, -0.5, 0.4375, -0.0313, 0.375, 0.5}, -- NodeBox9
			{0.0312, -0.5, 0.4375, 0.2187, 0.375, 0.5}, -- NodeBox10
			{0.2812, -0.5, 0.4375, 0.4687, 0.375, 0.5}, -- NodeBox11
			{-0.4687, -0.5, 0.4375, -0.2812, 0.375, 0.5}, -- NodeBox12
			{-0.5, 0.125, 0.25, 0.5, 0.1875, 0.4375}, -- NodeBox13
			{-0.5, -0.375, 0.25, 0.5, -0.3125, 0.4375}, -- NodeBox14
			{-0.4375, 0.375, 0.4375, -0.3125, 0.4375, 0.5}, -- NodeBox15
			{-0.1875, 0.375, 0.4375, -0.0625, 0.4375, 0.5}, -- NodeBox16
			{0.0625, 0.375, 0.4375, 0.1875, 0.4375, 0.5}, -- NodeBox17
			{0.3125, 0.375, 0.4375, 0.4375, 0.4375, 0.5}, -- NodeBox18
			{-0.4087, 0.4375, 0.4375, -0.3437, 0.5, 0.5}, -- NodeBox19
			{-0.1562, 0.4375, 0.4375, -0.0937, 0.5, 0.5}, -- NodeBox20
			{0.0948, 0.4375, 0.4375, 0.1563, 0.5, 0.5}, -- NodeBox21
			{0.3448, 0.4375, 0.4375, 0.4063, 0.5, 0.5}, -- NodeBox22
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
