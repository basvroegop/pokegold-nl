	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FMeetMomScene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoopScene,    SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FMeetMomScene:
	sdefer MeetMomScript
	end

PlayersHouse1FNoopScene:
	end

MeetMomScript:
	applymovement PLAYER, PlayersHouseDownstairsMovement
	playmusic MUSIC_MOM
	turnobject PLAYERSHOUSE1F_MOM1, UP
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	special RestartMapMusic
	end

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

PlayersHouseDownstairsMovement:
	step DOWN
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	step_end

MomWalksBackMovement:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>…! De" ; "Oh, <PLAYER>…! Our"
	line "buurman, PROF." ; "neighbor, PROF."

	para "ELM, was naar je" ; "ELM, was looking"
	line "op zoek." ; "for you."

	para "Hij zei dat je" ; "He said he wanted"
	line "iets voor hem kon" ; "you to do some-"
	cont "doen." ; "thing for him."

	para "Oh! Bijna ver-" ; "Oh! I almost for-"
	line "geten! Je #MON-" ; "got! Your #MON"

	para "GEAR is terug van" ; "GEAR is back from"
	line "de reparateur." ; "the repair shop."

	para "Alsjeblieft!" ; "Here you go!"
	done

MomGivesPokegearText:
	text "#MON-GEAR, of" ; "#MON GEAR, or"
	line "gewoon #GEAR." ; "just #GEAR."

	para "Hij is essentieel" ; "It's essential if"
	line "om een goede" ;"you want to be a"
	cont "trainer te worden." ; "good trainer."

	para "Oh, de dag van de" ; "Oh, the day of the"
	line "week ontbreekt." ; "week isn't set."

	para "Dat moet je niet" ; "You mustn't forget"
	line "vergeten!" ; "that!"
	done

IsItDSTText:
	text "Is het nu zomer-" ; "Is it Daylight"
	line "tijd?" ; "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Thuis kun je de" ; "Come home to"
	line "tijd veranderen" ; "adjust your clock"

	para "tussen zomer- en" ; "for Daylight"
	line "wintertijd." ; "Saving Time."

	para "Trouwens, weet je" ; "By the way, do you"
	line "hoe je de TELEFOON" ; "know how to use"
	cont "gebruikt?" ; "the PHONE?"
	done

KnowTheInstructionsText:
	text "Je zet toch de" ; "Don't you just"
	line "#GEAR aan" ; "turn the #GEAR"

	para "en selecteert het" ; "on and select the"
	line "TELEFOON-icoon?" ; "PHONE icon?"
	done

DontKnowTheInstructionsText:
	text "Ik lees de hand-" ; "I'll read the"
	line "leiding voor je." ; "instructions."

	para "Zet de #GEAR" ; "Turn the #GEAR"
	line "aan en kies het" ; "on and select the"
	cont "TELEFOON-icoon." ; "PHONE icon."
	done

InstructionsNextText:
	text "Telefoonnummers" ; "Phone numbers are"
	line "worden bewaard." ; "stored in memory."

	para "Selecteer gewoon" ; "Just choose a name"
	line "wie je wil bellen." ; "you want to call."

	para "Joh, is dat niet" ; "Gee, isn't that"
	line "handig?" ; "convenient?"
	done

HurryUpElmIsWaitingText:
	text "PROF.ELM wacht op" ; "PROF.ELM is wait-"
	line "je." ; "ing for you."

	para "Schiet op, schat!" ; "Hurry up, baby!"
	done

SoWhatWasProfElmsErrandText:
	text "Wat voor klus had" ; "So, what was PROF."
	line "PROF. ELM??" ; "ELM's errand?"

	para "…"

	para "Dat klinkt als een" ; "That does sound"
	line "uitdaging." ; "challenging."

	para "Maar je kunt trots" ; "But, you should be"
	line "zijn dat mensen op" ; "proud that people"
	cont "je rekenen." ; "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, doe het!" ; "<PLAYER>, do it!"

	para "Ik sta helemaal" ; "I'm behind you all"
	line "achter je!" ; "the way!"
	done

PlayersHouse1FStoveText:
	text "Haar specialiteit!" ; "Mom's specialty!"

	para "CINNABAR VULKAAN-" ; "CINNABAR VOLCANO"
	line "BURGER!"
	done

PlayersHouse1FSinkText:
	text "De goot is brand-" ; "The sink is spot-"
	line "schoon. Mam poetst" ; "less. Mom likes it"
	cont "graag." ; "clean."
	done

PlayersHouse1FFridgeText:
	text "Eens zien wat er" ; "Let's see what's"
	line "in de koelkast zit" ; "in the fridge…"

	para "VERS WATER en" ; "FRESH WATER and"
	line "lekkere LIMONADE!" ; "tasty LEMONADE!"
	done

PlayersHouse1FTVText:
	text "Er is een film op" ; "There's a movie on"
	line "TV: Sterren vullen" ; "TV: Stars dot the"

	para "de lucht terwijl" ; "sky as two boys"
	line "een trein rijdt…" ; "ride on a train…"

	para "Ik moet ook maar" ; "I'd better get"
	line "eens gaan!" ; "rolling too!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
