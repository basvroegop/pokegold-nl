	object_const_def
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "SURGE: Hey, little"
	line "boy!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #MON,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done

LtSurgeWinLossText:
	text "SURGE: Arrrgh!"
	line "You are strong!"

	para "OK, boy. You get"
	line "THUNDERBADGE!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> receives"
	line "DONDERBADGE" ; "THUNDERBADGE."
	done

LtSurgeThunderBadgeText:
	text "SURGE: DONDER-" ; "SURGE: THUNDER-"
	line "BADGE maakt jouw" ; "BADGE increases"
	cont "#MON sneller." ; "#MON's speed. "

	para "Het is bewijs dat" ; "Consider it proof"
	line "je me versloeg." ; "that you defeated"

	para "Draag hem met" ; "me. You wear it"
	line "trots, oké?" ; "proudly, hear?"
	done

LtSurgeFightDoneText:
	text "SURGE: Hey, boy!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #MON and I"
	line "are still at it!"
	done

GentlemanGregorySeenText:
	text "Ben je hier om LT." ; "You're here to"
	line "SURGE te verslaan?" ; "defeat LT.SURGE?"

	para "Niet als ik er" ; "Not if I can help"
	line "iets aan kan doen!" ; "it!"
	done

GentlemanGregoryBeatenText:
	text "Sorry, ik heb u" ; "Sorry I failed"
	line "teleurgesteld, LT." ; "you, LT.SURGE,"
	cont "SURGE!" ; "sir!"
	done

GentlemanGregoryAfterBattleText:
	text "Toen ik nog in het" ; "When I was still"
	line "leger zat, heeft" ; "in the army, LT."

	para "LT.SURGE mijn" ;  "SURGE saved my"
	line "leven gered." ; "life."
	done

GuitaristVincentSeenText:
	text "LT.SURGE herkent" ; "LT.SURGE recog-"
	line "mijn potentie met" ; "nized my potential"

	para "elektrische #-." ; "with electric"
	line "MON. Denk jij dat" ; "#MON."

	para "je mij kan" ; "Think you can beat"
	line "verslaan?" ; "me?"
	done

GuitaristVincentBeatenText:
	text "Oh, wat een schok!" ; "Ooh, how shocking!"
	done

GuitaristVincentAfterBattleText:
	text "Als de vallen hier" ; "If the GYM's traps"
	line "werkten, zou je" ; "were working, you"

	para "echt de sjaak" ; "would have been"
	line "geweest zijn…" ; "toast…"
	done

JugglerHortonSeenText:
	text "Ik ga je verslaan!" ; "I'm going to take"
	line "Bereid je voor op" ; "you down! Prepare"
	cont "een schok!" ; "to be shocked!"
	done

JugglerHortonBeatenText:
	text "Gwaaah! Ik ben" ; "Gwaaah!"
	line "overweldigd…" ; "I was overpowered…"
	done

JugglerHortonAfterBattleText:
	text "Wen maar niet aan" ; "Don't get too com-"
	line "deze winst…" ; "fortable about"

	para "LT.SURGE is een" ; "beating me…"
	line "taaie." ; "LT.SURGE is tough."
	done

VermilionGymGuideText:
	text "Yo! KAMPIOEN in" ; "Yo! CHAMP in"
	line "de maak!" ; "making!"

	para "Dit keer heb" ; "You lucked out"
	line "je mazzel." ; "this time."

	para "LT.SURGE is een" ; "LT.SURGE is very"
	line "voorzichtige. Hij" ; "cautious. He has"

	para "heeft door de hele" ; "traps set all over"
	line "GYM vallen gezet" ; "the GYM."

	para "Maar--he-heh--de" ; "But--he-heh--the"
	line "vallen zijn nu" ; "traps aren't"
	cont "niet actief." ; "active right now."

	para "Je kan zonder" ; "You'll have no"
	line "problemen bij" ; "problem getting to"
	cont "LT. SURGE komen." ; "LT.SURGE."
	done

VermilionGymGuideWinText:
	text "Pfoei! Dat was een" ; "Whew! That was an"
	line "spannend gevecht" ; "electrifying bout!"

	para "Ik werd er een"; "It sure made me"
	line "beetje nerveus van" ; "nervous."
	done

VermilionGymTrashCanText:
	text "Nee! Hier ligt" ; "Nope! Nothing here"
	line "alleen maar afval" ; "but trash."
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
