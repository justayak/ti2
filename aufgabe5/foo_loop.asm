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
	mov r8, -1 ; counter

loop:
	inc r8
	cmp r8, 64
	je end	
	mov rax, r9
	shl rax, r8
	shr rax, 63	
	cmp rax, 0
	je null0
	mov [rdx + r8], BYTE '1'
	jmp n1
null:
	mov [rdx + r8], BYTE '0'	

end:
    	ret