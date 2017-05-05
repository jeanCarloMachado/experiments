#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NTHREADS 5

void *my_fun(void *x) {
    int tid;
    tid = *((int *) x);

    printf("Hi from thread %d", tid);
}

int main(void) {
    pthread_t threads[NTHREADS];
    int thread_args[NTHREADS];
    int rc, i;

    for (i=0; i < NTHREADS ; ++i) {
        thread_args[i] = i;
        printf("spawning thread %d \n", i);

        rc = pthread_create(&threads[i], NULL, my_fun, (void *) &thread_args[i]);
    }

    //wait for threads to finish
    for (i=0; i < NTHREADS ; i++) {
        rc = pthread_join(threads[i], NULL);
    }

    return 0;
}

