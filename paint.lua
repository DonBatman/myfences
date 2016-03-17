local USES = 3

function check_paint(name)
	if string.sub(name, 1, 6) ~= "paint_" then
		return
	end
	local color = string.sub(name, 7)
	return ItemStack("myfences:brush_"..color)
end

local paintables = {
	"picket", "picket_corner", "picketb", "picketb_corner",
	"garden", "garden_corner", "privacy", "privacy_corner", "corner_post"
}

function paint_node(pos, node, col, itemstack)
	local s, e
	local nname = string.sub(node.name, 10)
	s, e = string.find(nname, "_[^_]+$")
	if s and e then
		local ncolor = string.sub(nname, s + 1, e)
		for _, entry in ipairs(myfences.colors) do
			local color = entry[1]
			if ncolor == color then
				if color == col then
					return
				end
				nname = string.sub(nname, 1, s - 1)
				break
			end
		end
	end

	for i, name in ipairs(paintables) do
		if nname == name then
			minetest.set_node(pos,{name = "myfences:"..name.."_"..col, param2 = node.param2})
			if not minetest.setting_getbool("creative_mode") then
				local wear = itemstack:get_wear() + 65535 / USES
				if wear < 65535 then
					itemstack:set_wear(wear)
				else
					itemstack = ItemStack("myfences:brush")
				end
			end
			return itemstack
		end
	end
end

minetest.register_tool("myfences:brush", {
	description = "Fence Brush",
	inventory_image = "myfences_paint_brush.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		local pos = pointed_thing.under
		local node = minetest.get_node(pos)
		local name = node.name
		if string.sub(name, 1, 9) ~= "myfences:" then
			return
		end
		name = string.sub(name, 10)
		return check_paint(name)
	end
})

for _, entry in ipairs(myfences.colors) do
	local col = entry[1]
	local desc = entry[2]

	minetest.register_tool("myfences:brush_"..col, {
		description = "Fence Brush ("..desc.." Paint)",
		inventory_image = "myfences_paint_brush_"..col..".png",
		on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end
			local pos = pointed_thing.under
			local node = minetest.get_node(pos)
			local name = node.name
			if string.sub(name, 1, 9) ~= "myfences:" then
				return
			end
			name = string.sub(name, 10)
			local ret = check_paint(name)
			if ret then
				return ret
			end
			return paint_node(pos, node, col, itemstack)
		end,
	})

minetest.register_node("myfences:paint_"..col, {
	description = desc.." Paint",
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	mesh = "myfences_can.obj",
	tiles = {"myfences_paint_"..col..".png"},
	stack_max = 1,
	groups = {oddly_breakable_by_hand = 3,dig_immediate = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0., 0.25}, 
		}
	},
})

minetest.register_craft({
		output = "myfences:paint_"..col,
		recipe = {
			{"bucket:bucket_water","dye:"..col}
		},
		replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
})
end

minetest.register_craftitem("myfences:paint_brush_bristles",{
	description = "Paint Brush Bristles",
	inventory_image = "myfences_paint_brush_bristles.png",
	stack_max = 1,

})
minetest.register_craft({
		output = 'myfences:paint_brush_bristles',
		recipe = {
			{'wool:white'},
		}
})
minetest.register_craft({
		output = 'myfences:brush',
		recipe = {
			{'myfences:paint_brush_bristles'},
			{'group:stick'},
		}
})

