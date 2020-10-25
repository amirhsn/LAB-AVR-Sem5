.include "m8535def.inc"
.org 0

rjmp main

main : 	ldi r17,low(ramend)
		out spl,r17
		ldi r17,high(ramend)
		out sph,r17
		mov r24,r20
		mov r23,r19
		sub r23,r21
		sbc r24,r22

akhir :	rjmp akhir
