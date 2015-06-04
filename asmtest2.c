#include<stdio.h>

int main(){
    int data1 = 10;
    int data2 = 20;
    int result;
    
    __asm__ __volatile__(
        "imull %%ebx, %%eax\n\t"
        "movl %%ecx, %%eax"
        : "=a"(result)
        : "d"(data1), "c"(data2)
        );
    printf("the answer is %d\n", result);
    return 0;
}
