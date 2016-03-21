myfences = {}
myfences.colors = {
	{"red", "Red", "842800"},
	{"green", "Green", "0c4916"},
	{"white", "White", "ffffff"},
}

dofile(minetest.get_modpath("myfences").."/picket.lua")
dofile(minetest.get_modpath("myfences").."/privacy.lua")
dofile(minetest.get_modpath("myfences").."/garden.lua")
dofile(minetest.get_modpath("myfences").."/post.lua")
dofile(minetest.get_modpath("myfences").."/paint.lua")

minetest.register_craftitem("myfences:board", {
	description = "Default Board",
	inventory_image = "myfences_board.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "myfences:board 4",
	recipe = {"group:wood","group:wood"},
})
