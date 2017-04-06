#include <stdio.h>
#include <stdlib.h>

#define TABLE_SIZE 2

void display_boolean_table(char *vector, int iterator, int size)
{
    int i;

    if (iterator > 0) {
        vector[size-iterator] = '0';
        display_boolean_table(vector, iterator-1, size);
        vector[size-iterator] = '1';
        display_boolean_table(vector, iterator-1, size);
    } else {
        for (i=0; i < size; i++) {
            printf("%c", vector[i]);
            printf("\n");
        }
    }
}

int main(int argc, char *argv[]) {
    char* vector;
    vector = malloc(sizeof (char) * TABLE_SIZE);
    display_boolean_table(vector, TABLE_SIZE, TABLE_SIZE);
    free (vector);
    return 0;
}
