local node_privacy_with_lattice = {
	description = "Privacy with Lattice Fence",
	drawtype = "mesh",
	mesh = "myfences_privacy_with_lattice.obj",
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
core.register_node("myfences:privacy_with_lattice", node_privacy_with_lattice)
	
local node_privacy_with_lattice_corner = {
	description = "Privacy with Lattice Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_privacy_with_lattice_corner.obj",
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
core.register_node("myfences:privacy_with_lattice_corner", node_privacy_with_lattice_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_privacy_with_lattice_gate = {
	description = "Privacy with Lattice Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_privacy_with_lattice.obj",
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
		if node.name == "myfences:privacy_with_lattice_gate_"..color then
			core.set_node(pos, {name="myfences:privacy_with_lattice_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:privacy_with_lattice_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:privacy_with_lattice_gate", node_privacy_with_lattice_gate)

local node_privacy_with_lattice_gate_open = {
	description = "Privacy with Lattice Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_privacy_with_lattice_gate_open.obj",
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
		if node.name == "myfences:privacy_with_lattice_gate_open_"..color then
			core.set_node(pos, {name="myfences:privacy_with_lattice_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:privacy_with_lattice_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:privacy_with_lattice_gate_open", node_privacy_with_lattice_gate_open)

	local node = table.copy(node_privacy_with_lattice)
	node.description = desc.." Privacy with Lattice Fence"
	node.tiles = tiles
	node.drop = "myfences:privacy_with_lattice"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_with_lattice_"..color, node)

	node = table.copy(node_privacy_with_lattice_corner)
	node.description = desc.." Privacy with Lattice Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:privacy_with_lattice_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_with_lattice_corner_"..color, node)

	local node = table.copy(node_privacy_with_lattice_gate)
	node.description = desc.." Privacy with Lattice Gate"
	node.tiles = tiles
	node.drop = "myfences:privacy_with_lattice_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_with_lattice_gate_"..color, node)

	local node = table.copy(node_privacy_with_lattice_gate_open)
	node.description = desc.." Privacy with Lattice Gate Open"
	node.tiles = tiles
	node.drop = "myfences:privacy_with_lattice_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_with_lattice_gate_open_"..color, node)
end

core.register_craft({
	output = "myfences:privacy_with_lattice",
	recipe = {
		{"","",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"default:wood","myfences:board","default:wood"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:privacy_with_lattice_corner",
	recipe = {"myfences:privacy_with_lattice","myfences:privacy_with_lattice"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:privacy_with_lattice_gate",
	recipe = {"myfences:privacy_with_lattice","default:steel_ingot"},
})

