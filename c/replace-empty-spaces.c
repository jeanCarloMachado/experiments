#include <stdio.h>

int main() {
    int currentChar, previousChar;

    while((currentChar = getchar()) != EOF) {
        if (currentChar == ' ' && previousChar == ' ') {
            continue;
        }
        previousChar = currentChar;
        putchar(currentChar);
    }
    return 0;
}

