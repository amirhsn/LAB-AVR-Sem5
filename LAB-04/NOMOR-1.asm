.INCLUDE "M8535DEF.INC"
.ORG 0
//AMIR HUSEIN (181344003)
RJMP MAIN
MAIN:
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPH, R16

MOV R20, R6
MOV R21, R7
RCALL PINDAH
MOV R21, R8
RCALL PINDAH
MOV R21, R9
RCALL PINDAH

AKHIR: RJMP AKHIR

PINDAH:
CP R20, R21
BRLO BACK
MOV R20, R21
BACK: RET
