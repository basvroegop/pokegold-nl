	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphResearchCenterNoopScene,        SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

RuinsOfAlphResearchCenterNoopScene:
	end

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer RuinsOfAlphResearchCenterGetUnownDexScript
	end

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto: ; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Afgerond!" ; "Done!"

	para "Ik heb je #DEX" ; "I modified your"
	line "geüpgraded." ; "#DEX."

	para "Het heeft nu een" ; "I added an"
	line "nieuwe modus voor" ; "optional #DEX"
	cont "UNOWN-gegevens."

	; para "to store UNOWN"
	; line "data."

	para "Het ordent ze in" ; "It records them in"
	line "de volgorde waarin" ; "the sequence that"
	cont "ze zijn gevangen." ; "they were caught."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "De #DEX" ; "<PLAYER>'s #DEX"
	line "is geüpgraded." ; "was upgraded."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "De UNOWN dat je" ; "The UNOWN you"
	line "gevangt zal wordt" ; "catch will all be"
	cont "opgenomen." ; "recorded."

	para "Je kunt zien hoe-" ; "Check to see how"
	line "veel soorten er" ; "many kinds exist."
	cont "bestaan."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Gevangte je alle-" ; "You caught all the"
	line "maal de soorten" ; "UNOWN variations?"
	cont "UNOWN?"

	para "Die is een grote" ; "That's a great"
	line "prestatie!" ; "achievement!"

	para "Er is hier een" ; "I've set up the"
	line "printer voor" ; "printer here for"
	cont "UNOWN." ; "handling UNOWN."

	para "Gebruikt het op" ; "Feel free to use"
	line "elk moment." ; "it anytime."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "De RUÏNES zijn" ; "The RUINS are"
	line "ongeveer 1500 jaar" ; "about 1500 years"
	cont "oud." ; "old."

	para "Maar we weten niet" ; "But it's not known"
	line "waarom, of wie" ; "why they were"
	cont "bouwde ze." ; "built--or by whom."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "Ik vraag me af" ; "I wonder how many"
	line "hoeveel soorten" ; "kinds of #MON"
	cont "#MON er in de" ; "are in the RUINS?"
	cont "RUÏNES wonen?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#MON lijken" ; "#MON appeared"
	line "in de RUÏNES?" ; "in the RUINS?"

	para "Dat is ongeloof-" ; "That's incredible"
	line "lijk nieuws!" ; "news!"

	para "We moeten het" ; "We'll need to"
	line "onderzoeken." ; "investigate this."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "Er zijn vreemde" ; "There are odd pat-"
	line "patronen op de" ; "terns drawn on the"

	para "muren van de" ; "walls of the"
	line "RUÏNES." ; "RUINS."

	para "Zij moeten de ant-" ; "They must be the"
	line "woorden zijn op" ; "keys for unravel-"
	cont "het mysterie van" ; "ing the mystery"
	cont "de RUÏNES." ; "of the RUINS."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "De vreemde #MON" ; "The strange #-"
	line "die je in de" ; "MON you saw in the"
	; cont "RUINS?"

	para "RUÏNES zag lijken" ; "They appear to be"
	line "net zoals de" ; "very much like the"

	para "patronen op de" ; "drawings on the"
	line "muren daar." ; "walls there."

	para "Hmm…"

	para "Er moeten veel" ; "That must mean"
	line "verschillende" ; "there are many"
	cont "soorten zijn." ; "kinds of them…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "RUÏNES VAN ALF" ; "RUINS OF ALPH"

	para "Onderzoeksjaar 10" ; "Exploration"
	; line "Year 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Mysterie #MON" ; "Mystery #MON"
	line "Naam: UNOWN" ; "Name: UNOWN"

	para "{d:NUM_UNOWN} soorten" ; "A total of {d:NUM_UNOWN}"
	line "ontdekt." ; "kinds found."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Dit werkt" ; "This doesn't seem"
	line "nog niet." ; "to work yet."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "Je mag UNOWN" ; "UNOWN may be"
	line "afgedrukken." ; "printed out."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "Het is een foto" ; "It's a photo of"
	line "van de oprichter" ;  "the RESEARCH"

	para "van de ONDERZOEK-" ; "CENTER'S founder,"
	line "SCENTRUM," ; "PROF.SILKTREE."
	cont "PROF. SILKTREE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Er light veel" ; "There are many"
	line "academische" ; "academic books."
	cont "boeken."

	para "Oude RUÏNES…" ; "Ancient Ruins…"
	line "Mysteries van de" ; "Mysteries of the"
	cont "Ouden…" ; "Ancients…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
