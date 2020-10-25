.include"m8535def.inc"
.org 0

rjmp main

main : LDI R17,LOW(RAMEND)
	   OUT SPL,R17
	   LDI R17,HIGH(RAMEND)
	   OUT SPH,R17
	   LDI R29,0X0FF
LOOPZ: ST Z+,R29 
	   CPI R30,$1D
	   BRNE LOOPZ
	   MOV R30,R29
	   MOV R31,R29



AKHIR : RJMP AKHIR



