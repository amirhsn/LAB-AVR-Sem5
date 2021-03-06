.INCLUDE "M8535DEF.INC"
.ORG 0

RJMP MAIN
MAIN:
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPH, R16

//PORT A DAN B SEBAGAI OUTPUT
LDI R20, 0XFF
OUT DDRA, R20 
OUT DDRB, R20

FRAMEBEGIN: 
LDI R16, 30 //60FRAMEX4

ULANG:
LDI ZL, LOW(2*DAT)
LDI ZH, HIGH(2*DAT)
LDI R23, 0X8 //1 FRAME 8 KAR

TAMPIL:
LPM R21,Z+
OUT PORTA, R21
LPM R22,Z+
OUT PORTB, R22
RCALL DELAY
DEC R23 //COUNTER
BRNE TAMPIL
DEC R16
BRNE ULANG
//MATIKAN
LDI R17, 0XFF
OUT PORTB, R17
RCALL DELAY1S
RJMP FRAMEBEGIN
AKHIR: RJMP AKHIR

DELAY: //SEKITAR 2MS
LDI R25, 4
LUP1:
LDI R24, 0XAA
LUP:
DEC R24
BRNE LUP
DEC R25
BRNE LUP1
RET

DELAY1S: //SEKITAR 1S
PUSH R21
PUSH R22
PUSH R23
LDI R21,0
L21:
LDI R22,0
L22:
LDI R23,0
L23:
DEC R23
BRNE L23
DEC R22
BRNE L22
DEC R21
BRNE L21
POP R23
POP R22
POP R21
RET

.ORG 80
DAT:
//POSISI DIGIT DAN POLA KARAKTER SELANG SELING
.DB $80,$83,$40,$84,$20,$CF,$10,$A0,$08,$F1,$04,$88,$02,$CE,$01,$BF
