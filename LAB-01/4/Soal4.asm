.INCLUDE "M8535DEF.INC"
.ORG 0

RJMP MAIN

MAIN:
LDI R31, LOW(RAMEND)
OUT SPL, R31
LDI R31, HIGH(RAMEND)
OUT SPH, R31

MOV R2, R16

RCALL OPP
MOV R3, R16
MOV R4, R17
RCALL OPP
RCALL OPP
MOV R5, R16
MOV R6, R17
RCALL OPP
RCALL OPP

//JUMLAHKAN
ADD R16, R3
ADC R17, R4

ADD R16, R5
ADC R17, R6

ADD R16, R2
ADC R17, R1

//PINDAHKAN KE REGISTER TUJUAN
MOV R19, R16
MOV R20, R17

AKHIR: RJMP AKHIR

OPP:
ADD R16, R16
ADC R17, R17
RET
