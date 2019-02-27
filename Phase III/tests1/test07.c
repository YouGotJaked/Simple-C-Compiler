int a, b, c;

int bar(int a, int b, int c)
{
    int a;				/* redeclaration of 'a' */

    b;

    {
	int b, c;
    }

    a;
    c;
    d();
    e;					/* 'e' undeclared */
}

int c, b, a, bar(int a, int b, int c);

double bar(int a, int b, int c);		/* conflicting types for 'bar' */
