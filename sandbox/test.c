int a, b, *aa;
double d;

double pi(void) {
	return 3.14;
}

int main(void) {
	int out, i, arr[10];
	char c;
	double dout, *dd;

	dout = pi();
	
	printf("\npi()=%f\n",dout);

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
	d = 3.14;
	dout = d * 69;
	printf("\n%f * 69 = %f\n",d,dout);
	
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

	/* neg */
	a = -66;
	
	out = -a;
	printf("\n-(%d)=%d\n",a,out);
	
	dout = -d;
	printf("\n-(%f)=%f\n",d,dout);
	
	/* cast */
	
	a = 17;
	b = 5;

	dout = (double) a / b;
	printf("(double) %d / %d = %f", a, b, dout);

	c = 15;
	a = (int) c;
	printf("\n(int)%c = %d\n",c,a);

	dout = (double) c;
	printf("\b(double)%c = %f\n",c,dout);

	/* not */
	a = 0;
	
	out = !a;
	printf("\n!%d = %d\n", a, out);

	a = 1;

	out = !a;
	printf("\n!%d = %d\n", a, out);
		

	/* deref and addr */
	a = 10;
	aa = &a;
	printf("\nvalue of a: %d\n",*aa);	
	
	/* while */
	i = 0;
	while (i < 20) {
		i = i + 1;
		printf("\n%d\n",i);
	}

	/* if */
	if (a != 0) {
		printf("\n%d != 0",a);
	} else {
		printf("\n%d == 0",a);
	}
	
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

	/* arr */
	i = 0;
	while (i < 8) {
		arr[i] = i;
		i = i + 1;
	}
	
	return 0;
}
