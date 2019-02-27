#include <stdio.h>

int global;

int main(void)
{
    char c, a[5], *p;

    p = c + a;
    p = p - c;

    double d;
    int i;

    printf("d=%lu bytes\ni=%lu bytes\n", sizeof(d), sizeof(i));
}
