local node_neighbor = {
	description = "Neighbor Fence",
	drawtype = "mesh",
	mesh = "myfences_neighbor.obj",
	tiles = {
		"myfences_wood.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
		}
	},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:neighbor", node_neighbor)
	
local node_neighbor_corner = {
	description = "Neighbor Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_neighbor_corner.obj",
	tiles = {
		"myfences_wood.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propogates = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
			{0.25,-0.5,-0.5,0.5,0.5,0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
			{0.25,-0.5,-0.5,0.5,0.5,0.5},
		}
	},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:neighbor_corner", node_neighbor_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_neighbor_gate = {
	description = "Neighbor Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_neighbor.obj",
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
		if node.name == "myfences:neighbor_gate_"..color then
			core.set_node(pos, {name="myfences:neighbor_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:neighbor_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:neighbor_gate", node_neighbor_gate)

local node_neighbor_gate_open = {
	description = "Neighbor Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_neighbor_gate_open.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2,not_in_creative_inventory = 1},
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
		if node.name == "myfences:neighbor_gate_open_"..color then
			core.set_node(pos, {name="myfences:neighbor_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:neighbor_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:neighbor_gate_open", node_neighbor_gate_open)

	local node = table.copy(node_neighbor)
	node.description = desc.." Neighbor Fence"
	node.tiles = tiles
	node.drop = "myfences:neighbor"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:neighbor_"..color, node)

	node = table.copy(node_neighbor_corner)
	node.description = desc.." Neighbor Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:neighbor_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:neighbor_corner_"..color, node)

	local node = table.copy(node_neighbor_gate)
	node.description = desc.." Neighbor Gate"
	node.tiles = tiles
	node.drop = "myfences:neighbor_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:neighbor_gate_"..color, node)

	local node = table.copy(node_neighbor_gate_open)
	node.description = desc.." Neighbor Gate Open"
	node.tiles = tiles
	node.drop = "myfences:neighbor_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:neighbor_gate_open_"..color, node)
end

core.register_craft({
	output = "myfences:neighbor",
	recipe = {
		{"","",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"default:wood","myfences:board","default:wood"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:neighbor_corner",
	recipe = {"myfences:neighbor","myfences:neighbor"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:neighbor_gate",
	recipe = {"myfences:neighbor","default:steel_ingot"},
})

