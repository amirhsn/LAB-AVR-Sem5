.INCLUDE "M8535DEF.INC"
.ORG 0

RJMP MAIN

MAIN: 	LDI R17,LOW(RAMEND)
		OUT SPL,R17
		LDI R17,HIGH(RAMEND)
		OUT SPH,R17

		LDI ZL,LOW(2*DATA1)
		LDI ZH,HIGH(2*DATA1)
		//GET DATA1 FROM MEMORY
		LPM R3,Z+ 
		LPM R2,Z+
		LPM R1,Z+
		LPM R0,Z+

		LDI ZL,LOW(2*DATA2)
		LDI ZH,HIGH(2*DATA2)
		//GET DATA2 FROM MEMORY
		LPM R10,Z+
		LPM R9,Z+
		LPM R8,Z+
		LPM R7,Z+

		//OPERASI PENGURANGAN
		SUB R3,R10 
		SBC R2,R9
		SBC R1,R8
		SBC R0,R7

		LDI ZL,LOW(2*HASIL)
		LDI ZH,HIGH(2*HASIL)
		//STORE DATA KE HASIL
		ST  Z+,R3	
		ST  Z+,R2
		ST  Z+,R1
		ST  Z+,R0


AKHIR:	RJMP AKHIR

.ORG $0AA0
DATA1:	.DD $FEFEFEFE

.ORG $0AA3
DATA2: 	.DD $89ABCDEF

.ORG $066
HASIL:	.DD $0
