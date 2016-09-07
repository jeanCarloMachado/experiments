#include <stdio.h>

#define TOTAL_CHARS 100

int main() {

    int chars[TOTAL_CHARS];
    int i, j, c, count;


    for(i = 0; i < TOTAL_CHARS; i++) {
        chars[i] = 0;
    }


    while((c = getchar()) != EOF) {
        if (c > 'a' && c < 'z') {
            chars[c-'0']++;
        }
    }


    for(i = 0; i < TOTAL_CHARS; i++) {
        count = chars[i];
        if (count == 0) {
            continue;
        }
        putchar(i);
        putchar('=');
        j=0;
        while (j <= count) {
            putchar('-');
            j++;
        }
        putchar('\n');
    }

    return 0;
}

