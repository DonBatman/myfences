local node_stick = {
	description = "Stick Fence",
	drawtype = "mesh",
	mesh = "myfences_stick.obj",
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
core.register_node("myfences:stick", node_stick)
	
local node_stick_corner = {
	description = "Stick Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_stick_corner.obj",
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
			{0.5,-0.5,-0.5,0.25,0.5,0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.25,0.5,0.5,0.5},
			{0.5,-0.5,-0.5,0.25,0.5,0.5},
		}
	},
	groups = {choppy = 2, flammable = 1},
	sounds = default.node_sound_stone_defaults(),
}
core.register_node("myfences:stick_corner", node_stick_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_stick_gate = {
	description = "Stick Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_stick.obj",
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
		if node.name == "myfences:stick_gate_"..color then
			core.set_node(pos, {name="myfences:stick_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:stick_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:stick_gate", node_stick_gate)

local node_stick_gate_open = {
	description = "Stick Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_stick_gate_open.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	drops = "myfences:stick_gate",
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
		if node.name == "myfences:stick_gate_open_"..color then
			core.set_node(pos, {name="myfences:stick_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:stick_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:stick_gate_open", node_stick_gate_open)

	local node = table.copy(node_stick)
	node.description = desc.." Stick Fence"
	node.tiles = tiles
	node.drop = "myfences:stick"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:stick_"..color, node)

	node = table.copy(node_stick_corner)
	node.description = desc.." Stick Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:stick_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:stick_corner_"..color, node)

	local node = table.copy(node_stick_gate)
	node.description = desc.." Stick Gate"
	node.tiles = tiles
	node.drop = "myfences:stick_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:stick_gate_"..color, node)

	local node = table.copy(node_stick_gate_open)
	node.description = desc.." Stick Gate Open"
	node.tiles = tiles
	node.drop = "myfences:stick_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:stick_gate_open_"..color, node)
end
core.register_craft({
	output = "myfences:stick",
	recipe = {
		{"","",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"default:stick","myfences:board","default:stick"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:stick_corner",
	recipe = {"myfences:stick","myfences:stick"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:stick_gate",
	recipe = {"myfences:stick","default:steel_ingot"},
})

