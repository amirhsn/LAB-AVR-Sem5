.include"m8535def.inc"
.org 0
;R0-R31 DENGAN FF,MENGGUNAKAN METODA NO LOOP
rjmp main

main : LDI R17,LOW(RAMEND)
	   OUT SPL,R17
	   LDI R17,HIGH(RAMEND)
	   OUT SPH,R17
	   INC R31
	   MOV R30,R31
	   INC R31
	   MOV R29,R31
	   INC R31
	   MOV R28,R31
	   INC R31
	   MOV R27,R31
	   INC R31
	   MOV R26,R31
	   INC R31
	   MOV R25,R31
	   INC R31
	   MOV R24,R31
	   INC R31
	   MOV R23,R31
	   INC R31
	   MOV R22,R31
	   INC R31
	   MOV R21,R31
	   INC R31
	   MOV R20,R31
	   INC R31
	   MOV R19,R31
	   INC R31
	   MOV R18,R31
	   INC R31
	   MOV R17,R31
	   INC R31
	   MOV R16,R31
	   INC R31
	   MOV R15,R31
	   INC R31
	   MOV R14,R31
	   INC R31
	   MOV R13,R31
	   INC R31
	   MOV R12,R31
	   INC R31
	   MOV R11,R31
	   INC R31
	   MOV R10,R31
	   INC R31
	   MOV R9,R31
	   INC R31
	   MOV R8,R31
	   INC R31
	   MOV R7,R31
	   INC R31
	   MOV R6,R31
	   INC R31
	   MOV R5,R31
	   INC R31
	   MOV R4,R31
	   INC R31
	   MOV R3,R31
	   INC R31
	   MOV R2,R31
	   INC R31
	   MOV R1,R31
	   INC R31
	   MOV R0,R31
	   LDI R31,0

AKHIR : RJMP AKHIR
