int a, b(void), c(void);
char *b(void), d(void);		/* conflicting types for 'b' */
int c(void), d(void), e(void);	/* conflicting types for 'd' */

int y[10];
int x, y[5];			/* conflicting types for 'y' */
int x;
int x[10];			/* conflicting types for 'x' */

int foo(void);

int foo(void)
{
    a = z;			/* 'z' undeclared */
}

int foo(void);
int *e(void);			/* conflicting types for 'e' */

double foo(int x);		/* conflicting types for 'foo' */

int foo(void) {			/* redefinition of 'foo' */
}
