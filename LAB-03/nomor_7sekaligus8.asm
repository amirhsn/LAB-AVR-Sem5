.include "m8535def.inc"
.org 0
RJMP MAIN
;Pemrogram : Amir Husein
;-------------------------------------------
MAIN: 
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPH, R16

//GET DATA DAT1
LDI ZL, LOW(2*DAT1)
LDI ZH, HIGH(2*DAT1)
LPM R4, Z+
LPM R3, Z+
LPM R2, Z+
LPM R1, Z+
LPM R0, Z+

//GET DATA DAT2
LDI ZL, LOW(2*DAT2)
LDI ZH, HIGH(2*DAT2)
LPM R9, Z+
LPM R8, Z+
LPM R7, Z+
LPM R6, Z+
LPM R5, Z+

//PENJUMLAHAN
MOV R19, R4
ADD R19, R9
RCALL DAA
MOV R4, R19

MOV R19, R3
ADC R19, R8
RCALL DAA
MOV R3, R19

MOV R19, R2
ADC R19, R7
RCALL DAA
MOV R2, R19

MOV R19, R1
ADC R19, R6
RCALL DAA
MOV R1, R19

MOV R19, R0
ADC R19, R5
RCALL DAA
MOV R0, R19
//SIMPAN DI REGISTER TARGET
CLR R25
ADC R25, R25
MOV R24, R0
MOV R23, R1
MOV R22, R2
MOV R21, R3
MOV R20, R4

AKHIR: RJMP AKHIR

.ORG $80
DAT1: .DQ $9999999999

.ORG $88
DAT2: .DQ $9999999999



; subrutin unt koreksi hasil penjumlahan mjd. BCD.2 dgt.
; yang dilaksanakan mll. r19 sbg. acc.:
daa: push r16;amankan isi reg. ke stack

push r17
push r21
push r24
in r16,sreg; amankan sreg
in r17,sreg
ldi r24,0 ; r24 hanya sbg status dr carry flag
adc r24,r24; status carry flag sebelum koreksi

; ambil, amankan kembali sreg, uji half carry

out sreg,r17
brhc lup4; lompat ke lup4 jika H=0
rcall fk_ln; satuan + 06 jika H=1
; rjmp lup5
lup4: mov r21,r19

andi r21,$0f; ambil dgt.satuan
cpi r21,$0a ; > 9
brcs lup5; lompat ke lup5 jika < 9
rcall fk_ln; satuan + 06 jika > 9

lup5: out sreg,r17; ambil, amankan kembali sreg, uji carry

brcc lup6; lompat ke lup6 jika C=0
rcall fk_hn; puluhan + 60 jika C=1
; rjmp lup7
lup6: mov r21,r19

andi r21,0xf0; ambil dgt.puluhan
cpi r21,0xa0
brcs lup7; lompat ke lup7 jika pul < a
rcall fk_hn; pul + 60 jika > 9

lup7: out sreg,r16; mengatur carry flag sblm keluar:

clc; C = 0
in r16,sreg ;amankan sreg stlh c=0
cpi r24,0 ;menguji status
breq lup8
out sreg,r16;ambil sreg, set c
sec; C = 1
in r16,sreg; amankan sreg stlh c=1
lup8: out sreg,r16;status akhir
pop r24;kembalikan isi reg. dr stack
pop r21
pop r17
pop r16
ret

fk_ln: ldi r21,06; koreksi dgt.satuan

out sreg,r16
add r19,r21
in r16,sreg
brcc tuh
ldi r21,0x01
add r17,r21
tuh: out sreg,r16
adc r24,r24
ret

fk_hn: ldi r21,$60; koreksi dgt.puluhan

out sreg,r16
add r19,r21
in r16,sreg
adc r24,r24; amankan carry pd r24
ret ; akhir dari prog. subrutin.
