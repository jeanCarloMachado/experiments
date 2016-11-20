#include <stdio.h>

int main() {

    float var = 1.54334E-34;
    double var2 = 1.54334E-34;

    printf("\n normal:%f\n sci:%e \n or \n sci:%E   \n",var,var,var);
    printf("\n normal:%f\n sci:%e \n or \n sci:%E   \n",var2,var2* 1.0E3 ,var2 * 1.0e3);
    return 0;
}


