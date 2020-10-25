.include "m8535def.inc"
.org 0

rjmp main

main:		LDI R17, LOW(RAMEND)
			OUT SPL, R17
			LDI R17, HIGH(RAMEND)
			OUT SPH, R17

			LDI ZL, LOW(2*DATA1)
			LDI ZH, HIGH(2*DATA1)
			//PINDAH KE R1:R2
			LPM R2, Z+
			LPM R1, Z+

			LDI ZL, LOW(2*DATA2)
			LDI ZH, HIGH(2*DATA2)
			//R3:R4
			LPM R4, Z+	
			LPM R3, Z+
			
			SUB R2, R4
			SBC R1, R3
			
			LDI ZL, LOW(2*HASIL)
			LDI ZH, HIGH(2*HASIL)
			//STORE KE HASIL
			ST Z+, R2
			ST Z+, R1
						
			
AKHIR:		RJMP AKHIR


.org 0x80
DATA1:	.DW $F333

.ORG $0105
DATA2:	.DW $21DC

.org 0x66
HASIL:  .DW $0
