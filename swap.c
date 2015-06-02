#include <stdio.h>

void swap(int *xp, int *yp)
{
	int x = *xp;
	int y = *yp;
	
	*xp = y;
	*yp = x;
}
int main()
{
	int a = 534, b = 1057;
	swap(&a, &b);
	printf("a is %d\n", a);
	printf("b is %d\n", b);
	return 0;
}
