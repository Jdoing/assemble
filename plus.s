.section .data
		a: .int 10
		b: .int 20
        format: .asciz "%d\n"
.section .text
.global _start
_start:
		movl a, %edx
		addl b, %edx
        pushl %edx
        pushl $format
        call printf
        movl $0, (%esp)
        call exit
