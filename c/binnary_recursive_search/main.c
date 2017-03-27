#include <stdio.h>
#include <stdlib.h>

void binnary_search(int [], int, int, int);
void bubble_sort(int [], int);

int main(int argc, char *argv[]) {

    int key, size, i;
    int list[25];

    printf("Enter size of a list:");
    scanf("%d", &size);

    printf("Generating random numbers\n");
    for (i = 0;  i < size; i++ ) {

        list[i] = rand() % 100;
        printf("%d\n", list[i]);
    }
    bubble_sort(list, size);
    printf("\n\n");
    printf("Enter a key to search\n");
    scanf("%d", &key);

    binnary_search(list, 0, size - 1, key);

    return 0;
}

void bubble_sort(int list[], int size)
{
    int temp, i, j;
    for (i = 0; i < size; i++) {
        for (j = i;  j < size; j++) {
            if (list[i] > list[j]) {
                temp = list[i];
                list[i] = list[j];
                list[j] = temp;
            }
        }
    }
}

void binnary_search(int list[], int lo, int hi, int key)
{
    int mid;

    if (lo > hi) {
        printf("key not found\n");
        return;
    }

    mid = (lo + hi) / 2;

    if (list[mid] == key) {
        printf("key found\n");
        return;
    } else if (list[mid] > key) {
        binnary_search(list, mid + 1, hi , key);
    } else if(list[mid] < key) {
        binnary_search(list, lo, mid-1, key);
    }
}
