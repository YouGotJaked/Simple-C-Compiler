#include <stdio.h>

int global;
int arr[10];
char **pp;
double d[2];

int main(void)
{
    char c, a[5], *p;

    p = c + a;
    p = p - c;

    double d;
    int i;

    printf("d=%lu bytes\ni=%lu bytes\n", sizeof(d), sizeof(i));
}
