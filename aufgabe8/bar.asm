section .text

; Hier wird NASM gesagt, dass es die beiden Funktionen gibt
extern output
extern input

global brainfuck

brainfuck:
    ; ...

    ; Rufe die Funktion input auf
    call input
    ; Jetzt steht in al der ASCII-Wert des gelesenen Zeichens

    ; ...

    ; Wir wollen ein großes A ausgaben
    mov rdi, 65 ; Statt 65 wäre auch 'A' möglich
    call output