	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER

EcruteakCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlypointCallback

EcruteakCityFlypointCallback:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText: ; unreferenced
	text "Oh, no. Oh, no…"

	para "My daughter is"
	line "missing."

	para "No… She couldn't"
	line "have gone to the"
	cont "BURNED TOWER."

	para "I told her not to"
	line "go near it…"

	para "People seem to"
	line "disappear there…"

	para "Oh, what should I"
	line "do…?"
	done

EcruteakCityGramps1Text:
	text "ECRUTEAK had vroe-"; "ECRUTEAK used to"
	line "ger twee torens:" ; "have two towers:"

	para "een in het oosten" ; "one each in the"
	line "en een in het" ; "east and west."
	cont "westen." ; 
	done

EcruteakCityGramps2Text:
	text "Ah, youngster."
	line "Have you learned"

	para "to dance like the"
	line "KIMONO GIRLS?"

	para "If you go to their"
	line "DANCE THEATER, an"

	para "odd old man will"
	line "give you something"
	cont "nice, I hear."
	done

EcruteakCityLass1Text:
	text "Ik ga oefenen" ; "I'm going to prac-"
	line "in het DANS-." ; "tice at the DANCE"

	para "THEATER. Zin om" ; "THEATER. Care to"
	line "mee te gaan?" ; "join me?"
	done

EcruteakCityLass2Text:
	text "That used to be a"
	line "much taller tower,"

	para "but it burned down"
	line "in a fire."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Drie grote #MON" ; "Three big #MON"
	line "renden weg in ver-" ; "ran off in differ-"
	cont "schillende rich-" ; "ent directions."
	cont "tingen. Wat waren" ; "What were they?"
	cont "ze?" ;
	done

EcruteakCityFisherText:
	text "Er is een gerucht" ; "I heard a rumor"
	line "over de SCHIJNENDE" ; "about OLIVINE"
	cont "VUURTOREN. De" ; "LIGHTHOUSE."

	para "#MON die dient" ; "The #MON that"
	line "als baken is ziek." ; "serves as the"

	para "Zo te horen" ; "beacon fell ill."
	line "zitten ze in" ; "Sounds like they"
	cont "de problemen." ; "are in trouble."
	done

EcruteakCityFisherText_JasmineReturned:
	text "De #MON in" ; "The #MON at"
	line "SCHIJNENDE VUUR-" ; "OLIVINE LIGHTHOUSE"
	cont "TOREN is genezen." ; "has been cured."

	para "Boten kunnen 's" ; "Boats can safely"
	line "nachts weer veilig" ; "sail out to sea at"
	cont "op zee varen." ; "night again."
	done

EcruteakCityYoungsterText:
	text "Ik hoorde dat" ; "I hear #MON are"
	line "#MON tekeer" ; "rampaging at the"

	para "gaan bij het MEER" ; "LAKE OF RAGE. I'd"
	line "VAN RAZERNIJ." ; "like to see that."
	done

EcruteakCitySignText:
	text "ECRUTEAK CITY" ; "ECRUTEAK CITY"
	line "Een Historische" ; "A Historical City"
	cont "Stad" ; 

	para "Waar het Verleden" ; "Where the Past"
	line "het Heden ontmoet" ; "Meets the Present"
	done

TinTowerSignText:
	text "TINTOREN" ; "TIN TOWER"

	para "Een legendarische" ; "A legendary #-"
	line "#MON zou hier" ; "MON is said to"
	cont "nestelen." ; "roost here."
	done

EcruteakGymSignText:
	text "ECRUTEAK CITY" ; "ECRUTEAK CITY"
	line "#MON-GYMLEIDER:" ; "#MON GYM"
	cont "MORTY" ; "LEADER: MORTY"

	para "De Mystieke" ; "The Mystic Seer of"
	line "Voorspeller van" ; "the Future"
	cont "de Toekomst" ;
	done

EcruteakDanceTheaterSignText:
	text "ECRUTEAK" ; "ECRUTEAK DANCE"
	line "DANSTHEATER" ; "THEATER"
	done

BurnedTowerSignText:
	text "VERBRANDE TOREN" ; "BURNED TOWER"

	para "Verwoest door" ; "It was destroyed"
	line "een mysterieuze" ; "by a mysterious"
	cont "brand." ; "fire."

	para "Houd afstand want" ; "Please stay away,"
	line "het is onveilig." ; "as it is unsafe."
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, ECRUTEAK_TIN_TOWER_BACK_ENTRANCE, 1
	warp_event 20,  3, ECRUTEAK_TIN_TOWER_BACK_ENTRANCE, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATER, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	def_object_events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
