.include"m8535def.inc"
.org 0
RJMP MAIN
MAIN: 
	LDI R16,LOW(RAMEND)
	OUT SPL,R16
	LDI R16,HIGH(RAMEND)
	OUT SPH,R16
	
	MOV R29,R21
	MOV R28,R20

	MOV R22,R20				;SATUAN
	ANDI R22,$F
	
	LDI R31,8				;KONVERSI 8-AN
	MOV R30,R20
	ANDI R30,$F0
	BREQ O3
	RCALL SHR4
	RCALL KONVERSI
O3:							;KONVERSI 64-AN
	LDI R31,$64
	MOV R30,R21
	ANDI R30,$F
	BREQ O4
	RCALL KONVERSI
O4: 						;KONVERSI 512-AN
	LDI R31,5
	MOV R0,R31
	LDI R31,12
	MOV R30,R21
	ANDI R30,$F0
	BREQ END
	RCALL SHR4
	RCALL KONVERSI	

	MOV R21,R29
	MOV R20,R28

END: RJMP END

ODA:
	PUSH R16
	PUSH R17
	PUSH R18
	IN R16,SREG
	BRHC L0
	LDI R18,$6
	ADD R15,R18
L0:	MOV R17,R15
	ANDI R17,$F
	CPI R17,$A
	BRLO L1
	LDI R18,$6
	ADD R15,R18	
L1: MOV R17,R15
	ANDI R17,$F0
	CPI R17,$A0
	BRLO L2
	LDI R18,$60
	ADD R15,R18
	BRCC L2
	ORI R16,1
L2: OUT SREG,R16
	POP R18
	POP R17
	POP R16
	RET
SHR4: ;BUAT SHIFT 
	LSR R30
	LSR R30
	LSR R30
	LSR R30
	RET

KONVERSI:	;PROSES KONVERSI
	ADD R22,R31
	MOV R15,R22
	RCALL ODA
	MOV R22,R15
	ADC R23,R0
	MOV R15,R23
	RCALL ODA
	MOV R23,R15
	DEC R30
	BRNE KONVERSI
	RET







