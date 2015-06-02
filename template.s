#数据段
.section .data
output:
    .asciz "The output is %d\n"
values:
    .int 1,2,3

#bss段
.section .bss
    .lcomm buffer, 100
    
#文本段
.section .text
.global main
main:
    movl values, %eax
    push %eax
    push $output
    call printf
    
    movl $0, %eax
    movl $1, %eax
    int $0x80

