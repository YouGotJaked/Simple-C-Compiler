double c, d, out;

int main(void) {
	c = 2.2;
	d = 2.0;

	out = c * d * 234.345345 / 323;
	printf("\n%f * %f * 234.345345 / 323 = %f\n", c, d, out);

	out = c / d;
	printf("\n%f / %f = %f\n", c, d, out);
}	
