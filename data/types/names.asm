TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2, TypeNames
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	assert_table_length UNUSED_TYPES
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw CurseType
	assert_table_length UNUSED_TYPES_END
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	assert_table_length TYPES_END

Normal:    db "NORMAAL@" ; "NORMAL@"
Fighting:  db "VECHT@" ; "FIGHTING@"
Flying:    db "VLIEGEN@" ; "FLYING@" "VLIEGSOORT" longer than 8 chars
Poison:    db "GIF@" ; "POISON@"
CurseType: db "???@"
Fire:      db "VUUR@" ; "FIRE@"
Water:     db "WATER@"
Grass:     db "GRAS@" ; "GRASS@"
Electric:  db "DONDER@" ; "ELECTRIC@" "ELEKTRISCH" longer than 8 chars
Psychic:   db "PARANORM@" ; "PSYCHIC@" "PSYCHISCH" longer than 8 chars
Ice:       db "IJS@" ; "ICE@"
Ground:    db "GROND@" ; "GROUND@"
Rock:      db "STEEN@" ; "ROCK@"
Bird:      db "VOGEL@" ; "BIRD@"
Bug:       db "INSECT@" ; "BUG@"
Ghost:     db "GEEST@" ; "GHOST@"
Steel:     db "STAAL@" ; "STEEL@"
Dragon:    db "DRAAK@" ; "DRAGON@"
Dark:      db "DONKER@" ; "DARK@"
