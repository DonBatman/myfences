local node_short2 = {
	description = "Short 2 Fence",
	drawtype = "mesh",
	mesh = "myfences_short2.obj",
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
core.register_node("myfences:short2", node_short2)
	
local node_short2_corner = {
	description = "Short 2 Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_short2_corner.obj",
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
core.register_node("myfences:short2_corner", node_short2_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_short2_gate = {
	description = "Short 2 Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_short2.obj",
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
		if node.name == "myfences:short2_gate_"..color then
			core.set_node(pos, {name="myfences:short2_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:short2_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:short2_gate", node_short2_gate)

local node_short2_gate_open = {
	description = "Short 2 Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_short2_gate_open.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	drops = "myfences_short2_gate",
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
		if node.name == "myfences:short2_gate_open_"..color then
			core.set_node(pos, {name="myfences:short2_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:short2_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:short2_gate_open", node_short2_gate_open)

	local node = table.copy(node_short2)
	node.description = desc.." Short 2 Fence"
	node.tiles = tiles
	node.drop = "myfences:short2"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short2_"..color, node)

	node = table.copy(node_short2_corner)
	node.description = desc.." Short 2 Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:short2_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short2_corner_"..color, node)
	
	local node = table.copy(node_short2_gate)
	node.description = desc.." Short 2 Gate"
	node.tiles = tiles
	node.drop = "myfences:short2_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short2_gate_"..color, node)
	
	local node = table.copy(node_short2_gate_open)
	node.description = desc.." Short 2 Gate Open"
	node.tiles = tiles
	node.drop = "myfences:short2_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:short2_gate_open_"..color, node)
end

core.register_craft({
	output = "myfences:short2",
	recipe = {
		{"","",""},
		{"myfences:board","myfences:board","myfences:board"},
		{"default:wood","myfences:board","default:wood"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:short2_corner",
	recipe = {"myfences:short2","myfences:short2"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:short2_gate",
	recipe = {"myfences:short2","default:steel_ingot"},
})

