#include <stdio.h>

#define TOTAL_LENGTHS 100

int main() {

    int words_lenghts[TOTAL_LENGTHS];
    int i, j, c, count, current_counting;


    for(i = 0; i < TOTAL_LENGTHS; i++) {
        words_lenghts[i] = 0;
    }


    current_counting=0;
    while((c = getchar()) != EOF) {
        if (c == ' ' || c == '\n') {
            words_lenghts[current_counting]++;
            current_counting=0;
            continue;
        }

        current_counting++;
    }


    for(i = 0; i < TOTAL_LENGTHS; i++) {
        count = words_lenghts[i];
        if (count == 0) {
            continue;
        }
        putchar(i + '0');
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

