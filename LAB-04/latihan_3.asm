.INCLUDE "M8535DEF.INC"
.ORG 0

//INPUT R21:R20
//OUTPUT R23:R22

RJMP MAIN
MAIN:	
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R16, HIGH(RAMEND)
OUT SPH, R16







AKHIR: RJMP AKHIR

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
