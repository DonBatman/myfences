myfences_paint = nil
local paintcount = 0
local uses = 500
for _, entry in ipairs(myfences.colors) do
	local col = entry[1]
	local des = entry[2]

for nu = 1,4 do
	local num = nu

local brushes = {"empty","red","green","white"}
for i, brush in pairs(brushes) do
local brush = brushes[i]
minetest.register_tool("myfences:brush_"..brush, {
	description = "Fence Brush",
	inventory_image = "myfences_paint_brush_"..brush..".png",
	on_use = function(itemstack, user, pointed_thing)

	if pointed_thing.type ~= "node" then
		return
	end
	local wear = itemstack:get_wear()
	local pos = pointed_thing.under
	local node = minetest.get_node(pos)
	
	if node.name == "myfences:paint_green" then
		myfences_paint = "green"
		paintcount = 3
		itemstack:take_item()
		itemstack:add_item("myfences:brush_green")
		itemstack:set_wear(wear)
		
	elseif node.name == "myfences:paint_red" then
		myfences_paint = "red"
		paintcount = 3
		itemstack:take_item()
		itemstack:add_item("myfences:brush_red")
		itemstack:set_wear(wear)
	elseif node.name == "myfences:paint_white" then
		myfences_paint = "white"
		paintcount = 3
		itemstack:take_item()
		itemstack:add_item("myfences:brush_white")
		itemstack:set_wear(wear)
	end
	if myfences_paint == nil then
		return
	end
	if paintcount ~= 0 and
		string.find(node.name,brush) == nil then

		if node.name == "myfences:corner_post_wood"  or
			node.name == "myfences:corner_post_wood_red"  or
			node.name == "myfences:corner_post_wood_white"  or
			node.name == "myfences:corner_post_wood_green"  then
			minetest.set_node(pos,{name = "myfences:corner_post_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
			itemstack:add_wear(65535 / (uses - 1))
		end
		
		if node.name == "myfences:picket_wood"  or
			node.name == "myfences:picket_red_wood"  or
			node.name == "myfences:picket_wood_white"  or
			node.name == "myfences:picket_wood_green"  then
			minetest.set_node(pos,{name = "myfences:picket_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:picket_corner_wood"  or
			node.name == "myfences:picket_corner_wood_red"  or
			node.name == "myfences:picket_corner_wood_white"  or
			node.name == "myfences:picket_corner_wood_green"  then
			minetest.set_node(pos,{name = "myfences:picket_corner_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:picketb_wood"  or
			node.name == "myfences:picketb_wood_red"  or
			node.name == "myfences:picketb_wood_white"  or
			node.name == "myfences:picketb_wood_green"  then
			minetest.set_node(pos,{name = "myfences:picketb_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:picketb_corner_wood"  or
			node.name == "myfences:picketb_corner_wood_red"  or
			node.name == "myfences:picketb_corner_wood_white"  or
			node.name == "myfences:picketb_corner_wood_green"  then
			minetest.set_node(pos,{name = "myfences:picketb_corner_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:garden_wood"  or
			node.name == "myfences:garden_wood_red"  or
			node.name == "myfences:garden_wood_white"  or
			node.name == "myfences:garden_wood_green"  then
			minetest.set_node(pos,{name = "myfences:garden_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:garden_corner_wood"  or
			node.name == "myfences:garden_corner_wood_red"  or
			node.name == "myfences:garden_corner_wood_white"  or
			node.name == "myfences:garden_corner_wood_green"  then
			minetest.set_node(pos,{name = "myfences:garden_corner_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:privacy_wood"  or
			node.name == "myfences:privacy_wood_red"  or
			node.name == "myfences:privacy_wood_white"  or
			node.name == "myfences:privacy_wood_green"  then
			minetest.set_node(pos,{name = "myfences:privacy_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:privacy_corner_wood"  or
			node.name == "myfences:privacy_corner_wood_red"  or
			node.name == "myfences:privacy_corner_wood_white"  or
			node.name == "myfences:privacy_corner_wood_green"  then
			minetest.set_node(pos,{name = "myfences:privacy_corner_wood_"..myfences_paint, param2=node.param2})
			paintcount = paintcount - 1
		end
		if paintcount == 0 then
		itemstack:take_item()
		itemstack:add_item("myfences:brush_empty")
		itemstack:set_wear(wear)
		end
	if not minetest.setting_getbool("creative_mode") then
		itemstack:add_wear(65535 / (uses - 1))
	end
	return itemstack
	end
end
})
end
minetest.register_node("myfences:paint_"..col, {
	description = des.." Paint",
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

	
	
