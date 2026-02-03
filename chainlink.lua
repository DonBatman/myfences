local net1 = {
	type = "fixed",
	fixed = {-0.5, -0.5, 0.45, 0.5, 0.5, 0.5}}

for n = 1,16 do

core.register_node("myfences:chainlink_"..n,{
	description = "Chainlink Fence "..n,
	tiles = {"default_clay.png"},
	drawtype = "mesh",
	mesh = "myfences_"..n..".obj",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, crumbly = 3, oddly_breakable_by_hand = 3, not_in_creative_inventory=0},
	selection_box = net1,
	collision_box = net1,
	on_place = core.rotate_node
})
end
