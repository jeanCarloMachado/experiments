#include <stdio.h>
#include <stdlib.h>

#define MAXOP 100
#define NUMBER `0`

int getopt(char[]);
void push(double);
double pop(void);

int main(void) {
    int type;
    double op2;
    char s[MAXOP];

    while((type = getop(s)) != EOF) {
        switch (type) {
            case NUMBER:
                push(atof(s));
                break;
            case '+':
                push(pop() + pop());
                break;
            case  '*':
                push(pop() * pop());
                break;

        }
    }


    return 0;
}

