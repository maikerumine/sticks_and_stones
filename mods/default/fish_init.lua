-----------------------------------------------------------------------------------------------
local title		= "Fishing - Crabman77's version"
local version 	= "0.0.3"
local mname		= "fishing"
-----------------------------------------------------------------------------------------------
-- original by wulfsdad (http://forum.minetest.net/viewtopic.php?id=4375)
-- rewrited by Mossmanikin (https://forum.minetest.net/viewtopic.php?id=6480)
-- this version rewrited by Crabman77
-- License (code & textures): 	WTFPL
-- Contains code from: 		animal_clownfish, animal_fish_blue_white, fishing (original), stoneage
-- Looked at code from:		default, farming
-- Dependencies: 			default
-- Supports:				animal_clownfish, animal_fish_blue_white, animal_rat, mobs
-----------------------------------------------------------------------------------------------

minetest.log("action","[mod fishing] Loading...")
local path = minetest.get_modpath("default").."/"

default_setting = {}
default_setting.func = {}
default_setting.is_creative_mode = minetest.setting_getbool("creative_mode")
default_setting.file_settings = minetest.get_worldpath() .. "/default_config.txt"
default_setting.file_trophies = minetest.get_worldpath() .. "/default_fish_trophies.txt"
default_setting.file_contest = minetest.get_worldpath() .. "/default_fish_contest.txt"
default_setting.settings = {}
default_setting.contest = {}
--for random object
random_objects = {}
default_setting.baits = {}
default_setting.hungry = {}
default_setting.prizes = {}
default_setting.trophies = {}

if (minetest.get_modpath("intllib")) then
  dofile(minetest.get_modpath("intllib").."/intllib.lua")
  default_setting.func.S = intllib.Getter(minetest.get_current_modname())
else
  default_setting.func.S = function ( s ) return s end
end

dofile(path .."settings.txt")
dofile(path .."fish_functions.lua")

--default_settings
default_setting.settings["message"] = MESSAGES
default_setting.settings["worm_is_mob"] = WORM_IS_MOB
default_setting.settings["worm_chance"] = WORM_CHANCE
default_setting.settings["new_worm_source"] = NEW_WORM_SOURCE
default_setting.settings["wear_out"] = WEAR_OUT
default_setting.settings["simple_deco_fishing_pole"] = SIMPLE_DECO_FISHING_POLE
default_setting.settings["bobber_view_range"] = BOBBER_VIEW_RANGE
default_setting.settings["fish_chance"] = FISH_CHANCE
default_setting.settings["shark_chance"] = SHARK_CHANCE
default_setting.settings["treasure_chance"] = TREASURE_CHANCE
default_setting.settings["treasure_enable"] = TREASURE_RANDOM_ENABLE
default_setting.settings["escape_chance"] = ESCAPE_CHANCE

-- load config file if exist in worldpath
default_setting.func.load()

dofile(path .."fish_worms.lua")
dofile(path .."fish_crafting.lua")
dofile(path .."fish_baits.lua")
dofile(path .."fish_prizes.lua")
dofile(path .."fish_baitball.lua")
dofile(path .."fish_bobber.lua")
dofile(path .."fish_bobber_shark.lua")
dofile(path .."fish_fishes.lua")
dofile(path .."fish_trophies.lua")
dofile(path .."fish_poles.lua")

--random hungry bait
default_setting.func.hungry_random()
--load table caught fish by players
default_setting.func.load_trophies()
--load table contest
default_setting.func.load_contest()
default_setting.func.tick()

-----------------------------------------------------------------------------------------------
minetest.log("action", "[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------

--[[

## Minetest Fishing Mod    

### Original by Mossmanikin https://github.com/Mossmanikin/fishing  
### Rewrited by Crabman77  

###9 fish type
**fish in rivers** 
> - 2 small fish (fish, carp)  
> - 3 predator fish (perch, catfish, Northern Pike)  

**fish in sea**
>- 3 small fish (clownfish,bluewhite fish, exotic fish)  
> - 1 predator fish (small shark)  


3 kind of bait for small fish (corn, bread, worm)  
4 kind of bait for predator fish (small fish)  
2 poles, wood 30 uses and mithril 1500 uses  
The baits have a variable luck(15% to 80%) changed between 30 minutes to 6 hours for a better gameplay  
Baitball improves lucky bait of 20%  

###**Contest Game **  
Contest game can be launched by admin, duration variable 2min to 4heures  
Start/End is announced in chat and sound  
A ranking appears(formspec) after contest  

Adjustable settings in formspec  
if the unified_inventory mod is actived there is a button for classification or settings for the admin only  


[demo video youtube](https://youtu.be/8rt8g3F2Gmk)  


![fishing]( http://nsm08.casimages.com/img/2015/07/01/1507010157379539613411965.png)

####Trophy and fish type
![fishing]( http://nsm08.casimages.com/img/2015/09/26//1509260649029539613611795.jpg)
####  Admin can look bait chance
![fishing]( http://nsm08.casimages.com/img/2015/09/26//1509260648599539613611793.jpg)
### admin menu 
![fishing]( http://nsm08.casimages.com/img/2015/09/26//1509260649019539613611794.jpg)

![fishing]( http://nsm08.casimages.com/img/2015/07/01//1507010157389539613411968.png)

![fishing]( http://nsm08.casimages.com/img/2015/07/01//1507010157379539613411966.png)
####formspec  contest ranking
![fishing]( http://nsm08.casimages.com/img/2015/09/26//1509260648579539613611792.jpg)
]]
