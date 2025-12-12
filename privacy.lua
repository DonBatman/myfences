local node_privacy = {
	description = "Privacy Fence",
	drawtype = "mesh",
	mesh = "myfences_privacy.obj",
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
core.register_node("myfences:privacy", node_privacy)

local node_privacy_corner = {
	description = "Privacy Fence Corner",
	drawtype = "mesh",
	mesh = "myfences_privacy_corner.obj",
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
core.register_node("myfences:privacy_corner", node_privacy_corner)

for _, entry in ipairs(myfences.colors) do
	local color = entry[1]
	local desc = entry[2]
	local stain = "^(myfences_color.png^[colorize:#"..entry[3]..":175)"

	local tiles = {
		"myfences_wood.png"..stain,
	}

local node_privacy_gate = {
	description = "Privacy Gate",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_privacy.obj",
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
		if node.name == "myfences:privacy_gate_"..color then
			core.set_node(pos, {name="myfences:privacy_gate_open_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:privacy_gate_open",  param2=p2})
		end
	end
}
core.register_node("myfences:privacy_gate", node_privacy_gate)

local node_privacy_gate_open = {
	description = "Privacy Gate Open",
	tiles = {
		"myfences_wood.png",
		},
	drawtype = "mesh",
	mesh = "myfences_privacy_gate_open.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	drops = "myfences:privacy_gate",
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
		if node.name == "myfences:privacy_gate_open_"..color then
			core.set_node(pos, {name="myfences:privacy_gate_"..color,  param2=p2})
		else
			core.set_node(pos, {name="myfences:privacy_gate",  param2=p2})
		end
	end
}
core.register_node("myfences:privacy_gate_open", node_privacy_gate_open)

	local node = table.copy(node_privacy)
	node.description = desc.." Privacy Fence"
	node.tiles = tiles
	node.drop = "myfences:privacy"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_"..color, node)

	node = table.copy(node_privacy_corner)
	node.description = desc.." Privacy Fence Corner"
	node.tiles = tiles
	node.drop = "myfences:privacy_corner"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_corner_"..color, node)

	local node = table.copy(node_privacy_gate)
	node.description = desc.." Privacy Gate"
	node.tiles = tiles
	node.drop = "myfences:privacy_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_gate_"..color, node)

	local node = table.copy(node_privacy_gate_open)
	node.description = desc.." Privacy Gate Open"
	node.tiles = tiles
	node.drop = "myfences:privacy_gate"
	node.groups.not_in_creative_inventory = 1
	core.register_node("myfences:privacy_gate_open_"..color, node)
end

core.register_craft({
	output = "myfences:privacy",
	recipe = {
		{"","",""},
		{"default:wood","myfences:board","myfences:board"},
		{"default:wood","myfences:board","myfences:board"},
	}
})
core.register_craft({
	type = "shapeless",
	output = "myfences:privacy_corner",
	recipe = {"myfences:privacy","myfences:privacy"},
})
core.register_craft({
	type = "shapeless",
	output = "myfences:privacy_gate",
	recipe = {"myfences:privacy","default:steel_ingot"},
})


