ElevatorFloorNames:
; entries correspond to FLOOR_* constants
	table_width 2
	dw .B4F
	dw .B3F
	dw .B2F
	dw .B1F
	dw ._1F
	dw ._2F
	dw ._3F
	dw ._4F
	dw ._5F
	dw ._6F
	dw ._7F
	dw ._8F
	dw ._9F
	dw ._10F
	dw ._11F
	dw .ROOF
	assert_table_length NUM_FLOORS

; Floor = Vloor
; Basement = Kelder
.B4F:  db "-4V@" ; "B4F@"
.B3F:  db "-3V@" ; "B3F@"
.B2F:  db "-2V@" ; "B2F@"
.B1F:  db "-1V@" ; "B1F@"
._1F:  db "BG@" ; "1F@"
._2F:  db "1V@" ; "2F@"
._3F:  db "2V@" ; "3F@"
._4F:  db "3V@" ; "4F@"
._5F:  db "4V@" ; "5F@"
._6F:  db "5V@" ; "6F@"
._7F:  db "6V@" ; "7F@"
._8F:  db "7V@" ; "8F@"
._9F:  db "8V@" ; "9F@"
._10F: db "9V@" ; "10F@"
._11F: db "10V@" ; "11F@"
.ROOF: db "DAK@" ; "ROOF@"
