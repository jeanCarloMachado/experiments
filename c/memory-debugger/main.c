#include <stdio.h>
#include <stdlib.h>

#define malloc(n) debug_mem_malloc(n, __FILE__, __LINE__)
#define free(p) debug_mem_free(p, __FILE__, __LINE__)

extern void* debug_mem_malloc(size_t, char *, uint);
extern void debug_mem_free(void*, char *, uint);

int main(int argc, char *argv[]) {

    uint *p;

    p = malloc((sizeof *p) * 20);
    free(p);

    return 0;
}

