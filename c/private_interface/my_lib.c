#include <stdlib.h>

typedef struct {
    uint foo
} MyType;

uint my_type_get_foo(MyType *my_type)
{
    return my_type->foo;
}

void my_type_set_foo(MyType *my_type, uint foo)
{
    my_type->foo = foo;
}

MyType* my_type_factory()
{
    MyType *type;
    type = malloc(sizeof *type);
    return type;
}
