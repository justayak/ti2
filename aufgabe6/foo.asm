; Programm-Bereich in dem wir im vorhinein Speicher reservieren können
section .bss
; Reserviere 1 mal 64bit Speicher
temp:   resq 1

section .text

global bubble_sort
bubble_sort:
	; rdx = ListLength
	
	mov rsi, rax; save list
	mov r12, rdx; save list length
	mov r8, rdx ; outer index
	mov r9, 0 ; inner index
	mov r13, 8 ; const 8

	mov rcx, 0 ; debug

outerLoop:
	cmp r8, 1
	je end		
	mov r10, r8
	sub r10, 1	
innerLoop:
	cmp r9, r10
	jg outerContinue
	
	add rcx, 1	

	mov rax, r9
	mul r13	
	
	mov r15, [rsi + rax] 
	mov rbx, [rsi + rax + 8]	
	cmp r15, rbx
	;jle innerContinue
	jge innerContinue 	

	mov r11, [rsi + rax ] ;r11 = temp
	;mov [rsi + rax], [rsi + rax + 8]
	mov rbx, [rsi + rax + 8] ; hier ist der bug..
	mov [rsi + rax], rbx
	mov [rsi + rax + 8], r11
	
	
innerContinue:
	inc r9	
	jmp innerLoop
	; inner loop end
outerContinue:
	mov r9, 0
	dec r8
	jmp outerLoop
end:

	mov rax, rcx
    	ret
