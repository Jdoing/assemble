.section .data
        format: .asciz "%d\n"
.section .text
.global _start
_start:
        pushl $12
        pushl $format
        call printf
        movl $0, (%esp)
        call exit
