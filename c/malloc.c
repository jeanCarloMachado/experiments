#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

    uint *p;
    p = malloc((sizeof *p) * 20);
    p++;
    printf("%d", p);
    free(p);

    return 0;
}

