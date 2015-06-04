#include<stdio.h>

int main(){
    int data1 = 10;
    int data2 = 20;
    int result;
    
    __asm__ __volatile__(
        "imull %1, %2\n\t"
        "movl %2, %0"
        : "=r"(result)
        : "r"(data1), "r"(data2)
        );
    printf("the answer is %d\n", result);
    return 0;
}
