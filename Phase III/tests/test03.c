int a[10], b[10], c[10];

int foo(void)
{
    int a, b;

    c;

    {
	double a, b, c;

	{
	    char x, y, z;
	}

	x;				/* 'x' undeclared */
	c;
    }

    y;					/* 'y' undeclared */
    b;
}
