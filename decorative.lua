local node_decorative = {
	description = "Decorative Fence",
	drawtype = "mesh",
	mesh = "myfences_decorative.obj",
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
core.register_node("myfences:decorative", node_decorative)
	
local node_decorative_corner = {
	description = "Decorative Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_decorative_corner.obj",
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
core.register_node("myfences:decorative_corner", node_decorative_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_decorative_gate = {
	description = "Decorative Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_decorative.obj",
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
		if node.name == "myfences:decorative_gate_"..color then
			core.set_node(pos, {name="myfences:decorative_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:decorative_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:decorative_gate", node_decorative_gate)

local node_decorative_gate_open = {
	description = "Decorative Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_decorative_gate_open.obj",
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
		if node.name == "myfences:decorative_gate_open_"..color then
			core.set_node(pos, {name="myfences:decorative_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:decorative_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:decorative_gate_open", node_decorative_gate_open)

	local node = table.copy(node_decorative)
	node.description = desc.." Decorative Fence"
	node.tiles = tiles
	node.drop = "myfences:decorative"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:decorative_"..color, node)

	node = table.copy(node_decorative_corner)
	node.description = desc.." Decorative Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:decorative_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:decorative_corner_"..color, node)

	local node = table.copy(node_decorative_gate)
	node.description = desc.." Decorative Gate"
	node.tiles = tiles
	node.drop = "myfences:decorative_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:decorative_gate_"..color, node)

	local node = table.copy(node_decorative_gate_open)
	node.description = desc.." Decorative Gate Open"
	node.tiles = tiles
	node.drop = "myfences:decorative_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:decorative_gate_open_"..color, node)
end

core.register_craft({
	output = "myfences:decorative",
	recipe = {
		{"","",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"default:wood","myfences:board","default:wood"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:decorative_corner",
	recipe = {"myfences:decorative","myfences:decorative"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:decorative_gate",
	recipe = {"myfences:decorative","default:steel_ingot"},
})

