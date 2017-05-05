#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

FILE *file_handle;
char command[1000] = "echo -e '\nset term png\n set output \"result.png\" \n \0";

void register_function(int column, char* string)
{
    char tmp[200];

    if (column == 1) {
        sprintf(tmp, "plot \"results\" using 1 title  \"%s\"  with lines, ", string);
    } else {
        sprintf(tmp, "\"\" using %d title \"%s\" with lines, ", column, string);
    }

    strcat(command, tmp);    
}

void exercise_2(void)
{
    register_function(1, "pow(2,n) * n");
    register_function(2, "pow(2,n) * n + pow(2,n) - 1");
    for (int n = 0; n < 20; n++) {
        fprintf(file_handle, "%f %f\n", pow(2,n) * n, pow(2,n) * n + pow(2,n) - 1);
    }
}


unsigned long  factorial(unsigned long  n)
{
    if (n == 0) {
        return 1;
    }

    return n*factorial(n-1);
}

void o_notation_defaults(void)
{
    register_function(1, "O(log n)");
    register_function(2, "O(n)");
    register_function(3, "O(!n)");
    for (int n = 0; n < 6; n++) {
        fprintf(file_handle, "%f %d %i\n", log(n), n, factorial(n));
    }
}

int main(int argc, char *argv[]) {

    file_handle = fopen("results", "w");
    if (file_handle == NULL)
    {
        printf("Error opening file!\n");
        exit(1);
    }


   //exercise_2();
   o_notation_defaults();

   fclose(file_handle);


   strcat(command, "' | gnuplot");
   /* printf("test %s", command); */
   system(command);


    return 0;
}

