#include <stdio.h>

int main() {
    int currentChar;

    while((currentChar = getchar()) != EOF) {
        putchar(currentChar);
        putchar('\n');
    }
    return 0;
}

