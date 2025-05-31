	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FLassText:
	text "Heb je de #-" ; "Did you meet the"
	line "MANIAK ontmoet?" ; "#MANIAC?"

	para "Hij schept altijd" ; "He's always brag-"
	line "op over zijn zeld-" ; "ging about his"
	cont "zame #MON." ; "rare #MON."
	done

CianwoodGymGuideText:
	text "De #MON-GYM-" ; "The #MON GYM"
	line "trainers hier zijn" ; "trainers here are"
	cont "macho-pestkoppen." ; "macho bullies."

para "Als ik daar rond-" ; "If I stick around,"
	line "hang, komen ze" ; "they might come"
	cont "me pesten." ; "after me."

	para "Hier is wat" ; "Here's some ad-"
	line "advies: de GYM-" ; "vice: the GYM"

	para "LEIDER gebruikt" ; "LEADER uses the"
	line "het vecht-type." ; "fighting-type."

	para "Je kan hem dus" ; "So you should"
	line "verrassen met psy-" ; "confound him with"
	cont "chische #MON." ; "psychic #MON."

	para "Versla z'n #MON" ; "Wipe out his #-"
	line "voordat ze hun" ; "MON before they"

	para "fysieke kracht" ; "can use their"
	line "kunnen gebruiken." ; "physical strength."
	done

CianwoodGymGuideWinText:
	text "<PLAYER>! Je won!" ; "<PLAYER>! You won!"
	line "Ik zie het aan je" ; "I could tell by"
	cont "gezicht!" ; "looking at you!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
