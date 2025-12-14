local node_short = {
	description = "Short Fence",
	drawtype = "mesh",
	mesh = "myfences_short.obj",
	tiles = {
		"myfences_wood.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.3125,0.5,0.0625,0.5},
		}
	},
	collision_box = {
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
	drawtype = "mesh",
	mesh = "myfences_short_corner.obj",
	tiles = {
		"myfences_wood.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.3125,0.5,0.0625,0.5},
			{0.5,-0.5,-0.5,0.3125,0.0625,0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.3125,0.5,0.0625,0.5},
			{0.5,-0.5,-0.5,0.3125,0.0625,0.5},
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
	}

local node_short_gate = {
	description = "Short Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_short.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.5, 0.5, 0.5, 0.325}, 
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.5, 0.5, 0.5, 0.325}, 
		}
	},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local p2 = node.param2
		local dir = core.facedir_to_dir(p2)
		if node.name == "myfences:short_gate_"..color then
			core.set_node(pos, {name="myfences:short_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:short_gate_open",  param2=p2})
		end
	end
}

local node_short_gate_open = {
	description = "Short Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_short_gate_open.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	drops = "myfences_short_gate",
	groups = {cracky=2, not_in_creative_inventory = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.325, 0.5, 0.5}, 
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.325, 0.5, 0.5}, 
		}
	},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local p2 = node.param2
		local dir = core.facedir_to_dir(p2)
		if node.name == "myfences:short_gate_open_"..color then
			core.set_node(pos, {name="myfences:short_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:short_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:short_gate_open", node_short_gate_open)
core.register_node("myfences:short_gate", node_short_gate)
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

	node = table.copy(node_short_gate)
	node.description = desc.." Short Fence Gate"
	node.tiles = tiles
	node.drop = "myfences:short_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short_gate_"..color, node)

	node = table.copy(node_short_gate_open)
	node.description = desc.." Short Fence Gate Open"
	node.tiles = tiles
	node.drop = "myfences:short_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short_gate_open_"..color, node)
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
core.register_craft({
	type = "shapeless",
	output = "myfences:short_gate",
	recipe = {"myfences:short","default:steel_ingot"},
})
