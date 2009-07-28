import libqtile

m4    = "mod4"
spawm = "spawn"
K  = libqtile.Key
C  = libqtile.command.Call

keys = [
	K( [m4],"w",
		C( spawn,"opera --notrayicon -private -nomail -nolirc")),

	K( [m4],"p",
		C( spawn,"dmenu_path | dmenu_run -nb white -nf black -sb goldenrod1 -sf black")),

	K( [m4], "m",
		C( spawn,"pidgin")),

	K( [m4], "n",
		C( spawn,"nicotine"))
	]

