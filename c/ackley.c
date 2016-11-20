#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define DIMENSIONS 1

double ackley (double solution[])
{

    int i;
    double aux, aux1, result;


    for (i = 0; i < DIMENSIONS; i++)
    {
        aux += solution[i]*solution[i];
    }
    for (i = 0; i < DIMENSIONS; i++)
    {
        aux1 += cos(2.0*M_PI*solution[i]);
    }

    return aux+aux1;

    return result;
}


int main() {

    double sol[DIMENSIONS];

    sol[0] = 0.000100;
    ackley(sol);
    ackley(sol);
    ackley(sol);
    printf("%f\t%f\n", sol[0], ackley(sol));
    printf("%f\t%f\n", sol[0], ackley(sol));
    printf("%f\t%f\n", sol[0], ackley(sol));
    return 0;
}
