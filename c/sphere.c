#include <stdio.h>
#include <stdlib.h>

#define DIMENSIONS 2

double sphere(double x[], int d);

int main(int argc, char* argv[]) {

    double result;
    double positions[DIMENSIONS];

    for(int i = 0; i < DIMENSIONS ; i++) {
        positions[i] = atof(argv[i]);
    }

    result = sphere(positions, 1);
    printf("Result: %f", result);
    return 0;
}


double sphere(double x[], int d)
{
    double total = 0;

    for (int i = 0; i < DIMENSIONS; i++) {
        total+= x[i] * x[i];
    }

    return total;
}
