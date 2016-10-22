#include <stdio.h>

float celcius_to_farenheit(float);

int main()
{
    float celcius, fahrenheit;

    float step, lower, top;

    lower = 0;
    top = 100;
    step = 10;

    celcius = lower;

    while (celcius <= top) {
        fahrenheit =  celcius_to_farenheit(celcius);
        printf("%f\t%f\n", celcius, fahrenheit);
        celcius+=step;
    }

    return 0;
}

float celcius_to_farenheit(float celcius)
{
    return (9.0/5)*(celcius) + 32;
}
