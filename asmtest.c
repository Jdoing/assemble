#include<stdio.h>

int a = 10;
int b = 20;
int result;

int main(){
    __asm__ __volatile__(
        "movl a, %eax\n\t"
        "movl b, %ebx\n\t"
        "imull %ebx, %eax\n\t"
        "movl %eax, result\n\t"
        );
    printf("the answer is %d\n", result);
    return 0;
}
