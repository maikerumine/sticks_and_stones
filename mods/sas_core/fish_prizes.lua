
default_setting.prizes["rivers"] = {}
default_setting.prizes["rivers"]["little"] = {
	{"sas_core",  				"fish_raw",				0,			"a Fish."},
	{"sas_core",  				"carp_raw",				0,			"a Carp."},
}

default_setting.prizes["rivers"]["big"] = {
	{"sas_core",  				"pike_raw",				0,			"a Northern Pike."},
	{"sas_core",  				"perch_raw",			0,			"a Perch."},
	{"sas_core",  				"catfish_raw",			0,			"a Catfish."},
}


default_setting.prizes["sea"] = {}
default_setting.prizes["sea"]["little"] = {
	{"sas_core",  				"clownfish_raw",		0,			"a Clownfish."},
	{"sas_core",  				"bluewhite_raw",		0,			"a Bluewhite."},
	{"sas_core",  				"exoticfish_raw",		0,			"a Exoticfish."},
}

default_setting.prizes["sea"]["big"] = {
	{"sas_core",  				"shark_raw",			0,			"a small Shark."},
}



local stuff = {
--	 mod 						item						wear				message ("You caught "..)		nrmin  		chance (1/67)
	{"flowers",					"seaweed",					0,					"some Seaweed.",				1,			5},
	{"sas_core",					"cord",					0,					"a String.",					6,			5},
	{"sas_core",					"twig_1",					0,					"a Twig.",						11,			5},
	{"mobs",					"tropical",						0,					"a tropical.",						16,			5},
	{"mobs",					"clownfish",						0,					"a clownfish.",						16,			5},
	{"mobs",					"tropical",						0,					"a tropical.",						16,			5},
	{"mobs",					"turtle",						0,					"a turtle.",						16,			5},
	{"default",					"stick",					0,					"a Twig.",						21,			5},
--	{"seaplants",				"kelpgreen",				0,					"a Green Kelp.",				26,			5},
	{"3d_armor",				"boots_steel",				"random",			"some very old Boots.",			31,			2},
	{"3d_armor",				"leggings_fabric",			"random",			"some very old Leggings.",		33,			5},
	{"3d_armor",				"chestplate_wood",		"random",			"a very old ChestPlate.",		38,			5},
	{"sas_core",					"pole_wood",				"randomtools",		"an old Fishing Pole.",			43,			10},
	{"3d_armor",				"boots_wood",				"random",			"some very old Boots.",			53,			5},
--	{"maptools",				"gold_coin",				0,					"a Gold Coin.",					58,			1},
	{"3d_armor",				"helmet_cloth",			"random",			"a very old Helmet.",			59,			1},
	{"shields",					"shield_wood",	"random",			"a very old Shield.",			60,			2},
	{"sas_core",					"sword_steel",				"random",			"a very old Sword.",			62,			2},
	{"default",					"tool_pick_iron",				"random",			"a very old pick.",			64,			2},
--	{"default",					"sword_nyan",				"random",			"a very old Sword.",			66,			2},
--	nom mod						nom item					durabilité 			message dans le chat		 				-- fin 67
--															de l'objet
}
default_setting.prizes["stuff"] = default_setting.func.ignore_mod(stuff)


local treasure = {
	{"default",					"mese",						0,					"a mese block."},
	{"default",					"nyancat",					0,					"a Nyan Cat."},
	{"default",					"diamondblock",				0,					"a Diamond Block."},
}
default_setting.prizes["treasure"] = default_setting.func.ignore_mod(treasure)

