.include"m8535def.inc"

.org 0x0000
// metoda penggandaan 9,6,3 kali dengan penambahan satuan
rjmp main


main:	ldi r16, low(ramend)
		out spl, r16
		ldi r16, high(ramend)
		out sph, r16
		
		mov r24,r20
		mov r25,r21
		
		andi r24,$07
		mov r17,r20
		andi r17,$F8

		andi r25,$07
		mov r26,r20
		andi r26,$F8

		lsr r17
		lsr r17
		lsr r17
		lsr r17
		
		lsr r26
		lsr r26
		lsr r26
		lsr r26
		ldi r28,$6
		ldi r29,$9

		mov r30,r26
ulang:	rcall ganda ;512an
		dec r29
		cpi r29,0
		brne ulang
		movw r22,r30
		ldi r31,0
		mov r30,r25
ulang1:	rcall ganda ;64an
		dec r28
		cpi r28,0
		brne ulang1

		add r22,r30
		mov r19,r22
		rcall daa
		mov r22,r19
		adc r23,r31
		mov r19,r23
		rcall daa
		mov r23,r19

		mov r30,r17
		ldi r31,0
		rcall ganda
		rcall ganda
		rcall ganda ;8sn
		add r22,r30
		mov r19,r22
		rcall daa
		mov r22,r19
		adc r23,r3
		mov r19,r23
		rcall daa
		mov r23,r19

		add r22,r24 ;satuan
		mov r19,r22
		rcall daa
		mov r22,r19
		adc r23,r3
		mov r19,r23
		rcall daa
		mov r23,r19


akhir: rjmp akhir

ganda:	add r30,r30
		mov r19,r30
		rcall daa
		mov r30,r19
		adc r31,r31
		mov r19,r31
		rcall daa
		mov r31,r19
		ret

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
lup4: 	mov r21,r19

		andi r21,$0f; ambil dgt.satuan
		cpi r21,$0a ; > 9
		brcs lup5; lompat ke lup5 jika < 9
		rcall fk_ln; satuan + 06 jika > 9

lup5: 	out sreg,r17; ambil, amankan kembali sreg, uji carry

		brcc lup6; lompat ke lup6 jika C=0
		rcall fk_hn; puluhan + 60 jika C=1
		; rjmp lup7
		lup6: mov r21,r19

		andi r21,0xf0; ambil dgt.puluhan
		cpi r21,0xa0
		brcs lup7; lompat ke lup7 jika pul < a
		rcall fk_hn; pul + 60 jika > 9

lup7: 	out sreg,r16; mengatur carry flag sblm keluar:

		clc; C = 0
		in r16,sreg ;amankan sreg stlh c=0
		cpi r24,0 ;menguji status
		breq lup8
		out sreg,r16;ambil sreg, set c
		sec; C = 1
		in r16,sreg; amankan sreg stlh c=1
lup8: 	out sreg,r16;status akhir
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

fk_hn: 	ldi r21,$60; koreksi dgt.puluhan

		out sreg,r16
		add r19,r21
		in r16,sreg
		adc r24,r24; amankan carry pd r24
ret ; akhir dari prog. subrutin.
