.INCLUDE "M8535DEF.INC"
.ORG 0

RJMP MAIN
MAIN:
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPH, R16

//INISIALISASI POINTER
LDI ZL, LOW(2*DAT)
LDI ZH, HIGH(2*DAT)
//INISIALISASI COUNTER
LDI R18,0
LPM R19, Z+
LPM R20, Z+
RCALL OPR

AKHIR: RJMP AKHIR

OPR:
CPI R18, $0A
BREQ AKHIR
INC R18
LPM R21, Z+
LPM R22, Z+
//CEK PULUHAN
CP R20, R22
BREQ CEKSAT
BRLO OPR
MOV R20, R22
MOV R19, R21
RJMP OPR

CEKSAT:
CP R19, R21
BRLO OPR
MOV R19, R21
RJMP OPR

.ORG $80
DAT: .DW $64F0,$2210,$53FC,$1111,$932D,$9999,$1777,$1453,$8110,$A4DE,$184D,$999A,$43FC,$4A8B,$AAAA
