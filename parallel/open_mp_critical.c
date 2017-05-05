#include <stdio.h>
#include <omp.h>

int main(void) {

    int i, thread_id, nloops;
    int glob_nloops, priv_nloops;
    glob_nloops = 0;

#pragma omp parallel private(priv_nloops, thread_id)
{
    priv_nloops=0;
    thread_id = omp_get_thread_num();
#pragma omp for
    for (i=0; i<100000; ++i) {
        ++priv_nloops;
    }

#pragma omp critical
    {
        printf("Thread %d is adding  it's iterations %d to sum  (%d).\n", thread_id, priv_nloops, glob_nloops);
        glob_nloops += priv_nloops;
        printf(" total nloops is now %d.\n", glob_nloops);
    }
}
    printf("Total # loop iterations is %d\n", glob_nloops);
    return 0;
}

