int a, b;
double d;

int main(void) {
	int out, i;
	char c;
	double mean, *dd;

	/* add */
	a = 7;
	b = 393;
	
	out = a + b;
	printf("\n%d+%d=%d\n",a,b,out);

	/* sub */
	a = 50;
	b = 170;
	
	out = a - b;
	printf("\n%d-%d=%d\n",a,b,out);

	/* mul */
	a = 9;
	b = 8;
	
	out = a*b;
	printf("\n%d*%d=%d\n",a,b,out);

	/* div */
	a = 100;
	b = 5;
	
	out = a / b;
	printf("\n%d/%d=%d\n",a,b,out);
	
	out = a / 50;
	printf("\n%d/50=%d\n",a,out);
	
	out = b / 2;
	printf("\n%d/2=%d\n",b,out);
	
	/* rem */
	a = 12;
	b = 7;
	
	out = a % b;
	printf("\n%d%%%d=%d\n",a,b,out);
	
	a = 100;
	
	out = a % b;
	printf("\n%d%%%d=%d\n",a,b,out);
	
	a = 24;
	b = 33;
	
	out = a % b;
	printf("\n%d%%%d=%d\n",a,b,out);

	/* addr */
	
	
	/* neg */
	a = -66;
	
	out = -a;
	printf("\n-(%d)=%d\n",a,out);
	
	/* cast */
	/*
	a = 17;
	b = 5;
	mean = (double) a / b;
	printf("(double) %d / %d = %d", a, b, mean);
	*/

	/* not */
	a = 0;
	
	out = !a;
	printf("\n!%d = %d\n", a, out);

	a = 1;

	out = !a;
	printf("\n!%d = %d\n", a, out);
		

	/* deref */
	/* while */
	/* if */
	/* less than */
	a = 66;
	
	out = a < 10;
	printf("\n%d < 10: %d\n", a, out);
	
	out = a < 90;
	printf("\n%d < 90: %d\n", a, out);
	
	/* greater than */
	b = 21;
	
	out = a > b;
	printf("\n%d > %d: %d\n", a, b, out);
	
	out = b > a;	
	printf("\n%d > %d: %d\n", b, a, out);
	
	/* less or equal */
	out = a <= b;
	printf("\n%d <= %d: %d\n", a, b, out);
	
	a = 21;
	
	out = a <= b;
	printf("\n%d <= %d: %d\n", a, b, out);
	
	/* greater or equal */
	out = a >= b;
	printf("\n%d >= %d: %d\n", a, b, out);
	
	b = 243;
	
	out = b >= a;
	printf("\n%d >= %d: %d\n", b, a, out);
	
	/* equal */
	a = 345;
	b = 345;
	
	out = (a == b);
	printf("\n%d == %d: %d\n", a, b, out);
	
	b = 366;
	
	out = (a == b);
	printf("\n%d == %d: %d\n", a, b, out);

	/* not equal */
	a = 21;
	b = 44;
	
	out = (a != b);
	printf("\n%d != %d: %d\n", a, b, out);
	
	b = 21;
	
	out = (a != b);	
	printf("\n%d != %d: %d\n", a, b, out);
	
	/* logical or */
	a = 1;
	b = 0;
	
	out = a || b;
	printf("\n%d or %d = %d\n", a, b, out);

	a = 0;
	b = 1;

	out = a || b;
	printf("\n%d or %d = %d\n", a, b, out);

	a = 1;
	
	out = a || b;
	printf("\n%d or %d = %d\n", a, b, out);

	a = 0;
	b = 0;
		
	out = a || b;
	printf("\n%d or %d = %d\n", a, b, out);

	/* logical and */
	out = a && b;
	printf("\n%d && %d = %d\n", a, b, out);
	
	a = 1;
	
	out = a && b;
	printf("\n%d && %d = %d\n", a, b, out);
	
	b = 1;
	
	out = a && b;
	printf("\n%d && %d = %d\n", a, b, out);
	
	return 0;
}
