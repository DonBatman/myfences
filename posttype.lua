local fences = {
	{"black", "Black"},
	{"white", "White"},
	{"grey", "Grey"},
	{"grey2", "Grey 2"},
	{"grey3", "Grey 3"},
	{"brown", "Brown"},
	{"brown2", "Brown 2"},
}

for i in ipairs(fences) do
	local color = fences[i][1]
	local desc = fences[i][2]


minetest.register_node("myfences:fence_"..color, {
	description = desc.." Fence",
	drawtype = "fencelike",
	tiles = {"myfences_"..color..".png"},
	paramtype = "light",
	is_ground_content = true,
	selection_box = {
	type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	})
end
