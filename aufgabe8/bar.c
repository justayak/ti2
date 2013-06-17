#include <stdio.h>
#include <sys/stat.h>
#include <stdlib.h>

// Definiere die Größe des Speichers, auf der wir arbeiten
#define MEMORY_SIZE 40000

// Definiere zwei Funktionen, die in Nasm aufgerufen werden können um ein
// Zeichen einzulesen bzw. auszugeben
extern void output(char c) {
    putc(c, stdout);
    fflush(stdout);
}
extern char input() {
    return getc(stdin);
}

// Definition unserer Nasm-Funktion
extern void brainfuck(char[], char[]);

int main(int argc, char *argv[]) {
    // Wir wollen genau einen Kommandozeilenparameter
    if (argc != 2) {
        printf("Usage: %s brainfuck-file.bf\n", argv[0]);
        return 0;
    }

    // Wir gucken, wie groß die Datei ist, wie viel Speicher wir also für das
    // Programm brauchen
    struct stat st;
    stat(argv[1], &st);
    // Hole dir Speicher
    char* program = malloc(st.st_size + 1);
    if (program == NULL) {
        fprintf(stderr, "Kann keinen Programmspeicher reservieren.\n");
        return 1;
    }

    // Wir brauchen auch noch Speicher auf dem das Brainfuck-Programm arbeiten
    // kann
    char* memory = calloc(MEMORY_SIZE, 1);
    if (memory == NULL) {
        fprintf(stderr, "Kann keinen Datenspeicher reservieren.\n");
        return 1;
    }

    // Jetzt lesen wir das Programm ein
    FILE *f;
    if (!(f = fopen(argv[1], "rb"))) {
        fprintf(stderr, "Konnte Datei %s nicht zum Lesen öffnen.\n", argv[1]);
        return 1;
    }
    if (fread(program, 1, st.st_size, f) != st.st_size) {
        fprintf(stderr, "Konnte Datei %s nicht komplett einlesen.\n", argv[1]);
        return 1;
    }
    fclose(f);

    // Programm endet mit einem Nullbyte
    program[st.st_size] = 0;

    // Führe die Nasm-Funktion aus
    brainfuck(program, memory);

    return 0;
}