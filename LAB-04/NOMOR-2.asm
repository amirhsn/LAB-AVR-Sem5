.INCLUDE "M8535DEF.INC"
.ORG 0

//INPUT (R15:R14)(R13:R12)(R11:R10)(R9:R8)
//OUTPUT (R20:R19)

RJMP MAIN
MAIN:
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPH, R16

//MSB
MOV R22, R15
MOV R21, R13
RCALL CYK
MOV R21, R11
RCALL CYK
MOV R21, R9
RCALL CYK

//PINDAH
MOV R20, R22

//LSB
MOV R22, R14
MOV R21, R12
RCALL CYK
MOV R21, R10
RCALL CYK
MOV R21, R8
RCALL CYK

//PINDAH
MOV R19, R22
 
AKHIR: RJMP AKHIR

CYK:
CP R22, R21
BRSH CONV
TER: RET

CONV:
MOV R22, R21
RJMP TER
