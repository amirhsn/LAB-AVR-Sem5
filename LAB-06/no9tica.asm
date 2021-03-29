.include"m8535def.inc"
.org 0
rjmp main 
main: 	ldi r20, low(ramend)
		out spl, r20
		ldi r20, high(ramend)
		out sph, r20
		ldi r20,0x0ff
		out ddrc,r20
		ldi r20,0x0ff
		out ddra,r20
		ldi zl,low(kar*2)
		ldi zh,high(kar*2)
itu:	ldi r25,0
ini:	mov zl,r25
		lpm r17,z
		out porta,r17
		rcall tunda
		ldi r20,0
sini:	mov zl,r20
		lpm r24,z
		out portc,r24
		rcall tunda
		inc r20
		cpi r20,8
		brne sini
		inc r25
		cpi r25,8
		brne ini
		RJMP itu
akhir: 	rjmp akhir
;====================================
tunda : ldi r21,3
l21:	ldi r22,0
l22:	ldi r23,0
l23:	dec r23
		brne l23
		dec r22
		brne l22
		dec r21
		brne l21
	ret
;====================================
.org $80
KAR :
.db $3f,$06,$5b,$4f,$66,$6d,$7d,$07
