#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define DIMENSIONS 100

double rosenbrock (double solution[], int dimensions)
{
    double total = 0;
    for (int i = 0; i < dimensions-1; i++)
    {
        total=total+100.*pow((solution[i+1] - pow(solution[i],2.)),2) + pow((1. - solution[i]),2);
    }

    return total;
}


int main() {

    double sol[DIMENSIONS];

    for (int i =0; i < DIMENSIONS; i++) {
        sol[i] = -7.875383;
    }

    printf("%f\n",rosenbrock(sol, DIMENSIONS));
    return 0;
}
