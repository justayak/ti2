#include <stdio.h>
#include <stdlib.h>
void brainfuck(char *program,int size);

int main(int argc, char **argv) {
    FILE *program_file;     // Variable, die Brainfuck-Code-Datei 
                            // abstrakt repräsentiert
    //char program[1024];     // Der Brainfuck-Code

    if (argc < 2) {         // wenn weniger als 2 Argumente übergeben wurden
        printf("Usage: %s <program file>", argv[0]);
                            // Fehlermeldung ausgeben
        exit(1);            // Programm beenden
    }
   
    program_file = fopen(argv[1], "r");             // öffne Datei
	fseek(program_file, 0L, SEEK_END); //bewegt Filepointer ans Ende
	int size = ftell(program_file); //zählt Zeichen in File
	char program[size];
	fclose(program_file); //Schließt File
	program_file = fopen(argv[1],"r"); //öffnet File wieder
    while (fread(program, 1, size, program_file));  // lese Datei
   	brainfuck(program,size);     // interpretiere Programm (null-terminiert)
	fclose(program_file);   // schließe Datei
    return 0;               // beende Programm erfolgreich
}
