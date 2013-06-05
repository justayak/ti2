#include <stdio.h>
#include <inttypes.h>

int BCD_Convert(int32_t);

unsigned int main() {
    // Erstelle Array mit ein paar Zahlen
    int32_t zahl = 3723;
    printf("normal: %u\n", zahl);
    
    int result = BCD_Convert(zahl);
    printf("bcd: %u\n", result);
    return 0;
}
