local paintables = {
	"myfences:corner_post", 
	"myfences:picket", "myfences:picket_corner", "myfences:picket_gate", "myfences:picket_gate_open", 
	"myfences:picketb", "myfences:picketb_corner","myfences:picketb_gate","myfences:picketb_gate_open",
	"myfences:garden", "myfences:garden_corner", "myfences:garden_gate", "myfences:garden_gate_open", 
	"myfences:garden2", "myfences:garden2_corner", "myfences:garden2_gate", "myfences:garden2_gate_open", 
	"myfences:privacy", "myfences:privacy_corner", "myfences:privacy_gate", "myfences:privacy_gate_open",
	"myfences:privacy_with_lattice", "myfences:privacy_with_lattice_corner", "myfences:privacy_with_lattice_gate", "myfences:privacy_with_lattice_gate_open",
	"myfences:stick", "myfences:stick_corner", "myfences:stick_gate", "myfences:stick_gate_open", 
	"myfences:short", "myfences:short_corner", "myfences:short_gate", "myfences:short_gate_open", 
	"myfences:short2", "myfences:short2_corner", "myfences:short2_gate", "myfences:short2_gate_open",
	"myfences:decorative", "myfences:decorative_corner", "myfences:decorative_gate", "myfences:decorative_gate_open",
	"myfences:neighbor", "myfences:neighbor_corner", "myfences:neighbor_gate", "myfences:neighbor_gate_open",
	"myfences:v_fence", "myfences:v_fence_corner", "myfences:v_fence_gate", "myfences:v_fence_gate_open",
}

local colors = {}
for _, entry in ipairs(myfences.colors) do
	table.insert(colors, entry[1])
end

mypaint.register(paintables, colors)

