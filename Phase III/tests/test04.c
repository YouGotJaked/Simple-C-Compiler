char a, b;

int foo(int a, int b)
{
    int x, x;			/* redeclaration of 'x' */
}

char a, b;

int bar(int *b, int *b)	/* redeclaration of 'b' */
{
    int x;
    int *y, y;			/* redeclaration of 'y' */
}
