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

if core.get_modpath("mydye") then
	myfences.colors = {
	{"black",      	"Black",      		"000000"},
	{"blue",       	"Blue",       		"2000c9"},
	{"brown",     	"Brown",      		"954c05"},
	{"cyan",      	"Cyan",       		"01ffd8"},
	{"darkgreen", 	"Dark Green",  		"005b07"},
	{"darkgrey",  	"Dark Grey",   		"303030"},
	{"green",     	"Green",      		"61ff01"},
	{"grey",       	"Grey",       		"5b5b5b"},
	{"magenta",    	"Magenta",    		"ff05bb"},
	{"orange",     	"Orange",     		"ff8401"},
	{"pink",      	"Pink",       		"ff65b5"},
	{"red",        	"Red",        		"ff0000"},
	{"violet",     	"Violet",     		"ab23b0"},
	{"white",      	"White",      		"ffffff"},
	{"yellow",     	"Yellow",     		"e3ff00"},
	{"peachpuff",	"Peachpuff", 		"FFDAB9"},
	{"navy",		"Navy", 			"000080"},
	{"coral",		"Coral", 			"FF7F50"},
	{"khaki",		"Khaki", 			"F0E68C"},
	{"lime",		"Lime", 			"00FF00"},
	{"light_pink",	"Light Pink", 		"FFB6C1"},
	{"light_grey",	"Light Grey", 		"D3D3D3"},
	{"purple",		"Purple", 			"800080"},
	{"maroon",		"Maroon", 			"800000"},
	{"aquamarine",	"Aqua Marine", 		"7FFFD4"},
	{"chocolate",	"Chocolate", 		"D2691E"},
	{"crimson",		"Crimson", 			"DC143C"},
	{"olive",		"Olive", 			"808000"},
	{"white_smoke",	"White Smoke", 		"F5F5F5"},
	{"mistyrose",	"Misty Rose", 		"FFE4E1"},
	{"orchid",		"Orchid", 			"DA70D6"},
	}
end

dofile(core.get_modpath("myfences").."/picket.lua")
dofile(core.get_modpath("myfences").."/privacy.lua")
dofile(core.get_modpath("myfences").."/garden.lua")
dofile(core.get_modpath("myfences").."/garden2.lua")
dofile(core.get_modpath("myfences").."/post.lua")
dofile(core.get_modpath("myfences").."/stick.lua")
dofile(core.get_modpath("myfences").."/short.lua")
dofile(core.get_modpath("myfences").."/short2.lua")
dofile(core.get_modpath("myfences").."/decorative.lua")
dofile(core.get_modpath("myfences").."/neighbor.lua")
dofile(core.get_modpath("myfences").."/privacy_with_lattice.lua")
if mypaint ~= nil then
	dofile(core.get_modpath("myfences").."/paint.lua")
end

core.register_craftitem("myfences:board", {
	description = "Default Board",
	inventory_image = "myfences_board.png",
})
core.register_craft({
	type = "shapeless",
	output = "myfences:board 4",
	recipe = {"group:wood","group:wood"},
})
