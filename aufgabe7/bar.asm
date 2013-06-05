; Programm-Bereich in dem wir im vorhinein Speicher reservieren können
section .bss
; Reserviere 1 mal 64bit Speicher
temp:   resq 1

section .text

global BCD_Convert
BCD_Convert:
	; rdi = Zahl (normal)
	mov rax, 1 ;divisor
	mov rdx, 0
	mov r9, 10;...
	mov r10, 0 ; result
	;move cl, 4
	
; find biggest divisor_10
fd_loop:
	cmp rax, rdi
	mul r9
	jl fd_loop

	mov rdx,0	
	div r9
	div r9 ; wtf warum funzt das ?

loop:
	cmp rax, 1
	je end
	mov r11, rax ; save rax

;----calcs begin!----
		
	mov rdx, 0
	mov rax, rdi
	div r11
	
	mov rdi, rdx ; for next iteration

	mov rsi, rax ; save 0-9
	mov rax, r10
	shl rax, 4
	
	cmp rsi, 9
	jl eight
	mov al, 0x9
	jmp continueLoop
eight:

;----calcs end!----
continueLoop:

	mov rax, r11 ; restore rax
	div r9
	jmp loop

end:
	;mov al, 5
	mov rax, r10
    	ret
