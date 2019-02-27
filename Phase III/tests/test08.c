int foo(int a, int *b)
{
    b[a] = 1;
    x[a] = 1;			/* 'x' undeclared */
    bar(a, b);
    bar(3);
}

int bar(int x, double y)
{
    foobar();
}

double foobar(void);		/* conflicting types for 'foobar' */
