.include "m8535def.inc"
.org 0

rjmp main

main :	ldi r17,low(ramend)
		out spl,r17
		ldi r17,high(ramend)
		out sph,r17

		mov r6,r7
		sub r6,r8
		sbc r5,r1


Akhir :	rjmp Akhir
