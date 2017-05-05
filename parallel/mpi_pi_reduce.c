#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

#define MASTER 0
#define NDARTS 1000
#define NROUNDS 10

double dartboard(int ndarts) {

    double x,y,r,pi;
    int n,hits;
    hits = 0;

    for (n = 1; n < ndarts; n++) {
        r = (double)random()/RAND_MAX;
        x = (2.0 * r) - 1.0;
        r = (double)random()/RAND_MAX;
        y = (2.0 * r) - 1.0;

        if (((x*x) + (y*y)) <= 1.0) {
            hits++;
        }
    }

    pi = 4.0 * (double)hits / (double)ndarts;

    return (pi);
}

int main(int argc, char *argv[]) {

    double my_pi, pi_sum, pi_est, mean_pi, err;
    int task_id, n_tasks, rc, i;
    MPI_Status status;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &n_tasks);
    MPI_Comm_rank(MPI_COMM_WORLD, &task_id);

    srandom (task_id);

    mean_pi = 0.0;

    for (i=0; i < NROUNDS; i++) {
        my_pi = dartboard(NDARTS);

        rc = MPI_Reduce(&my_pi, &pi_sum, 1, MPI_DOUBLE, MPI_SUM, MASTER, MPI_COMM_WORLD);

        if (task_id == MASTER) {
            pi_est = pi_sum / n_tasks; 
            mean_pi =( (mean_pi * i) + pi_est) / (i+1);
            err = mean_pi - 3.14159265358979323846;

            printf("%d throws: mean_i %.12f: error %.12f\n",
                    (NDARTS * (i + 1)), mean_pi, err);
        }

    }

    if (task_id == MASTER)
        printf ("PS, the real value of pi is about 3.14159265358979323846\n");
    MPI_Finalize();

    return 0;
}

