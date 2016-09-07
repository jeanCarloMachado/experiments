#include <stdio.h>

int main() {
    int test = (getchar() != EOF);
    printf("EOF value: %d", EOF);
    printf("The result is: %d", test);

    return 0;
}

