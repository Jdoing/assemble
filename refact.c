#include<stdio.h>
int refact(int n){
	if(n == 1)
		return 1;
	else
		return n * refact(n - 1);
}

int main(){
	int a = 4;
	printf("%d\n", refact(a));
	return 0;
}
