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

    	; rdi:rsi = float
	; rdx = Char[]

	movlpd [temp], xmm0
	mov r8, [temp]

	mov rax, r8
	shl rax, 62
	shr rax, 63

    	mov [rdx], BYTE 'H'

    	mov [rdx+1], BYTE 'A'

    	mov [rdx+2], BYTE 'L'

    	ret
