local node_picket = {
	description = "Picket Fence",
	drawtype = "mesh",
	mesh = "myfences_picket.obj", 
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
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:picket", node_picket)

local node_picketb = {
	description = "Picket Fence",
	drawtype = "mesh",
	mesh = "myfences_picketb.obj",
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
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}

core.register_node("myfences:picketb", node_picketb)

local node_picket_corner = {
	description = "Picket Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_picket_corner.obj",
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
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:picket_corner", node_picket_corner)

local node_picketb_corner = {
	description = "Picket Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_picketb_corner.obj",
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
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:picketb_corner", node_picketb_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_picket_gate = {
	description = "Picket Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_picket.obj",
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
		if node.name == "myfences:picket_gate_"..color then
			core.set_node(pos, {name="myfences:picket_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:picket_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:picket_gate", node_picket_gate)

local node_picket_gate_open = {
	description = "Picket Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_picket_gate_open.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	drops = "myfences:picket_gate",
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
		if node.name == "myfences:picket_gate_open_"..color then
			core.set_node(pos, {name="myfences:picket_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:picket_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:picket_gate_open", node_picket_gate_open)

local node_picketb_gate = {
	description = "Picket Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_picketb.obj",
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
		if node.name == "myfences:picketb_gate_"..color then
			core.set_node(pos, {name="myfences:picketb_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:picketb_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:picketb_gate", node_picketb_gate)

local node_picketb_gate_open = {
	description = "Picket Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_picketb_gate_open.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	drops = "myfences:picketb_gate",
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
		if node.name == "myfences:picketb_gate_open_"..color then
			core.set_node(pos, {name="myfences:picketb_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:picketb_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:picketb_gate_open", node_picketb_gate_open)

	local node = table.copy(node_picketb)
	node.description = desc.." Picket Fence"
	node.tiles = tiles
	node.drop = "myfences:picketb"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picketb_"..color, node)

	node = table.copy(node_picket)
	node.description = desc.." Picket Fence"
	node.tiles = tiles
	node.drop = "myfences:picket"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picket_"..color, node)

	node = table.copy(node_picket_corner)
	node.description = desc.." Picket Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:picket_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picket_corner_"..color, node)

	node = table.copy(node_picketb_corner)
	node.description = desc.." Picket Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:picketb_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picketb_corner_"..color, node)

	node = table.copy(node_picket_gate)
	node.description = desc.." Picket Gate"
	node.tiles = tiles
	node.drop = "myfences:picket_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picket_gate_"..color, node)

	node = table.copy(node_picket_gate_open)
	node.description = desc.." Picket Gate Open"
	node.tiles = tiles
	node.drop = "myfences:picket_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picket_gate_open_"..color, node)

	node = table.copy(node_picketb_gate)
	node.description = desc.." Picket Gate"
	node.tiles = tiles
	node.drop = "myfences:picketb_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picketb_gate_"..color, node)

	node = table.copy(node_picketb_gate_open)
	node.description = desc.." Picket Gate Open"
	node.tiles = tiles
	node.drop = "myfences:picketb_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:picketb_gate_open_"..color, node)
end

core.register_craft({
	output = "myfences:picket",
	recipe = {
		{"","myfences:board",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"myfences:board","myfences:board","myfences:board"},
	}
})
core.register_craft({
	output = "myfences:picketb",
	recipe = {
		{"","",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"myfences:board","myfences:board","myfences:board"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:picket_corner",
	recipe = {"myfences:picket","myfences:picket"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:picketb_corner",
	recipe = {"myfences:picketb","myfences:picketb"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:picket_gate",
	recipe = {"myfences:picket","default:steel_ingot"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:picketb_gate",
	recipe = {"myfences:picketb","default:steel_ingot"},
})

