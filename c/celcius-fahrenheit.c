#include <stdio.h>

int main()
{
    float celcius, fahrenheit;

    float step, lower, top;

    lower = 0;
    top = 100;
    step = 10;

    celcius = lower;

    while (celcius <= top) {
        fahrenheit = (9.0/5)*(celcius) + 32;
        printf("%f\t%f\n", celcius, fahrenheit);
        celcius+=step;
    }

    return 0;
}
