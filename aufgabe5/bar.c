// Funktionen für Standard-Ein-/Ausgabe einbinden
#include <stdio.h>

// Zahlentypen importieren, die fest definierte Bit-Längen haben
// Wir können damit "int" ersetzen, was auch je nach System nicht immer genau
// 32 bit sein muss…
// Eine Ganzzahl mit garantiert 32bit wäre int32_t, ohne Vorzeichen uint32_t
#include <inttypes.h>

// Funktionen um Strings zu manipulieren (wir benötigen die Funktion memset)
#include <string.h>

// Dies ist die Funktion, die eine 64bit (double precision) IEEE-Zahl entgegen-
// nimmt und einen Integer zurückgibt (natürlich ebenfalls 64bit)
uint64_t float_to_int(double);

// Diese Funktion müsst ihr implementieren
// Sie bekommt die IEEE-Zahl, einen Zeiger auf ein in C angelegten Speicher-
// bereich, in den der String als Bit-Darstellung reingeschrieben werden soll
// Zurückgegeben wird nichts
// Wir garantieren, dass der Speicherbereich >= 64 Zeichen ist, wir also ohne
// Probleme das Bitmuster reinschreiben können
long float_to_string(double, char[]);

// Konstanten definieren
#define SPEICHERGROESSE 65

int main() {
    // Unsere Kommazahl, die dargestellt werden soll
    double kommazahl = 345.2143;

    // Wird die Ganzzahl enthalten
    uint64_t ganzzahl;
    // Lege Speicher für Bit-String an
    char bitdarstellung[SPEICHERGROESSE];
    // Ein String in C endet, wenn das Zeichen mit ASCII-Code 0 gelesen wurde
    // Daher überschreiben wir erstmal alles, was zufällig in dem Speicher
    // liegt mit Nullen
    memset(bitdarstellung, 0, SPEICHERGROESSE);

    // Zur Information erst noch einmal die Kommazahl ausgeben
    printf("Kommazahl  ist: %f\n", kommazahl);

    // Integer aus der Kommazahl "umwandeln", sodass das Bitmuster der IEEE-
    // Zahl als Integer interpretiert wird, und dann ausgeben
    ganzzahl = float_to_int(kommazahl);
    printf("Ganzzahl   ist: %lu\n", ganzzahl);

    unsigned long result = 1;
    // Bitmuster der IEEE-Kommazahl in den reservierten Speicher
    // "bitdarstellung" schreiben und dann ausgeben
    result =float_to_string(kommazahl, bitdarstellung);
    printf("result: %lu\n",result);
    printf("Bit-String ist: %s\n", bitdarstellung);

    return 0; // Wir waren erfolgreich
}
