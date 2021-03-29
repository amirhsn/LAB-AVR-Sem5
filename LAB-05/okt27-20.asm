.INCLUDE "M8535DEF.INC"
.ORG 0

RJMP MAIN
MAIN:
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPL, R16

//B INPUT, A OUTPUT
LDI R16, 0
OUT DDRB, R16
LDI R16, 0X0FF
OUT DDRA, R16

//BACA INPUT = R22
READ:
IN R22, PINB
RCALL DELAY
OUT PORTA, R22
RCALL DELAY
RJMP READ
AKHIR: RJMP AKHIR

//SUBRUTIN UNTUK MEMBUANG WAKTU
DELAY:
LDI R23, 99
LUP:
DEC R23
BRNE LUP
RET
