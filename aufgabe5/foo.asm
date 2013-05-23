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
	mov cl, -1 ; counter for shift
	mov r8, -1 ; counter for array

loop:
	inc cl
	inc r8
	cmp cl, 64
	je end	
	mov rax, r9
	shl rax, cl
	shr rax, 63	
	cmp rax, 0
	je null
	mov [rdx + r8], BYTE '1'
	jmp loop
null:
	mov [rdx + r8], BYTE '0'	
	jmp loop

end:
    	ret
