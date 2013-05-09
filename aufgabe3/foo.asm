section .text
global fibonacci
fibonacci: 
	mov rax, 0
	cmp rdi, 0
	je end
	mov r9, 1
	mov r10, 0
	mov r11, 0  ; index
loop:
	mov rax, 0	
	add rax, r9
	add rax, r10
	mov r9, r10
	mov r10, rax
	inc r11	
	cmp rdi, r11
	je end
	jmp loop
end:
	ret
