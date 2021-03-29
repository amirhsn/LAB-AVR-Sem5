.INCLUDE "M8535DEF.INC"
.ORG 0

RJMP MAIN
MAIN:
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPH, R16

//PORT A SEBAGAI OUTPUT
LDI R20, $FF
OUT DDRA, R20

//R20 AKAN BERTINDAK SEBAGAI COUNTER
AWAL:
LDI R20, 0
MULAI:
OUT PORTA, R20
RCALL DELAY
INC R20	//00000111
CPI R20, 32  //DESIMAL  2^5
BRNE MULAI
RJMP AWAL
//AKHIR: RJMP AKHIR

//SUBRUTIN DELAY 1 DETIK
DELAY:
LDI R21, $33
L21:
LDI R22, 0
L22:
LDI R23, 0
L23:
DEC R23
BRNE L23
DEC R22
BRNE L22
DEC R21
BRNE L21
RET