#include <stdio.h>
#include <stdlib.h>

void* debug_mem_malloc(size_t size, char *file, uint line)
{
    printf("Allocation on line %d", line);
    return malloc(size);
}

void debug_mem_free(void* pointer, char *file, uint line)
{
    printf("\nfreeing on line %d", line);
    return free(pointer);
}

