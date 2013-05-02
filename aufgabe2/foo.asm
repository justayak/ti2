section .text
global gauss
gauss: 
	mov rax, rdi	
	inc rdi
	mul rdi
	mov rdx, 0	
	mov rdi, 2
	div rdi
	ret
