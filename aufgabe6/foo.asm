; Programm-Bereich in dem wir im vorhinein Speicher reservieren können
section .bss
; Reserviere 1 mal 64bit Speicher
temp:   resq 1

section .text

global bubble_sort
bubble_sort:
	; rdx = ListLength
	
	mov r12, rdx; save list length
	mov r8, rdx ; outer index
	mov r9, 0 ; inner index

outerLoop:
	cmp r8, 1
	je end		
	mov r10, r8
	sub r10, 1
innerLoop:
	cmp r9, r10
	jl outerContinue
	;cmp rax[r9 * 8], rax[r9 + 8 * 1]
	jle innerContinue 	
	
	mov rdx, r9
	mul 8
	mov r11, rax[rdx]
	;mov rax[r9 *8], rax[r9 + 8*1]
	;mov rax[r9 + 8*1], r11	

	
innerContinue:
	inc r9	
	; inner loop end
outerContinue:
	dec r8
end:
    	ret
