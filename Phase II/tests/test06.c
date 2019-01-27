int printf();

int main(void)
{
    int a[10];
    int b[10], i;

    i = 0;

    while (i < sizeof(int)) {
	a[i] = b[i];
	i = i + 1;
    }

    printf("%d\n", sizeof(int));
    printf("%d\n", sizeof(int));
}
