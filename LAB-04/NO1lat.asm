.include "m8535def.inc"
.org 0

rjmp main

main: ldi r16, low(RAMEND)
out SPL, r16
ldi r16, high(RAMEND)
out SPH, r16

MOV R31,R20
ANDI R31,7
MOV R21,R20
ANDI R21,0X0F8
LSR R21
OR R21,R31

akhir: rjmp akhir
