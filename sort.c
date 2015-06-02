#include<stdio.h>

void swap(int *p, int *q)
{
	int tmp = *p;
	*p = *q;
	*q = tmp;
}

int main()
{
	int a[] = {3, 0, 5, 1, 4, 6, 2, 9, 8, 7};
	
	int i ,j;
	
	for(i = 0; i < 10; i++)
	{
		for(j = i + 1; j < 10;j++)
		{
			if(a[i] > a[j]){
					swap(&a[i], &a[j]);
			}
		}
	}
	
	int k;
	for(k = 0; k < 10; k++)
	{
		printf("%d\n", a[k]);
	}
	
	return 0;
}
