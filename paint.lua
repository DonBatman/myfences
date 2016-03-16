myfences_paint = none
local paintcount = 0
local colors = {
			{"Red","red"},
			{"Green","green"},
			{"White","white"},
			}
for i in ipairs(colors) do
	local des = colors[i][1]
	local col = colors[i][2]

for nu = 1,4 do
	local num = nu


minetest.register_tool("myfences:fence_brush", {
	description = "Fence Brush",
	inventory_image = "myfences_paint_brush.png",
	on_use = function(itemstack, user, pointed_thing)

	if pointed_thing.type ~= "node" then
		return
	end
	
	local pos = pointed_thing.under
	local node = minetest.get_node(pos)
	
	if node.name == "myfences:paint_green" then
		myfences_paint = "green"
		paintcount = 3
	elseif node.name == "myfences:paint_red" then
		myfences_paint = "red"
		paintcount = 3
	elseif node.name == "myfences:paint_white" then
		myfences_paint = "white"
		paintcount = 3
	end
	if myfences_paint == nil then
		return
	end
	if paintcount ~= 0 then

		if node.name == "myfences:corner_post_wood"  or
			node.name == "myfences:corner_post_red_wood"  or
			node.name == "myfences:corner_post_white_wood"  or
			node.name == "myfences:corner_post_green_wood"  then
			minetest.set_node(pos,{name = "myfences:corner_post_"..myfences_paint.."_wood", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_picket_wood"  or
			node.name == "myfences:fence_picket_red_wood"  or
			node.name == "myfences:fence_picket_white_wood"  or
			node.name == "myfences:fence_picket_green_wood"  then
			minetest.set_node(pos,{name = "myfences:fence_picket_"..myfences_paint.."_wood", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_picket_wood_corner"  or
			node.name == "myfences:fence_picket_red_wood_corner"  or
			node.name == "myfences:fence_picket_white_wood_corner"  or
			node.name == "myfences:fence_picket_green_wood_corner"  then
			minetest.set_node(pos,{name = "myfences:fence_picket_"..myfences_paint.."_wood_corner", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_picketb_wood"  or
			node.name == "myfences:fence_picketb_red_wood"  or
			node.name == "myfences:fence_picketb_white_wood"  or
			node.name == "myfences:fence_picketb_green_wood"  then
			minetest.set_node(pos,{name = "myfences:fence_picketb_"..myfences_paint.."_wood", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_picketb_wood_corner"  or
			node.name == "myfences:fence_picketb_red_wood_corner"  or
			node.name == "myfences:fence_picketb_white_wood_corner"  or
			node.name == "myfences:fence_picketb_green_wood_corner"  then
			minetest.set_node(pos,{name = "myfences:fence_picketb_"..myfences_paint.."_wood_corner", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_garden_wood"  or
			node.name == "myfences:fence_garden_red_wood"  or
			node.name == "myfences:fence_garden_white_wood"  or
			node.name == "myfences:fence_garden_green_wood"  then
			minetest.set_node(pos,{name = "myfences:fence_garden_"..myfences_paint.."_wood", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_garden_wood_corner"  or
			node.name == "myfences:fence_garden_red_wood_corner"  or
			node.name == "myfences:fence_garden_white_wood_corner"  or
			node.name == "myfences:fence_garden_green_wood_corner"  then
			minetest.set_node(pos,{name = "myfences:fence_garden_"..myfences_paint.."_wood_corner", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_privacy_wood"  or
			node.name == "myfences:fence_privacy_red_wood"  or
			node.name == "myfences:fence_privacy_white_wood"  or
			node.name == "myfences:fence_privacy_green_wood"  then
			minetest.set_node(pos,{name = "myfences:fence_privacy_"..myfences_paint.."_wood", param2=node.param2})
			paintcount = paintcount - 1
		end
		
		if node.name == "myfences:fence_privacy_wood_corner"  or
			node.name == "myfences:fence_privacy_red_wood_corner"  or
			node.name == "myfences:fence_privacy_white_wood_corner"  or
			node.name == "myfences:fence_privacy_green_wood_corner"  then
			minetest.set_node(pos,{name = "myfences:fence_privacy_"..myfences_paint.."_wood_corner", param2=node.param2})
			paintcount = paintcount - 1
		end
	end
end
})
minetest.register_node("myfences:paint_"..col, {
	description = des.." Paint",
	drawtype = "mesh",
	paramtype = "light",
	mesh = "myfences_can.obj",
	tiles = {"myfences_paint_"..col..".png"},
	groups = {oddly_breakable_by_hand = 1},
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
		output = 'myfences:fence_brush',
		recipe = {
			{'myfences:paint_brush_bristles'},
			{'group:stick'},
		}
})

	
	
