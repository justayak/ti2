section .text

global BCD_Convert
BCD_Convert:
	; rdi = Zahl (normal)
	mov rax, 1 ;divisor
	mov rdx, 0
	mov r9, 10;...
	mov r10, 0 ; result
	
; find biggest divisor_10
fd_loop:
	cmp rax, rdi
	mul r9
	jl fd_loop

	mov rdx,0	
	div r9
	div r9 

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
	shl rax, 8

	cmp rsi, 9
	jl eight
	mov al, 0x48  ; 1001 0000
	jmp continueLoop
eight:
	cmp rsi, 8
	jl seven
	mov al, 0x40 	;1000 0000
	jmp continueLoop
seven:
	cmp rsi, 7
	jl six
	mov al, 0x70
	jmp continueLoop
six:
	cmp rsi, 6
	jl five
	mov al, 0x60
	jmp continueLoop
five:
	cmp rsi, 5
	jl four
	mov al, 0x50
	jmp continueLoop
four:
	cmp rsi, 4
	jl three
	mov al, 0x40
	jmp continueLoop
three:
	cmp rsi, 3
	jl two
	mov al, 0x30
	jmp continueLoop
two:
	cmp rsi, 2
	jl one
	mov al, 0x20
	jmp continueLoop
one:
	cmp rsi, 1
	jl zero
	mov al, 0x10
	jmp continueLoop
zero:
	mov al, 0x0

;----calcs end!----
continueLoop:
	shr rax, 4
	mov rdx, 0
	mov r10, rax
	mov rax, r11 ; restore rax
	div r9
	jmp loop

end:
	mov rax, r10

    	ret
