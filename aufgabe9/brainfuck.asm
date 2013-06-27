section .bss
loc: resq 1;(Speicherzellen)

section .text
extern putchar
extern getchar
global brainfuck

brainfuck:
	mov	r11,rsi ;Max länge Array(2.Paramter)
	mov	r10,rdi	;String laden(1.Paramteter)
	mov	r9,0	;index String
	mov	rbx,0	;speicherzelleninde

interpret: ;vergleicht den String, welcher Char eingelesen wird und spring zu desen verarbeitungscode
	cmp	byte [r10+r9],'+'
	je	plus
	cmp	byte [r10+r9],'-'
	je	minus
        cmp     byte [r10+r9],'>'
        je      zeigerInc
        cmp     byte [r10+r9],'<'
        je      zeigerDec
        cmp     byte [r10+r9],'.'
        je      out
        cmp     byte [r10+r9],','
        je      in
        cmp     byte [r10+r9],'['
        je      startLoop
	cmp	byte [r10+r9],']'
	je	endLoop
next:
	inc	r9	;erhöht Stringindex
	cmp	r9,r11	;prüft, ob String zu ende, wenn nicht Char vergleichen
	jne	interpret
	ret 

plus:
	mov	r14,1	;r14 auf 1 setzen
	add	[loc+rbx],r14 ;Speicherzelle erhöhen um 1
	jmp	next
minus:
	mov	r14,1
	sub	[loc+rbx],r14 ;Speicherzelle verringern um 1
	jmp	next
zeigerInc:
	mov	r14,1
	add	rbx,r14 ;Speicherindex erhöhen um 1
	jmp	next
zeigerDec:
        mov     r14,1
        sub     rbx,r14;Speicherindex verringern um 1
	jmp	next

;pusht alle Register auf Stack, call getchar, Ergbenis aus rsi nach aktuelle Zelle speichern
in:
	push    rax
        push    rbx
        push    rcx
        push    r9
        push    r10
        push    r11
        push    r14
	call	getchar
        mov     [loc+rbx],rsi
        pop     r14
        pop     r11
        pop     r10
        pop     r9
        pop     rcx
        pop     rbx
        pop     rax
        jmp     next

startLoop:
	cmp	byte [loc+rbx],0 ;prüft, ob Zelle 0 wenn ja Schleife überspringen
        je      loopNext
        mov     rcx, r9 ;Stringindex speichern
        jmp     next
loopNext:
        inc     r9      ;um nächsten Char zu bekommen
        cmp     byte [r10+r9],']' ;prüft, ob Schleife fertig, wenn nein nächste Char lesen
        jne     loopNext
	jmp 	next
	
endLoop:
	mov	r9,rcx ;Stringindex zurückschreiben
	cmp	byte [loc+rbx],0 ;prüfen, ob Zelle 0 wenn nein nochmal durchlaufen
	jle	startLoop
	jmp 	next

;alle benutzten Register auf Stack pushen, aktuelle SPeicherstelleninhalt in rdiund putchar aufrufen. Am Ende alle Register wieder pop
out:
	push	rax
	push	rbx
	push	rcx
	push	r9
	push	r10
	push	r11
	push	r14
	mov	rdi,[loc+rbx]
	call 	putchar
	pop	r14
	pop	r11
	pop	r10
	pop	r9
	pop	rcx
	pop	rbx
	pop	rax
	jmp 	next
