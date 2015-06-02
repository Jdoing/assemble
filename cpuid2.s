.section .data

#x是占位符
output:
    .asciz "The processor Vendor ID is: %s\n"

.section .bass
    .lcomm buffer, 12

#_start和output都是标签
.section .text

#如果用gcc编译的话,_start要改为main
.global main
main:
    movl $0, %eax
    cpuid
    movl $buffer, %edi
    movl %ebx, (%edi)
    movl %edx, 4(%edi)
    movl %ecx, 8(%edi)
    pushl $buffer
    pushl $output
    call printf
    addl $8, %esp
    pushl $0
    call exit
