myfences = {}
myfences.colors = {
	{"black",      "Black",      "000000"},
	{"blue",       "Blue",       "2000c9"},
	{"brown",      "Brown",      "954c05"},
	{"cyan",       "Cyan",       "01ffd8"},
	{"darkgreen", "Dark Green",  "005b07"},
	{"darkgrey",  "Dark Grey",   "303030"},
	{"green",      "Green",      "61ff01"},
	{"grey",       "Grey",       "5b5b5b"},
	{"magenta",    "Magenta",    "ff05bb"},
	{"orange",     "Orange",     "ff8401"},
	{"pink",       "Pink",       "ff65b5"},
	{"red",        "Red",        "ff0000"},
	{"violet",     "Violet",     "ab23b0"},
	{"white",      "White",      "ffffff"},
	{"yellow",     "Yellow",     "e3ff00"},
}

dofile(minetest.get_modpath("myfences").."/picket.lua")
dofile(minetest.get_modpath("myfences").."/privacy.lua")
dofile(minetest.get_modpath("myfences").."/garden.lua")
dofile(minetest.get_modpath("myfences").."/post.lua")
dofile(minetest.get_modpath("myfences").."/stick.lua")
dofile(minetest.get_modpath("myfences").."/short.lua")
if mypaint ~= nil then
	dofile(minetest.get_modpath("myfences").."/paint.lua")
end

minetest.register_craftitem("myfences:board", {
	description = "Default Board",
	inventory_image = "myfences_board.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "myfences:board 4",
	recipe = {"group:wood","group:wood"},
})
