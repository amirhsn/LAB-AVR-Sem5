.INCLUDE "M8535DEF.INC"
.ORG 0

RJMP MAIN
MAIN: 
LDI R16,LOW(RAMEND)
OUT SPL,R16
LDI R16,HIGH(RAMEND)
OUT SPH,R16

MOV R19,R20
ANDI R20,$0F
ANDI R19,$F0
LSR R19
LSR R19
LSR R19
LSR R19

LDI R21,$0A
MUL R21,R19
MOV R21,R0
ADD R21,R20
  
AKHIR: RJMP AKHIR