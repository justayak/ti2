; Programm-Bereich in dem wir im vorhinein Speicher reservieren können
section .bss
; Reserviere 1 mal 64bit Speicher
temp:   resq 1

section .text

global float_to_int
float_to_int:

    ; Kopiere den Fließkomma-Parameter in den reservierten Speicher
    movlpd [temp], xmm0
    ; Kopiere die Zahl aus dem Speicher zurück in das Ganzzahl-Register rax
    mov rax, [temp]

    ret

global float_to_string
float_to_string:
	; rdx = Char[]

	movlpd [temp], xmm0
	mov r9, [temp]

n0:
	mov rax, r9
	shl rax, 0
	shr rax, 63	
	cmp rax, 0
	je null0
	mov [rdx], BYTE '1'
	jmp n1
null0:
	mov [rdx], BYTE '0'	

n1:
	mov rax, r9
	shl rax, 1
	shr rax, 63	
	cmp rax, 0
	je null1
	mov [rdx+1], BYTE '1'
	jmp n2
null1:
	mov [rdx+1], BYTE '0'		
	
n2:
	mov rax, r9
	shl rax, 2
	shr rax, 63	
	cmp rax, 0
	je null2
	mov [rdx+2], BYTE '1'
	jmp n3
null2:
	mov [rdx+2], BYTE '0'	

n3:
	mov rax, r9
	shl rax, 3
	shr rax, 63	
	cmp rax, 0
	je null3
	mov [rdx+3], BYTE '1'
	jmp n4
null3:
	mov [rdx+3], BYTE '0'	
n4:
	mov rax, r9
	shl rax, 4
	shr rax, 63	
	cmp rax, 0
	je null4
	mov [rdx+4], BYTE '1'
	jmp n5
null4:
	mov [rdx+4], BYTE '0'	
n5:
	mov rax, r9
	shl rax, 5
	shr rax, 63	
	cmp rax, 0
	je null5
	mov [rdx+5], BYTE '1'
	jmp n6
null5:
	mov [rdx+5], BYTE '0'	
n6:
	mov rax, r9
	shl rax, 6
	shr rax, 63	
	cmp rax, 0
	je null6
	mov [rdx+6], BYTE '1'
	jmp n7
null6:
	mov [rdx+6], BYTE '0'	
n7:
	mov rax, r9
	shl rax, 7
	shr rax, 63	
	cmp rax, 0
	je null7
	mov [rdx+7], BYTE '1'
	jmp n8
null7:
	mov [rdx+7], BYTE '0'	
n8:
	mov rax, r9
	shl rax, 8
	shr rax, 63	
	cmp rax, 0
	je null8
	mov [rdx+8], BYTE '1'
	jmp n9
null8:
	mov [rdx+8], BYTE '0'	
n9:
	mov rax, r9
	shl rax, 9
	shr rax, 63	
	cmp rax, 0
	je null9
	mov [rdx+9], BYTE '1'
	jmp n10
null9:
	mov [rdx+9], BYTE '0'	
n10:
	mov rax, r9
	shl rax, 10
	shr rax, 63	
	cmp rax, 0
	je null10
	mov [rdx+10], BYTE '1'
	jmp n11
null10:
	mov [rdx+10], BYTE '0'	

n11:
	mov rax, r9
	shl rax, 11
	shr rax, 63	
	cmp rax, 0
	je null11
	mov [rdx+11], BYTE '1'
	jmp n12
null11:
	mov [rdx+11], BYTE '0'		
	
n12:
	mov rax, r9
	shl rax, 12
	shr rax, 63	
	cmp rax, 0
	je null12
	mov [rdx+12], BYTE '1'
	jmp n13
null12:
	mov [rdx+12], BYTE '0'	

n13:
	mov rax, r9
	shl rax, 13
	shr rax, 63	
	cmp rax, 0
	je null13
	mov [rdx+13], BYTE '1'
	jmp n14
null13:
	mov [rdx+13], BYTE '0'	
n14:
	mov rax, r9
	shl rax, 14
	shr rax, 63	
	cmp rax, 0
	je null14
	mov [rdx+14], BYTE '1'
	jmp n15
null14:
	mov [rdx+14], BYTE '0'	
n15:
	mov rax, r9
	shl rax, 15
	shr rax, 63	
	cmp rax, 0
	je null15
	mov [rdx+15], BYTE '1'
	jmp n16
null15:
	mov [rdx+15], BYTE '0'	
n16:
	mov rax, r9
	shl rax, 16
	shr rax, 63	
	cmp rax, 0
	je null16
	mov [rdx+16], BYTE '1'
	jmp n17
null16:
	mov [rdx+16], BYTE '0'	
n17:
	mov rax, r9
	shl rax, 17
	shr rax, 63	
	cmp rax, 0
	je null17
	mov [rdx+17], BYTE '1'
	jmp n18
null17:
	mov [rdx+17], BYTE '0'	
n18:
	mov rax, r9
	shl rax, 18
	shr rax, 63	
	cmp rax, 0
	je null18
	mov [rdx+8], BYTE '1'
	jmp n19
null18:
	mov [rdx+18], BYTE '0'	
n19:
	mov rax, r9
	shl rax, 19
	shr rax, 63	
	cmp rax, 0
	je null19
	mov [rdx+19], BYTE '1'
	jmp n20
null19:
	mov [rdx+19], BYTE '0'	
n20:
	mov rax, r9
	shl rax, 20
	shr rax, 63	
	cmp rax, 0
	je null20
	mov [rdx+20], BYTE '1'
	jmp n21
null20:
	mov [rdx+20], BYTE '0'	

n21:
	mov rax, r9
	shl rax, 21
	shr rax, 63	
	cmp rax, 0
	je null21
	mov [rdx+21], BYTE '1'
	jmp n22
null21:
	mov [rdx+21], BYTE '0'		
	
n22:
	mov rax, r9
	shl rax, 22
	shr rax, 63	
	cmp rax, 0
	je null2
	mov [rdx+22], BYTE '1'
	jmp n23
null22:
	mov [rdx+22], BYTE '0'	

n23:
	mov rax, r9
	shl rax, 23
	shr rax, 63	
	cmp rax, 0
	je null23
	mov [rdx+23], BYTE '1'
	jmp n24
null23:
	mov [rdx+23], BYTE '0'	
n24:
	mov rax, r9
	shl rax, 24
	shr rax, 63	
	cmp rax, 0
	je null24
	mov [rdx+24], BYTE '1'
	jmp n25
null24:
	mov [rdx+24], BYTE '0'	
n25:
	mov rax, r9
	shl rax, 25
	shr rax, 63	
	cmp rax, 0
	je null25
	mov [rdx+25], BYTE '1'
	jmp n26
null25:
	mov [rdx+25], BYTE '0'	
n26:
	mov rax, r9
	shl rax, 26
	shr rax, 63	
	cmp rax, 0
	je null26
	mov [rdx+26], BYTE '1'
	jmp n27
null26:
	mov [rdx+26], BYTE '0'	
n27:
	mov rax, r9
	shl rax, 27
	shr rax, 63	
	cmp rax, 0
	je null37
	mov [rdx+27], BYTE '1'
	jmp n28
null27:
	mov [rdx+27], BYTE '0'	
n28:
	mov rax, r9
	shl rax, 28
	shr rax, 63	
	cmp rax, 0
	je null28
	mov [rdx+28], BYTE '1'
	jmp n29
null28:
	mov [rdx+28], BYTE '0'	
n29:
	mov rax, r9
	shl rax, 29
	shr rax, 63	
	cmp rax, 0
	je null29
	mov [rdx+29], BYTE '1'
	jmp n30
null29:
	mov [rdx+29], BYTE '0'	

n30:
	mov rax, r9
	shl rax, 30
	shr rax, 63	
	cmp rax, 0
	je null30
	mov [rdx+30], BYTE '1'
	jmp n31
null30:
	mov [rdx+30], BYTE '0'	

n31:
	mov rax, r9
	shl rax, 31
	shr rax, 63	
	cmp rax, 0
	je null31
	mov [rdx+31], BYTE '1'
	jmp n32
null31:
	mov [rdx+31], BYTE '0'		
	
n32:
	mov rax, r9
	shl rax, 32
	shr rax, 63	
	cmp rax, 0
	je null32
	mov [rdx+32], BYTE '1'
	jmp n33
null32:
	mov [rdx+32], BYTE '0'	

n33:
	mov rax, r9
	shl rax, 33
	shr rax, 63	
	cmp rax, 0
	je null33
	mov [rdx+33], BYTE '1'
	jmp n34
null33:
	mov [rdx+33], BYTE '0'	
n34:
	mov rax, r9
	shl rax, 34
	shr rax, 63	
	cmp rax, 0
	je null34
	mov [rdx+34], BYTE '1'
	jmp n35
null34:
	mov [rdx+34], BYTE '0'	
n35:
	mov rax, r9
	shl rax, 35
	shr rax, 63	
	cmp rax, 0
	je null35
	mov [rdx+35], BYTE '1'
	jmp n36
null35:
	mov [rdx+35], BYTE '0'	
n36:
	mov rax, r9
	shl rax, 36
	shr rax, 63	
	cmp rax, 0
	je null36
	mov [rdx+36], BYTE '1'
	jmp n37
null36:
	mov [rdx+36], BYTE '0'	
n37:
	mov rax, r9
	shl rax, 37
	shr rax, 63	
	cmp rax, 0
	je null37
	mov [rdx+37], BYTE '1'
	jmp n38
null37:
	mov [rdx+37], BYTE '0'	
n38:
	mov rax, r9
	shl rax, 38
	shr rax, 63	
	cmp rax, 0
	je null38
	mov [rdx+38], BYTE '1'
	jmp n39
null38:
	mov [rdx+38], BYTE '0'	
n39:
	mov rax, r9
	shl rax, 39
	shr rax, 63	
	cmp rax, 0
	je null39
	mov [rdx+39], BYTE '1'
	jmp end
null39:
	mov [rdx+39], BYTE '0'	

end:
    	ret
