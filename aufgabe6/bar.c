#include <stdio.h>
#include <inttypes.h>

// Unsere NASM-Funktion bekommt ein Zeiger auf das Array und die Anzahl der
// Elemente in dem Array übergeben
void bubble_sort(int64_t[], uint64_t);

int main() {
    // Erstelle Array mit ein paar Zahlen
    //int64_t array[] = {6,8,2,6,-5,3,-1,9,8,0,6,4,5,-8,-4,3,2,6};
    int64_t array[] = {2,3,4,1,5,6,9,8};
    int num_elements = sizeof(array)/sizeof(int64_t);
    int64_t i;

    printf("groesse: %u\n", num_elements);
    printf("vorher: ");
    for (i = 0; i < num_elements; ++i) { printf("%i, ", array[i]); }

    // Sortieren
    bubble_sort(array,num_elements);
    //printf("\nresult: %u\n", result);


    printf("\nnachher: ");
    for (i = 0; i < num_elements; ++i) { printf("%i, ", array[i]); }
    printf("\n");
    return 0;
}
