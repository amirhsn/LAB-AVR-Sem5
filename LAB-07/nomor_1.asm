.INCLUDE "M8535DEF.INC"
.ORG 0
//PEMROGRAM		: AMIR HUSEIN
//NIM			: 181344003
RJMP MAIN
MAIN:	LDI R16, LOW(RAMEND)
		OUT SPL, R16
		LDI R16, HIGH(RAMEND)
		OUT SPH, R16
		LDI R20, 0X0FF
		OUT DDRC, R20
		OUT DDRA, R20
		LDI ZL, LOW(2*DAT)
		LDI ZH, HIGH(2*DAT)
		LDI R17, 01
		LDI R16, $00
S33:	LDI R24, 12
S11:	LDI R19, 0X04
		OUT PORTC, R19
		MOV ZL, R17
		LPM R18, Z
		OUT PORTA, R18
		RCALL DELAY
		LDI R19, 0X02
		OUT PORTC, R19
		MOV R19, R16
		ANDI R19, 0XF0
		SWAP R19
		MOV ZL, R19
		LPM R18, Z
		OUT PORTA, R18
		RCALL DELAY
		LDI R19, 0X01
		OUT PORTC, R19
		MOV R19, R16
		ANDI R19, 0X0F
		MOV ZL, R19
		LPM R18, Z
		OUT PORTA, R18
		RCALL DELAY
		DEC R24
		BRNE S11
		LDI R27, 1
		ADD R16, R27
		ADC R17, R5
		CPI R17, 03
		BRNE S33
		CPI R16, 0X10
		BRNE S33

AKHIR:	RJMP AKHIR

DELAY:	PUSH R21
		PUSH R22
		PUSH R23
		LDI R21, 1
LUP21:	LDI R22, 0X22
LUP22:	LDI R23, 0
LUP23:	DEC R23
		BRNE LUP23
		DEC R22
		BRNE LUP22
		DEC R21
		BRNE LUP21
		POP R23
		POP R22
		POP R21
		RET
		
.ORG 80
DAT:
.DB 0X3F,0X06,0X5B,0X4F,0X66,0X6D,0X7D,0X07,0X7F,0X6F,0X77,0X7C,0X39,0X5E,0X79,0X71
