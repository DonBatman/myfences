local node_v_fence = {
	description = "V Fence",
	drawtype = "mesh",
	mesh = "myfences_v_fence.obj",
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
core.register_node("myfences:v_fence", node_v_fence)
	
local node_v_fence_corner = {
	description = "V Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_v_fence_corner.obj",
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
core.register_node("myfences:v_fence_corner", node_v_fence_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_v_fence_gate = {
	description = "V Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_v_fence.obj",
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
		if node.name == "myfences:v_fence_gate_"..color then
			core.set_node(pos, {name="myfences:v_fence_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:v_fence_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:v_fence_gate", node_v_fence_gate)

local node_v_fence_gate_open = {
	description = "V Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_v_fence_gate_open.obj",
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
		if node.name == "myfences:v_fence_gate_open_"..color then
			core.set_node(pos, {name="myfences:v_fence_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:v_fence_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:v_fence_gate_open", node_v_fence_gate_open)

	local node = table.copy(node_v_fence)
	node.description = desc.." V Fence"
	node.tiles = tiles
	node.drop = "myfences:v_fence"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:v_fence_"..color, node)

	node = table.copy(node_v_fence_corner)
	node.description = desc.." V Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:v_fence_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:v_fence_corner_"..color, node)

	local node = table.copy(node_v_fence_gate)
	node.description = desc.." V Gate"
	node.tiles = tiles
	node.drop = "myfences:v_fence_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:v_fence_gate_"..color, node)

	local node = table.copy(node_v_fence_gate_open)
	node.description = desc.." V Gate Open"
	node.tiles = tiles
	node.drop = "myfences:v_fence_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:v_fence_gate_open_"..color, node)
end

core.register_craft({
	output = "myfences:v_fence",
	recipe = {
		{"default:wood","","default:wood"},
		{"myfences:board","","myfences:board"},
		{"default:wood","myfences:board","default:wood"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:v_fence_corner",
	recipe = {"myfences:v_fence","myfences:v_fence"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:v_fence_gate",
	recipe = {"myfences:v_fence","default:steel_ingot"},
})

