local BRUSH_USES = 3
local CAN_USES = 100

function check_paintcan(pos, node)
	local name = string.sub(node.name, 10)
	if string.sub(name, 1, 6) ~= "paint_" then
		return
	end
	local color = string.sub(name, 7)
	local meta = minetest.get_meta(pos)
	local uses = meta:get_int("myfences:uses") - 1
	meta:set_int("myfences:uses", uses)
	local info = meta:get_string("infotext")
	info = string.gsub(info, "%(.*%)", "("..uses.." uses)")
	meta:set_string("infotext", info)
	if uses <= 0 then
		minetest.dig_node(pos)
	end
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
				local wear = itemstack:get_wear() + 65535 / BRUSH_USES
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
		if string.sub(node.name, 1, 9) ~= "myfences:" then
			return
		end
		return check_paintcan(pos, node)
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
			if string.sub(node.name, 1, 9) ~= "myfences:" then
				return
			end
			local ret = check_paintcan(pos, node)
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
	drop = "",
	groups = {oddly_breakable_by_hand = 3, dig_immediate = 3, not_in_creative_inventory = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0., 0.25}, 
		}
	},
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if not digger then
			return
		end
		local inv = digger:get_inventory()
		if not inv then
			return
		end
		local itemstack = ItemStack("myfences:paintcan_"..col)
		local uses = tonumber(oldmetadata.fields["myfences:uses"])
		if uses <= 0 then
			return
		end
		itemstack:set_wear((CAN_USES - uses) * (65535 / CAN_USES))
		if inv:room_for_item("main", itemstack) then
			inv:add_item("main", itemstack)
		else
			minetest.add_item(pos, itemstack)
		end
	end
})

	minetest.register_tool("myfences:paintcan_"..col, {
		description = desc.." Paint",
		inventory_image = "myfences_paint_can_"..col..".png",
		on_place = function(itemstack, user, pointed_thing)
			local pname = "myfences:paint_"..col
			local paint = ItemStack(pname)
			paint = minetest.item_place_node(paint, user, pointed_thing)
			if not paint or (paint:get_count() > 0) then
				return
			end
			local pos = pointed_thing.under
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			if node.name ~= pname or (meta:get_int("myfences:uses") > 0) then
				pos = pointed_thing.above
				node = minetest.get_node(pos)
				meta = minetest.get_meta(pos)
				if node.name ~= pname or (meta:get_int("myfences:uses") > 0) then
					return
				end
			end
			local uses = math.floor(CAN_USES - itemstack:get_wear() / (65535 / CAN_USES))
			meta:set_int("myfences:uses", uses)
			meta:set_string("infotext", desc.." Paint ("..uses.." uses)")
			itemstack:take_item()
			return itemstack
		end
	})

	minetest.register_craft({
		output = "myfences:paintcan_"..col,
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

