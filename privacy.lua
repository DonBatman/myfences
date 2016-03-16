local fences = { -- name, desc, item, img
	{"wood",	     "Wood",  "group:wood",        "",					 {choppy = 2, flammable = 1}},
	{"red_wood",	 "Red",   "group:wood",        "^myfences_red.png",  {choppy = 2, flammable = 1,not_in_creative_inventory=1}},
	{"white_wood",	 "White", "group:wood",        "^myfences_white.png",{choppy = 2, flammable = 1,not_in_creative_inventory=1}},
	{"green_wood",	 "Green", "group:wood",        "^myfences_green.png",{choppy = 2, flammable = 1,not_in_creative_inventory=1}},
}

for i in ipairs(fences) do
	local name = fences[i][1]
	local desc = fences[i][2]
	local item = fences[i][3]
	local stain = fences[i][4]
	local gro = fences[i][5]


minetest.register_node("myfences:fence_privacy_"..name, {
	description = desc.." Privacy Fence",
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
			{-0.5, -0.5, 0.1875, -0.375, 0.5, 0.4375},
			{0.375, -0.5, 0.1875, 0.5, 0.5, 0.4375},
			{-0.375, -0.375, 0.3125, 0.375, -0.1875, 0.4375},
			{-0.375, 0.1875, 0.3125, 0.375, 0.375, 0.4375},
			{-0.4896, -0.5, 0.4375, -0.1772, 0.5, 0.5},
			{-0.1458, -0.5, 0.4375, 0.1458, 0.5, 0.5},
			{0.1772, -0.5, 0.4375, 0.4896, 0.5, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
			}
		},
	groups = gro,
	sounds = default.node_sound_stone_defaults(),
	})

minetest.register_node("myfences:fence_privacy_"..name.."_corner", {
	description = desc.." Privacy Fence Corner",
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
			{-0.5, -0.5, 0.1875, -0.375, 0.5, 0.4375},
			{0.1875, -0.5, 0.1875, 0.4375, 0.5, 0.4375},
			{-0.375, -0.375, 0.3125, 0.375, -0.1875, 0.4375},
			{-0.375, 0.1875, 0.3125, 0.375, 0.375, 0.4375},
			{-0.4896, -0.5, 0.4375, -0.1772, 0.5, 0.5},
			{-0.1458, -0.5, 0.4375, 0.1458, 0.5, 0.5},
			{0.1772, -0.5, 0.4375, 0.4896, 0.5, 0.5},
			
			{0.1875, -0.5, -0.5, 0.4375, 0.5, -0.375},
			{0.3125, -0.375, -0.375, 0.4375, -0.1875, 0.375},
			{0.3125, 0.1875, -0.375, 0.4375, 0.375, 0.375},
			{0.4375, -0.5, 0.1772, 0.5, 0.5, 0.4896},
			{0.4375, -0.5, -0.1458, 0.5, 0.5, 0.1458},
			{0.4375, -0.5, -0.4896, 0.5, 0.5, -0.1772},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
			{0.25,-0.5,-0.5,0.5,0.5,0.5},
			}
		},
	groups = gro,
	sounds = default.node_sound_stone_defaults(),
	})
end
minetest.register_craft({
	output = "myfences:fence_privacy_wood",
	recipe = {
		{"","",""},
		{"default:wood","myfences:board","myfences:board"},
		{"default:wood","myfences:board","myfences:board"},
		}
})
minetest.register_craft({
	type = "shapeless",
	output = "myfences:fence_privacy_wood_corner",
	recipe = {"myfences:fence_privacy_wood","myfences:fence_privacy_wood"},
})
