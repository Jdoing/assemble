.section .data
		a: .int 3
		b: .int 1057
        format: .asciz "%d\n"
.section .text
.global _start
_start:
		pushl %ebp
		movl %esp, %ebp
		subl $8, %esp #allocate storage space
		
		movl a, %edx
		movl %edx, (%esp)
		
		call refact
		
        pushl %eax
        pushl $format
        call printf
        movl $0, (%esp)
        call exit
        
        		
		
refact:
		pushl %ebp
		movl %esp, %ebp
		pushl %ebx
		subl $4, %esp
		
		movl 8(%ebp), %ebx
		movl $1, %eax
		cmpl $1, %ebx
		jle done
		
		leal -1(%ebx), %eax
		movl %eax, (%esp)
		call refact
		imul %ebx, %eax
		
done:
		
		addl $4, %esp
		popl %ebx
		popl %ebp
		ret
		
		
