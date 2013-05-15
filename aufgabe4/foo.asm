section .text
global collatz
collatz:
	mov r11, 3 ;const
	mov r10, 2 ; const
	mov r9, 0  ; i
loop:
	cmp rdi, 1
	jle end
	jmp loop
	
	add r9, 1
	
	mov rdx, 0
	mov rax, rdi
	div r10
	cmp rax, 0
	je even
	; ungerade
	mov rax, rdi
	mul r11
	mov rdi, rax
	add rdi, 1
	jmp loop

even:
	mov rdx, 0
	mov rax, rdi
	div r10
	mov rdi, rax
	jmp loop
end:
	mov rax, r9
	ret
