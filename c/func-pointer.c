#include <stdio.h>

void my_int_func(int x)
{
    printf("%d\n", x);
}

int main() {

    void (*foo)(int);

    foo = &my_int_func;

    (*foo)(10);

    return 0;
}

