DEF GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE   EQU 500
DEF GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE EQU 300

	object_const_def
	const GOLDENRODUNDERGROUND_SUPER_NERD1
	const GOLDENRODUNDERGROUND_SUPER_NERD2
	const GOLDENRODUNDERGROUND_SUPER_NERD3
	const GOLDENRODUNDERGROUND_SUPER_NERD4
	const GOLDENRODUNDERGROUND_POKE_BALL
	const GOLDENRODUNDERGROUND_GRAMPS
	const GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_GRANNY

GoldenrodUnderground_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundResetSwitchesCallback
	callback MAPCALLBACK_TILES, GoldenrodUndergroundCheckBasementKeyCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodUndergroundCheckDayOfWeekCallback

GoldenrodUndergroundResetSwitchesCallback:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

GoldenrodUndergroundCheckBasementKeyCallback:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	endcallback

.LockBasementDoor:
	changeblock 18, 6, $3d ; locked door
	endcallback

GoldenrodUndergroundCheckDayOfWeekCallback:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

; Sunday
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Monday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	checktime MORN
	iffalse .NotMondayMorning
	appear GOLDENRODUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Tuesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Wednesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Thursday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Friday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Saturday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

TrainerSupernerdEric:
	trainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdEricAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTeru:
	trainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTeruAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacIssac:
	trainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacIssacAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacDonald:
	trainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDonaldAfterBattleText
	waitbutton
	closetext
	end

BitterMerchantScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .Open
	ifequal SATURDAY, .Open
	sjump GoldenrodUndergroundScript_ShopClosed

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND
	closetext
	end

BargainMerchantScript:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue GoldenrodUndergroundScript_ShopClosed
	readvar VAR_WEEKDAY
	ifequal MONDAY, .CheckMorn
	sjump GoldenrodUndergroundScript_ShopClosed

.CheckMorn:
	checktime MORN
	iffalse GoldenrodUndergroundScript_ShopClosed
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

OlderHaircutBrotherScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .DoHaircut
	ifequal THURSDAY, .DoHaircut
	ifequal SATURDAY, .DoHaircut
	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText
	promptbutton
	special OlderHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText
	waitbutton
	closetext
	special FadeOutToWhite
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundOlderHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundOlderHaircutBrotherThatsAShameText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext GoldenrodUndergroundOlderHaircutBrotherOneHaircutADayText
	waitbutton
	closetext
	end

YoungerHaircutBrotherScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .DoHaircut
	ifequal WEDNESDAY, .DoHaircut
	ifequal FRIDAY, .DoHaircut
	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText
	promptbutton
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText
	waitbutton
	closetext
	special FadeOutToWhite
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundYoungerHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext GoldenrodUndergroundTheDoorsLockedText
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext GoldenrodUndergroundBasementKeyOpenedDoorText
	waitbutton
	closetext
	changeblock 18, 6, $2e ; unlocked door
	refreshmap
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext GoldenrodUndergroundTheDoorIsOpenText
	waitbutton
	closetext
	end

GoldenrodUndergroundScript_ShopClosed:
	writetext GoldenrodUndergroundWeAreNotOpenTodayText
	waitbutton
	closetext
	end

GoldenrodUndergroundCoinCase:
	itemball COIN_CASE

GoldenrodUndergroundNoEntrySign:
	jumptext GoldenrodUndergroundNoEntryText

GoldenrodUndergroundHiddenParlyzHeal:
	hiddenitem PARLYZ_HEAL, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_PARLYZ_HEAL

GoldenrodUndergroundHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_SUPER_POTION

GoldenrodUndergroundHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_ANTIDOTE

SupernerdEricSeenText:
	text "Ik ben uit de" ; "I got booted out"
	line "SPELHOEK ge-" ; "of the GAME COR-"
	cont "gooid." ; "NER."

	para "Ik probeerde met" ; "I was trying to"
	line "mijn #MON vals" ; "cheat using my"
	cont "te spelen…" ; "#MON…"
	done

SupernerdEricBeatenText:
	text "…Mopper…" ; "…Grumble…"
	done

SupernerdEricAfterBattleText:
	text "Blijkbaar moet ik" ; "I guess I have to"
	line "dingen op een eer-" ; "do things fair and"
	cont "lijke manier doen…" ; "square…"
	done

SupernerdTeruSeenText:
	text "Denk je aan type-"; "Do you consider"
	line "afstemmingen"; "type alignments in"
	cont "tijdens gevechten?"; "battle?"

	para "Als je je type-"; "If you know your"
	line "voordelen kent,"; "type advantages,"

	para "zal je beter in"; "you'll do better"
	line "gevechten zijn."; "in battle."
	done

SupernerdTeruBeatenText:
	text "Oh, oh, oh!"; "Ow, ow, ow!"
	done

SupernerdTeruAfterBattleText:
	text "Ik weet #MON-"; "I know my #MON"
	line "type-voordelen."; "type alignments."

	para "Maar ik gebruik"; "But I only use one"
	line "slechts één"; "type of #MON."
	cont "#MON-type." ;
	done

PokemaniacIssacSeenText:
	text "My #MON just"
	line "got haircuts!"

	para "I'll show you how"
	line "strong they are!"
	done

PokemaniacIssacBeatenText:
	text "Aiiii!"; "Aiyeeee!"
	done

PokemaniacIssacAfterBattleText:
	text "Je #MON zullen"; "Your #MON will"
	line "je beter mogen als"; "like you more if"

	para "je ze knip-"; "you give them"
	line "beurten geeft."; "haircuts."
	done

PokemaniacDonaldSeenText:
	text "Ik denk dat je wat"; "I think you have"
	line "zeldzame #MON"; "some rare #MON"
	cont "bij je hebt."; "with you."

	para "Laat me zien!"; "Let me see them!"
	done

PokemaniacDonaldBeatenText:
	text "Bwaa! Ik heb ver-"; "Gaah! I lost!"
	line "loren! Dat maakt"; "That makes me mad!"
	cont "me boos!"
	done

PokemaniacDonaldAfterBattleText:
	text "Vul je 'n #DEX?"; "Are you making a"
	line "Hier is een"; "#DEX? Here's a"
	cont "goede tip."; "hot tip."

	para "De WANDELAAR op"; "The HIKER on ROUTE"
	line "ROUTE 33, ANTHONY,"; "33, ANTHONY, is a"
	cont "is een goede vent."; "good guy."

	para "Hij belt je als"; "He'll phone you if"
	line "hij een zeldzame"; "he sees any rare"
	cont "#MON ziet."; "#MON."
	done

GoldenrodUndergroundTheDoorsLockedText:
	text "De deur is"; "The door's locked…"
	line "op slot…" ;
	done

GoldenrodUndergroundTheDoorIsOpenText:
	text "De deur is open."; "The door is open."
	done

GoldenrodUndergroundBasementKeyOpenedDoorText:
	text "De KLDRSLEUTEL"; "The BASEMENT KEY"
	line "opent de deur."; "opened the door."
	done

GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText:
	text "Welkom!"; "Welcome!"

	para "Ik leid de"; "I run the #MON"
	line "#MONSALON!"; "SALON!"

	para "Ik ben de oudste"; "I'm the older and"
	line "en beste van de"; "better of the two"
	cont "twee KNIPBROERS."; "HAIRCUT BROTHERS."

	para "Ik kan je #MON"; "I can make your"
	line "mooi maken voor"; "#MON beautiful"
	cont "slechts ¥500."; "for just ¥500."

	para "Wil je graag een"; "Would you like me"
	line "knipbeurt?"; "to do that?"
	done

GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText:
	text "Welke #MON zal"; "Which #MON"
	line "ik mee werken?"; "should I work on?"
	done

GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText:
	text "Oké! Zie het"; "OK! Watch it"
	line "mooi worden!"; "become beautiful!"
	done

GoldenrodUndergroundOlderHaircutBrotherAllDoneText:
	text "Zo! Klaar!"; "There! All done!"
	done

GoldenrodUndergroundOlderHaircutBrotherThatsAShameText:
	text "Weet je het zeker?"; "Is that right?"
	line "Wat jammer!"; "That's a shame!"
	done

GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText:
	text "Je hebt meer geld"; "You'll need more"
	line "nodig dan dat."; "money than that."
	done

GoldenrodUndergroundOlderHaircutBrotherOneHaircutADayText:
	text "Ik doe maar één"; "I do only one"
	line "knipbeurt per dag."; "haircut a day. I'm"
	cont "Ik ben klaar voor"; "done for today."
	cont "vandaag."
	done

GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText:
	text "Welkom bij de"; "Welcome to the"
	line "#MONSALON!"; "#MON SALON!"

	para "Ik ben de jongste"; "I'm the younger"
	line "en minder dure"; "and less expen-"
	cont "van de twee"; "sive of the two"
	cont "KNIPBROERS."; "HAIRCUT BROTHERS."

	para "Ik knap je #MON"; "I'll spiff up your"
	line "op voor slechts"; "#MON for just"
	cont "¥300."; "¥300."

	para "Dus? Wat denk je?"; "So? How about it?"
	done

GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText:
	text "Oké, welke #MON"; "OK, which #MON"
	line "zal ik doen?"; "should I do?"
	done

GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText:
	text "Oké! Ik zorg dat"; "OK! I'll make it"
	line "het cool is!"; "look cool!"
	done

GoldenrodUndergroundYoungerHaircutBrotherAllDoneText:
	text "Zo!"; "There we go!"
	line "We zijn klaar!"; "All done!"
	done

GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText:
	text "Nee?"; "No? "
	line "Wat jammer!"; "How disappointing!"
	done

GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText:
	text "Je hebt niet"; "You're a little"
	line "genoeg geld."; "short on funds."
	done

GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText:
	text "Ik kan maar één"; "I can do only one"
	line "knipbeurt doen"; "haircut a day."

	para "per dag. Sorry, ik"; "Sorry, but I'm all"
	line "ben klaar nu."; "done for today."
	done

HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text " ziet er"; " looks a"
	line "iets blijer uit."; "little happier."
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text " ziet er"; " looks"
	line "gelukkig uit."; "happy."
	done

HaircutBrosText_MuchHappier:
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text " ziet er"; " looks"
	line "opgetogen uit!"; "delighted!"
	done

GoldenrodUndergroundWeAreNotOpenTodayText:
	text "We zijn vandaag"; "We're not open"
	line "niet open."; "today."
	done

GoldenrodUndergroundNoEntryText:
	text "GEEN TOEGANG"; "NO ENTRY BEYOND"
	line "VOORBIJ DIT PUNT"; "THIS POINT"
	done

GoldenrodUnderground_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 7
	warp_event  3, 34, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 4
	warp_event 18,  6, GOLDENROD_UNDERGROUND, 4
	warp_event 21, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 27, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 1

	def_coord_events

	def_bg_events
	bg_event 18,  6, BGEVENT_READ, BasementDoorScript
	bg_event 19,  6, BGEVENT_READ, GoldenrodUndergroundNoEntrySign
	bg_event  6, 13, BGEVENT_ITEM, GoldenrodUndergroundHiddenParlyzHeal
	bg_event  4, 18, BGEVENT_ITEM, GoldenrodUndergroundHiddenSuperPotion
	bg_event 17,  8, BGEVENT_ITEM, GoldenrodUndergroundHiddenAntidote

	def_object_events
	object_event  5, 31, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdEric, -1
	object_event  6,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdTeru, -1
	object_event  3, 27, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacIssac, -1
	object_event  2,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDonald, -1
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundCoinCase, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	object_event  7, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRAMPS
	object_event  7, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_OLDER_HAIRCUT_BROTHER
	object_event  7, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event  7, 21, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRANNY
