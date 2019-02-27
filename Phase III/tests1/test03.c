int a[10], b[10], c[10];

int foo(void)
{
    int a, b;

    c;

    {
	int a, b, c;

	{
	    char x, y, z;
	}

	x;				/* 'x' undeclared */
	c;
    }

    y;					/* 'y' undeclared */
}
