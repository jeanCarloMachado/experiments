#include <stdio.h>
#include "my_lib.h"

int main(int argc, char *argv[]) {

    MyType* type =  my_type_factory();
    my_type_set_foo(type, 666);

    printf("%d", my_type_get_foo(type));

    free(type);
    return 0;
}

