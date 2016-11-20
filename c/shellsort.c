#include <stdio.h>

void shellsort(int v[], int n)
{
    int gap, i, j, temp;

    for (gap = n/2; gap > 0; gap /= 2)
        for (i = gap; i < n; i++)
            for (j=i-gap; j >= 0 && v[j] > v[j+gap]; j-=gap) {
                temp = v[j];
                v[j] = v[j+gap];
                v[j+gap] = temp;
            }
}

int main() {

    int data[8] = {991,344,234,1412,3413,412,34, 33332};

    shellsort(data, 8);

    printf("%d", data[0]);
    return 0;
}


