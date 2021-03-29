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

//INISIALISASI COUNTER
AWAL:
LDI R16,0

//INISIALIASI POINTER Z
LDI ZL, LOW(2*DAT)
LDI ZH, HIGH(2*DAT)

//MULAI
L1:
LPM R20, Z+
OUT PORTA, R20
RCALL DELAY
INC R16
CPI R16, $10
BRLO L1
RJMP AWAL

//SUBRUTIN DELAY 1 DETIK
DELAY:
LDI R21, 11
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

.ORG 80
DAT: 
.DB $8E, $86, $A1, $C6, $83, $88, $90, $80, $F8, $82, $92, $99, $B0, $A4, $F9, $C0
