#include <stdio.h>

int main() {
    int currentChar;

    while((currentChar = getchar()) != EOF) {
        if (currentChar == '\t') {
            putchar('\\');
            putchar('b');
            continue;
        }
        if (currentChar == '\\') {
            putchar('\\');
            putchar('\\');
            continue;
        }
        putchar(currentChar);
    }
    return 0;
}

